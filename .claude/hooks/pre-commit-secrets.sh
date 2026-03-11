#!/bin/bash
# Pre-commit hook: scans staged files for hardcoded secrets
# Install: ln -s $(pwd)/.claude/hooks/pre-commit-secrets.sh .git/hooks/pre-commit
#
# Patterns checked:
#   - AWS access keys (AKIA...)
#   - Private keys (BEGIN PRIVATE KEY)
#   - Generic high-entropy secrets in assignments
#   - Connection strings with embedded credentials
#   - Common API token patterns (ghp_, xoxb-, sk-)
#
# Exit 0 = clean, Exit 1 = secrets found (blocks commit)

set -euo pipefail

RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM 2>/dev/null)

if [ -z "$STAGED_FILES" ]; then
  exit 0
fi

FOUND=0

check_pattern() {
  local pattern="$1"
  local description="$2"
  local matches

  matches=$(echo "$STAGED_FILES" | xargs grep -lnE "$pattern" 2>/dev/null || true)

  if [ -n "$matches" ]; then
    if [ "$FOUND" -eq 0 ]; then
      echo -e "${RED}=== Secret Scan Failed ===${NC}"
      echo ""
    fi
    FOUND=1
    echo -e "${YELLOW}[$description]${NC}"
    echo "$STAGED_FILES" | xargs grep -nE "$pattern" 2>/dev/null | head -20
    echo ""
  fi
}

# AWS Access Keys
check_pattern "AKIA[0-9A-Z]{16}" "AWS Access Key"

# AWS Secret Keys (in assignments)
check_pattern "aws_secret_access_key\s*[=:]\s*['\"]?[A-Za-z0-9/+=]{40}" "AWS Secret Key"

# Private Keys
check_pattern "BEGIN (RSA |EC |DSA |OPENSSH )?PRIVATE KEY" "Private Key"

# Generic password/secret assignments with actual values (not references/variables)
check_pattern "(password|passwd|secret|api_key|apikey|api_secret|access_token)\s*[=:]\s*['\"][^'\"$\{]{8,}['\"]" "Hardcoded Secret"

# Connection strings with credentials
check_pattern "(mongodb|postgres|mysql|redis|amqp)://[^:]+:[^@]+@" "Connection String with Credentials"

# GitHub Personal Access Tokens
check_pattern "ghp_[A-Za-z0-9]{36}" "GitHub PAT"

# Slack tokens
check_pattern "xox[bporas]-[A-Za-z0-9-]+" "Slack Token"

# OpenAI / Anthropic / Stripe API keys
check_pattern "(sk-[A-Za-z0-9]{20,}|sk-ant-[A-Za-z0-9-]{20,}|sk_live_[A-Za-z0-9]{20,})" "API Key (OpenAI/Anthropic/Stripe)"

# JWT tokens (three base64 segments)
check_pattern "eyJ[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}" "JWT Token"

if [ "$FOUND" -ne 0 ]; then
  echo -e "${RED}Commit blocked: potential secrets detected in staged files.${NC}"
  echo ""
  echo "Options:"
  echo "  1. Remove the secrets and use environment variables or a secret manager"
  echo "  2. If these are false positives, commit with: git commit --no-verify"
  echo ""
  exit 1
fi

exit 0
