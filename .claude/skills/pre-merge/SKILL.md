---
name: pre-merge
description: Pre-merge checklist — code review + security audit + secret scan as a quality gate before merging
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "[PR number or branch]"
---

# Pre-Merge Review (Composite)

Target: $ARGUMENTS

Run a comprehensive pre-merge quality gate. Analyze all changes in the PR or branch diff.

## Step 1: Identify Changes
```bash
# If PR number given
gh pr diff <number>
gh pr view <number> --json files,additions,deletions

# If branch given
git diff main...HEAD --stat
git diff main...HEAD
```

## Step 2: Code Review
For each changed file, check:
- Logic correctness — does the code do what it intends?
- Error handling — are errors caught and handled appropriately?
- Edge cases — empty inputs, nulls, boundary values
- Performance — O(n²) loops, unnecessary allocations, missing pagination
- Naming — clear, consistent with codebase conventions
- Complexity — functions under 30 lines, low nesting depth

## Step 3: Security Audit
Check changed code for:
- SQL injection (string concatenation in queries)
- XSS (unescaped user input in HTML)
- Command injection (user input in shell commands)
- Path traversal (user input in file paths)
- Insecure deserialization
- Hardcoded secrets or credentials
- Missing authentication/authorization checks
- Overly permissive CORS or security headers

## Step 4: Secret Scan
Scan the diff for:
- AWS keys (AKIA pattern)
- API tokens, passwords, private keys
- Connection strings with credentials
- Tokens in test fixtures that might be real
**Never output actual values.**

## Step 5: Test Coverage
- Are new functions/paths covered by tests?
- Do existing tests still pass conceptually with the changes?
- Are edge cases tested?

## Output

```
## Pre-Merge Review: [target]

### Gate Status: ✅ PASS / ❌ FAIL / ⚠️ NEEDS ATTENTION

### Changes Summary
- Files changed: X
- Additions: +Y lines
- Deletions: -Z lines

### Code Review
| File | Finding | Severity | Line |
|------|---------|----------|------|

### Security
| Issue | File:Line | Severity | Fix |
|-------|-----------|----------|-----|

### Secrets
[Clean / Findings listed]

### Test Coverage
- New code covered: ✅/❌
- Edge cases tested: ✅/❌

### Verdict
[Approve / Request changes / Needs discussion]
Blockers: [list if any]
```
