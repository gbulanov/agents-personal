---
name: tech-debt
description: Technical debt assessment — dependency staleness, code quality issues, coverage gaps, performance hotspots
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "[project-path or scope]"
---

# Tech Debt Assessment (Composite)

Scope: $ARGUMENTS

Assess technical debt across a project. Quantify and prioritize.

## Step 1: Dependency Health
1. Check for outdated dependencies (`npm outdated`, `pip list --outdated`)
2. Check for known vulnerabilities (`npm audit`, `pip-audit`)
3. Identify abandoned or deprecated packages
4. Flag major version updates available

## Step 2: Code Quality
1. Find TODO/FIXME/HACK comments and count them
2. Identify large files (>500 lines) and complex functions (>50 lines)
3. Check for duplicated code patterns
4. Look for deprecated API usage
5. Check for `any` types (TypeScript), bare `except` (Python)

## Step 3: Test Coverage Gaps
1. Identify untested modules/packages
2. Check test-to-code ratio
3. Find critical paths without tests
4. Check for test quality issues (no assertions, commented-out tests)

## Step 4: Performance Hotspots
1. Check for N+1 query patterns
2. Check for missing caching
3. Check for synchronous operations that should be async
4. Check bundle size (frontend projects)

## Step 5: Architecture Concerns
1. Circular dependencies between modules
2. God classes/modules (too many responsibilities)
3. Missing abstractions (same pattern repeated >3 times)
4. Dead code (unused exports, unreachable branches)

## Output

```
## Tech Debt Report: [project]

### Debt Score: X/10 (lower is better)

### Summary
| Category | Items | Severity | Effort |
|----------|-------|----------|--------|
| Dependencies | X outdated, Y vulnerable | ... | ... |
| Code Quality | X issues | ... | ... |
| Test Gaps | X untested modules | ... | ... |
| Performance | X hotspots | ... | ... |
| Architecture | X concerns | ... | ... |

### Top 10 Action Items (by impact/effort ratio)
| # | Item | Impact | Effort | Category |
|---|------|--------|--------|----------|
| 1 | ... | High | Low | ... |

### Quick Wins (high impact, low effort)
1. [specific change]

### Strategic Debt (plan for next quarter)
1. [larger refactoring]
```
