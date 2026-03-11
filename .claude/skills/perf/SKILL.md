---
name: perf
description: Performance analysis — profiling, caching strategy, bundle optimization, query tuning, Core Web Vitals, benchmarks
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: profile|cache|bundle|query|vitals|benchmark> <target>"
---

# Performance Analysis

Action: $ARGUMENTS

## Actions

### `profile` <service-or-file>
Guide performance profiling:
1. Detect language and recommend profiler:
   - Java: JFR, async-profiler
   - Python: py-spy, cProfile
   - Go: pprof
   - Rust: cargo-flamegraph
   - Node.js: clinic.js, --inspect
2. Provide profiling commands
3. Interpret results and identify hot paths

### `cache` <service-or-feature>
Design caching strategy:
1. Identify cacheable data (read-heavy, expensive to compute)
2. Choose cache level (CDN, app, query, in-process)
3. Define TTL and invalidation strategy
4. Recommend implementation (Redis, Memcached, local cache)
5. Estimate hit rate and performance improvement

### `bundle` <project-path>
Frontend bundle analysis:
1. Run bundle analyzer (`webpack-bundle-analyzer`, `source-map-explorer`)
2. Identify large dependencies
3. Suggest code splitting opportunities
4. Recommend lighter alternatives
5. Check tree shaking effectiveness

### `query` <query-or-file>
Database query optimization:
1. Analyze query structure
2. Check EXPLAIN plan
3. Identify missing indexes
4. Detect N+1 patterns
5. Suggest rewrites for better performance

### `vitals` <url-or-project>
Core Web Vitals analysis:
1. Identify LCP, INP, CLS risks in code
2. Check image optimization
3. Check font loading strategy
4. Check JS/CSS delivery
5. Recommend improvements with expected impact

### `benchmark` <function-or-endpoint>
Create performance benchmarks:
1. Detect language and framework
2. Generate benchmark code:
   - Go: `testing.B`
   - Rust: `criterion`
   - Java: JMH
   - JavaScript: `vitest bench`
3. Include warmup, iterations, memory tracking
