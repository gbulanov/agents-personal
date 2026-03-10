#!/bin/bash
# Pre-tool-use hook: blocks edits to protected files
# Register in settings.json under PreToolUse for Edit|Write tools
#
# Exit codes:
#   0 = allow the action
#   2 = block the action (stderr shown to Claude as feedback)

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty' 2>/dev/null)

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# Protected file patterns — add your own
PROTECTED_PATTERNS=(
  ".env"
  ".env.local"
  ".env.production"
  "package-lock.json"
  "yarn.lock"
  "pnpm-lock.yaml"
)

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$(basename "$FILE_PATH")" == "$pattern" ]]; then
    echo "Blocked: cannot edit protected file '$FILE_PATH'" >&2
    exit 2
  fi
done

exit 0
