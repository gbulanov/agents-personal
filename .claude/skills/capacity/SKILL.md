---
name: capacity
description: Analyze resource utilization, right-size instances, optimize node pools, forecast capacity needs
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: analyze|rightsize|forecast|nodes> [target]"
---

# Capacity Planner

Action: $ARGUMENTS

## Actions

### `analyze` [namespace or cluster]
Current resource utilization overview:
1. `kubectl top nodes` — node CPU/memory usage
2. `kubectl top pods -n <ns>` — pod CPU/memory usage
3. Compare requests vs actual usage
4. Calculate cluster-wide utilization percentage
5. Identify waste (requested >> used)

### `rightsize` <deployment or namespace>
1. Get current resource requests and limits
2. Get actual usage metrics (`kubectl top pods`)
3. Recommend right-sized values:
   - Requests = p95 usage + 20% headroom
   - Limits = 2x requests (or based on spike patterns)
4. Calculate savings from right-sizing

### `forecast` [scope]
Based on current trends:
1. Current utilization trajectory
2. Growth rate estimation
3. When current capacity will be exhausted
4. Recommended scaling actions and timing

### `nodes` [cluster]
Node pool optimization:
1. Current node types, counts, and utilization
2. Bin-packing efficiency
3. Spot vs on-demand recommendations
4. Graviton migration candidates
5. AZ distribution balance

## Output
```
## Capacity Analysis

### Utilization Summary
| Resource | Provisioned | Used | % | Status |
|----------|------------|------|---|--------|

### Recommendations
| Change | Current | Recommended | Savings |
|--------|---------|-------------|---------|

### Estimated Monthly Savings: $X,XXX
```
