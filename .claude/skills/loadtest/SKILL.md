---
name: loadtest
description: Load & performance testing — generate test scripts, analyze results, identify bottlenecks, plan capacity
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: generate|analyze|plan> <target or results-file>"
---

# Load & Performance Testing

Action: $ARGUMENTS

## Actions

### `generate` <endpoint or service-description>
Generate a load test script:
1. Understand the target (REST API, GraphQL, WebSocket)
2. Design realistic scenarios:
   - Ramp-up pattern (gradual, stepped, spike)
   - User journey (not just single endpoint)
   - Think time between requests
   - Data variation (different payloads, query params)
3. Output k6 script (default) or locust script
4. Include thresholds for pass/fail:
   - p95 latency < X ms
   - Error rate < Y%
   - Requests/sec > Z

### `analyze` <results-file or output>
Analyze load test results:
1. Parse results (k6 JSON, CSV, or raw output)
2. Key metrics: RPS, latency (p50/p95/p99), error rate
3. Identify saturation point (where latency degrades)
4. Correlate with resource metrics (CPU, memory, connections)
5. Identify bottlenecks:
   - Application (CPU-bound, memory-bound)
   - Database (connection pool, slow queries)
   - Network (bandwidth, connection limits)
   - Infrastructure (pod limits, node capacity)

### `plan` <service>
Plan load test strategy:
1. Define test types needed:
   - Smoke test (minimal load, verify setup)
   - Load test (expected traffic)
   - Stress test (find breaking point)
   - Soak test (sustained load, find leaks)
   - Spike test (sudden traffic burst)
2. Estimate target load (current traffic * growth * safety margin)
3. Define success criteria
4. Identify monitoring to watch during tests
5. Plan test environment (isolated? production-like?)
6. Schedule and communication plan
