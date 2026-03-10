---
name: incident
description: SRE incident response — investigate, mitigate, document, and create postmortems
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, WebFetch
argument-hint: "<action: investigate|mitigate|postmortem|runbook> [description]"
---

# Incident Response

Action: $ARGUMENTS

## Actions

### `investigate` <symptoms>
Systematic investigation:
1. **Identify scope** — What's affected? Which services, regions, customers?
2. **Timeline** — When did it start? What changed recently?
   - `git log --oneline --since='2 hours ago'` — recent deploys
   - Check deployment pipelines
3. **Gather signals**:
   - Check pod/service status: `kubectl get pods -A | grep -v Running`
   - Check recent events: `kubectl get events --sort-by='.lastTimestamp' -A | tail -30`
   - Check AWS service health if applicable
   - Check CloudWatch alarms: `aws cloudwatch describe-alarms --state-value ALARM`
   - Check application logs for errors
4. **Correlate** — What changed around the time the issue started?
5. **Hypothesize** — Rank likely causes and next investigation steps

### `mitigate` <issue>
Identify fastest path to mitigation:
1. **Rollback** — Can we revert the last deployment?
   - `kubectl rollout undo deployment/<name>`
   - Revert Terraform: `terraform plan` with previous state
2. **Scale** — Is this a capacity issue?
   - Scale horizontally: `kubectl scale deployment/<name> --replicas=<n>`
   - Scale vertically: increase resource limits
3. **Redirect** — Can we route around the failure?
   - Shift traffic to healthy region/AZ
   - Enable maintenance mode
4. **Restart** — Would a restart help?
   - `kubectl rollout restart deployment/<name>`
5. **Isolate** — Can we isolate the failing component?
   - Network policy to block bad traffic
   - Feature flag to disable broken feature

Present options ranked by speed and safety. Confirm before executing.

### `postmortem` [incident description]
Generate a postmortem document:

```markdown
# Incident Postmortem: [Title]

## Summary
- **Date**: [date]
- **Duration**: [start - end]
- **Severity**: [SEV1-4]
- **Impact**: [what was affected, number of users]

## Timeline
| Time | Event |
|------|-------|
| HH:MM | First alert triggered |
| HH:MM | Investigation started |
| HH:MM | Root cause identified |
| HH:MM | Mitigation applied |
| HH:MM | Service fully recovered |

## Root Cause
[Clear explanation of what went wrong and why]

## Detection
- How was the incident detected?
- Could we have detected it earlier?

## Resolution
- What was done to fix it?
- What was the mitigation vs the permanent fix?

## Lessons Learned
### What went well
- ...

### What went poorly
- ...

## Action Items
| Action | Owner | Priority | Due Date |
|--------|-------|----------|----------|
| [action] | [owner] | P1/P2/P3 | [date] |
```

### `runbook` <service or scenario>
Generate an operational runbook:
1. Read the service's code, configs, and deployment manifests
2. Document:
   - Service overview and dependencies
   - Health check endpoints and monitoring
   - Common failure modes and fixes
   - Scaling procedures
   - Restart procedures
   - Rollback procedures
   - Escalation contacts and paths
