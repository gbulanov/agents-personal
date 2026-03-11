---
name: monitor
description: Monitoring & observability — review alerts, design SLOs, audit Prometheus rules, check CloudWatch alarms, assess dashboard coverage
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: alerts|slo|dashboards|cloudwatch|review> [target]"
---

# Monitoring & Observability

Action: $ARGUMENTS

## Actions

### `alerts` [file or directory]
Review Prometheus/alerting rules:
1. Find alert rule files (`.yaml`, `.yml`, `.rules`)
2. For each alert check:
   - Is it actionable? (requires human intervention)
   - Has `for` duration (not too short, not too long)
   - Has `severity` label (critical, warning, info)
   - Has `runbook_url` annotation
   - Threshold is reasonable (not too sensitive)
   - Expression is correct (rate vs increase, label selectors)
3. Identify gaps: missing alerts for common failure modes
4. Flag noisy alerts (would fire frequently, low signal)

### `slo` <service>
Design or review SLOs:
1. Identify key user journeys
2. Define SLIs (what to measure: availability, latency, correctness)
3. Propose SLO targets (99.9%, 99.95%, etc.)
4. Calculate error budgets
5. Design multi-window burn rate alerts
6. Output ready-to-use Prometheus recording + alerting rules

### `dashboards` [file or directory]
Review Grafana dashboard JSON:
1. Check RED method coverage (Rate, Errors, Duration)
2. Check USE method coverage (Utilization, Saturation, Errors)
3. Verify template variables for filtering
4. Check panel types match data (gauge for current, graph for trend)
5. Flag missing panels for critical signals

### `cloudwatch` [alarm-prefix or resource]
Audit CloudWatch alarms:
1. `aws cloudwatch describe-alarms --state-value ALARM` — active alarms
2. `aws cloudwatch describe-alarms --alarm-name-prefix <prefix>` — specific alarms
3. Check: actions configured, thresholds reasonable, evaluation periods correct
4. Identify missing alarms for critical resources

### `review` [path]
Full monitoring review of a service:
1. Find all monitoring configs (Prometheus rules, dashboards, CloudWatch)
2. Map coverage against the service's dependencies
3. Identify observability gaps
4. Recommend additions with priority
