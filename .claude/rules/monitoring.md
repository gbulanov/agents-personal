---
description: Monitoring and alerting conventions
paths:
  - "**/*alert*"
  - "**/*prometheus*"
  - "**/*grafana*"
  - "**/*monitor*"
  - "**/*dashboard*"
  - "**/*rules.yaml"
  - "**/*rules.yml"
---

# Monitoring & Alerting Conventions

- Every alert must have `severity` label (critical, warning, info)
- Every alert must have `runbook_url` annotation linking to response steps
- Every alert must have `for` duration — no instant-fire alerts
  - Critical: `for: 5m` (confirmed outage)
  - Warning: `for: 15m` (degradation trend)
- Alerts must be actionable — if no human action is needed, it's a metric, not an alert
- Use multi-window burn rate alerting for SLOs, not simple thresholds
- Name alerts descriptively: `HighErrorRate` not `Alert1`
- Include `summary` and `description` annotations with template variables
- Use recording rules for expensive or frequently-used PromQL expressions
- Dashboards should follow RED method (Rate, Errors, Duration) for services
- Dashboards should follow USE method (Utilization, Saturation, Errors) for resources
- Dashboard variables should allow filtering by namespace, service, and instance
- Never alert on metrics you don't have a dashboard for
- Set evaluation intervals appropriate to the metric (not faster than scrape interval)
- Test alerts with `promtool check rules` before deploying
