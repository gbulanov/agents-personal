---
name: logs
description: Analyze logs from kubectl, CloudWatch, journalctl, or files — find errors, correlate events, summarize patterns
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<source: k8s|cloudwatch|file|system> <target> [time-range]"
---

# Log Analyzer

Source: $ARGUMENTS

## Actions by Source

### `k8s` <pod-or-deployment> [namespace]
1. Identify pods: `kubectl get pods -n <ns> -l app=<name>`
2. Get recent logs: `kubectl logs <pod> --tail=500 -n <ns>`
3. If crash-looping: `kubectl logs <pod> --previous -n <ns>`
4. For multi-container: logs from each container
5. Parse, filter errors, correlate by timestamp
6. Summarize: error types, frequency, first/last occurrence

### `cloudwatch` <log-group> [time-range]
1. `aws logs describe-log-groups --log-group-name-prefix <group>` — find exact group
2. `aws logs tail <group> --since <range> --format short` — recent logs
3. `aws logs filter-log-events --log-group-name <group> --filter-pattern "ERROR"` — errors only
4. Parse and summarize error patterns

### `file` <path>
1. Read the log file
2. Detect format (JSON, logfmt, syslog, custom)
3. Parse timestamps, levels, messages
4. Filter and group errors
5. Identify patterns and anomalies

### `system` <service>
1. `journalctl -u <service> --since "1 hour ago" --no-pager | tail -200`
2. Parse systemd log format
3. Focus on errors, warnings, restarts

## Analysis Output

For all sources, provide:
```
## Log Analysis: [source]

### Error Summary
| Error | Count | First | Last | Severity |
|-------|-------|-------|------|----------|
| ... | ... | ... | ... | ... |

### Timeline
[Chronological sequence of significant events]

### Pattern
[Continuous, intermittent, burst, escalating]

### Root Cause Assessment
[Most likely cause based on log evidence]

### Suggested Actions
1. [Action with rationale]
```
