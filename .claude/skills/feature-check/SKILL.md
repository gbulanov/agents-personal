---
name: feature-check
description: Pre-push feature validation — generate missing tests, lint, type-check, and build verification
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "[branch or changed-files]"
---

# Feature Check (Composite)

Scope: $ARGUMENTS

Validate a feature branch before pushing. Checks all changed files and ensures quality.

## Step 1: Identify Changes
```bash
git diff main...HEAD --stat
git diff main...HEAD --name-only
```

## Step 2: Test Coverage
For each changed file:
1. Check if corresponding test file exists
2. If missing, generate tests for new/changed functions
3. If existing, verify tests cover the changes

## Step 3: Lint Check
Detect language and run appropriate linter:
- TypeScript/JavaScript: ESLint
- Python: ruff
- Go: golangci-lint
- Rust: clippy
- Java: checkstyle/spotbugs

## Step 4: Type Check
Run type checker if applicable:
- TypeScript: `tsc --noEmit`
- Python: `mypy`
- Check for `any` types in TypeScript changes
- Check for missing type hints in Python changes

## Step 5: Build Verification
Ensure the project builds:
- `npm run build` / `pnpm build`
- `go build ./...`
- `cargo build`
- `mvn compile` / `gradle build`

## Output

```
## Feature Check: [branch]

### Changes: X files, +Y/-Z lines

### Tests
- New tests needed: X
- Tests generated: Y
- Coverage: ✅/❌

### Lint: ✅ PASS / ❌ X issues

### Types: ✅ PASS / ❌ X errors

### Build: ✅ PASS / ❌ FAIL

### Verdict: Ready to push / Fix needed
```
