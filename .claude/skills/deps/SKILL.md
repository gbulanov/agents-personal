---
name: deps
description: Dependency management — vulnerability scanning, upgrade planning, license compliance, staleness audit
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: audit|outdated|licenses|upgrade-plan> [path]"
---

# Dependency Manager

Action: $ARGUMENTS

## Actions

### `audit` [path]
Scan for known vulnerabilities:
1. Detect package manager (npm, pip, go, terraform)
2. Run appropriate audit command (`npm audit`, `pip-audit`, `govulncheck`)
3. Categorize by severity
4. Identify which are direct vs transitive
5. Recommend fix versions

### `outdated` [path]
Check for stale dependencies:
1. Run `npm outdated` / `pip list --outdated` / `go list -m -u all`
2. Categorize: patch, minor, major updates available
3. Flag abandoned packages (no updates in 2+ years)
4. Flag deprecated packages with replacements
5. Rank by update priority

### `licenses` [path]
License compliance check:
1. List all dependencies and their licenses
2. Flag copyleft licenses (GPL, AGPL) in proprietary projects
3. Flag missing or UNKNOWN licenses
4. Check license compatibility
5. Generate license summary report

### `upgrade-plan` <package> [target-version]
Plan a dependency upgrade:
1. Check changelog for breaking changes
2. Identify co-dependent packages needing upgrade
3. Estimate risk level
4. Suggest upgrade order
5. Recommend testing strategy
6. Provide rollback steps
