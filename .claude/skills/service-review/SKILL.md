---
name: service-review
description: Full service quality gate — code review + test coverage + performance + security + API review
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "[service-path or directory]"
---

# Service Review (Composite)

Scope: $ARGUMENTS

Run a comprehensive quality review of an application service. Execute each section and produce a unified report.

## Step 1: Code Quality
Review code for:
- Architecture: proper layering, separation of concerns
- Error handling: consistent, no swallowed exceptions
- Naming: clear, consistent, descriptive
- Complexity: functions under 30 lines, low nesting
- Language-specific idioms and best practices

## Step 2: Test Coverage
Analyze testing:
- Test pyramid balance (unit/integration/E2E)
- Coverage gaps in business logic
- Test quality: meaningful assertions, not just "it runs"
- Missing edge case tests

## Step 3: Performance
Check for common performance issues:
- N+1 queries, missing indexes
- Unnecessary allocations, memory leaks
- Missing caching for expensive operations
- Bundle size (frontend)

## Step 4: Security
Scan for vulnerabilities:
- SQL injection, XSS, command injection
- Hardcoded secrets
- Missing authentication/authorization checks
- Insecure dependencies

## Step 5: API Review (if applicable)
Check API endpoints:
- Consistent naming and HTTP methods
- Proper status codes and error format
- Pagination on list endpoints
- Input validation

## Output

```
## Service Review: [name]

### Overall: ✅ GOOD / ⚠️ NEEDS WORK / ❌ ISSUES

| Dimension | Score | Key Finding |
|-----------|-------|-------------|
| Code Quality | A-F | ... |
| Test Coverage | A-F | ... |
| Performance | A-F | ... |
| Security | A-F | ... |
| API Design | A-F | ... |

### Critical Issues
1. [must fix before deploy]

### Improvements
1. [recommended change]

### Strengths
1. [things done well]
```
