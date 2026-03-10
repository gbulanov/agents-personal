---
name: pipeline
description: CI/CD pipeline operations — debug failures, author workflows, review configs for GitHub Actions, ArgoCD, Jenkins
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: debug|review|create|status> [target]"
---

# Pipeline Ops

Action: $ARGUMENTS

## Actions

### `debug` [run-id or PR number]
1. `gh run list --limit 10` — find recent runs
2. `gh run view <id> --log-failed` — get failure logs
3. Read the workflow file to understand the pipeline
4. Analyze the error and suggest fix
5. Check if it's a flaky test, infra issue, or real failure

### `review` [workflow-file]
Review CI/CD configuration for:
- Correct trigger events and branch filters
- Job dependency graph (needs, if conditions)
- Secret management (no hardcoded values)
- Cache configuration for build speed
- Timeout settings on long-running steps
- Concurrency control
- Matrix strategy efficiency
- Runner selection

### `create` <description>
Generate a CI/CD workflow based on requirements:
- Choose appropriate triggers
- Set up build/test/deploy stages
- Configure caching and artifacts
- Add proper error handling and notifications
- Include manual approval for production deploys

### `status` [repo]
1. `gh run list --limit 10` — recent pipeline runs
2. Show pass/fail rate
3. Flag any stuck or long-running jobs
4. Check for patterns in failures
