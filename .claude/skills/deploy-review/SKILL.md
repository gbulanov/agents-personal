---
name: deploy-review
description: Pre-deployment review — runs infra-review + compliance + secrets scan + cost-review as a comprehensive gate
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "[path or scope]"
---

# Deploy Review (Composite)

Scope: $ARGUMENTS

Run a comprehensive pre-deployment review by checking all critical dimensions. Execute each section in order and produce a unified report.

## Step 1: Infrastructure Review
Review all IaC files (Terraform, K8s manifests, Helm charts, Dockerfiles) in scope:
- Security misconfigurations
- Reliability gaps (no HA, no health checks, no resource limits)
- Missing best practices

## Step 2: Compliance Check
Check against applicable frameworks:
- CIS AWS Foundations (if AWS resources)
- CIS Kubernetes (if K8s manifests)
- Basic SOC2 controls (access, logging, encryption)
Flag any non-compliant resources.

## Step 3: Secret Scan
Scan code and config for hardcoded secrets:
- AWS keys, API tokens, passwords, private keys
- Connection strings with credentials
- Git history for previously committed secrets
**Never output actual secret values.**

## Step 4: Cost Review
Identify cost optimization opportunities:
- Over-provisioned instances or pods
- Missing reserved capacity
- Unused resources
- Expensive architecture choices with cheaper alternatives

## Output: Unified Report

```
## Deploy Review: [scope]

### Gate Status: ✅ PASS / ❌ FAIL / ⚠️ WARNINGS

### Infrastructure
| Finding | Severity | File | Fix |
|---------|----------|------|-----|

### Compliance
| Control | Status | Remediation |
|---------|--------|-------------|

### Secrets
| Type | Location | Action |
|------|----------|--------|

### Cost
| Opportunity | Current | Recommended | Savings |
|-------------|---------|-------------|---------|

### Summary
- Critical blockers: X
- Warnings: Y
- Cost savings: $Z/month
- Recommendation: [deploy / fix first / review required]
```
