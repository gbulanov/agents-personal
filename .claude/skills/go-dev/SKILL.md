---
name: go-dev
description: Go development — new projects, debugging, API handlers, testing, profiling, code review
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: new|debug|api|test|profile|review> <target>"
---

# Go Development

Action: $ARGUMENTS

## Actions

### `new` <component-type> <name>
Generate Go code following best practices:
- **handler**: HTTP handler with proper error handling, middleware
- **service**: Service struct with interface, constructor, methods
- **repository**: Database repository with sqlx/GORM
- **model**: Struct with JSON/DB tags, validation
- **middleware**: HTTP middleware function
- **test**: Table-driven test with subtests

### `debug` <issue-description>
Diagnose Go application issues:
1. Read error output and stack traces
2. Check common issues (nil pointer, goroutine leak, deadlock, race)
3. Suggest `go test -race`, pprof, or specific debugging steps
4. Provide fix

### `api` <description>
Design or implement API endpoints:
1. Define route structure
2. Generate handler, request/response types
3. Add validation, error handling
4. Add middleware (auth, logging, recovery)

### `test` <file-or-function>
Generate or review tests:
1. Read the target code
2. Generate table-driven tests with `t.Run()`
3. Include edge cases, error paths
4. Add benchmarks for performance-critical code

### `profile` <type>
Performance profiling guidance:
- **cpu**: CPU profiling with pprof
- **mem**: Memory allocation profiling
- **goroutine**: Goroutine leak detection
- **block**: Lock contention analysis
- **trace**: Execution tracing with `go tool trace`

### `review` <file-or-directory>
Code review against Go best practices:
- Error handling, wrapping, and checking
- Interface design, goroutine safety
- Context usage, resource cleanup
- `golangci-lint` compliance
