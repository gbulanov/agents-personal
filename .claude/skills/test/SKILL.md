---
name: test
description: Test generation and quality — generate unit/integration/E2E tests, analyze coverage, diagnose flaky tests, design test strategy
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: generate|e2e|integration|coverage|flaky|strategy> <target>"
---

# Testing

Action: $ARGUMENTS

## Actions

### `generate` <file-or-function>
Generate unit tests for the target:
1. Read and understand the code
2. Detect language and test framework
3. Generate tests covering:
   - Happy path with expected output
   - Edge cases (empty, null, boundary, max)
   - Error paths (invalid input, failures)
4. Use framework-idiomatic patterns:
   - Java: JUnit 5 + Mockito + AssertJ
   - Python: pytest + fixtures + parametrize
   - Go: table-driven tests + testify
   - Rust: #[test] module + tokio::test
   - TypeScript: Vitest/Jest + testing-library

### `e2e` <description-or-feature>
Generate E2E tests:
1. Design user journey test scenarios
2. Generate Playwright tests (default) or Cypress
3. Use stable selectors (data-testid, role, label)
4. Handle async: explicit waits, not sleep
5. Include setup/teardown for test data

### `integration` <service-or-module>
Generate integration tests:
1. Identify integration points (DB, APIs, queues)
2. Generate tests with real dependencies (TestContainers if applicable)
3. Setup/teardown for test database state
4. Test actual queries, API calls, message handling

### `coverage` [path]
Analyze test coverage:
1. Run coverage tool (`jest --coverage`, `pytest --cov`, `go test -coverprofile`)
2. Identify uncovered code paths
3. Prioritize: untested business logic > utility code > boilerplate
4. Suggest specific tests to add

### `flaky` <test-name-or-pattern>
Diagnose flaky test:
1. Read the test code
2. Identify likely cause (timing, shared state, order dependency, external call)
3. Suggest fix (mocking, isolation, explicit waits, deterministic data)

### `strategy` <project-or-service>
Design test strategy:
1. Assess current testing state
2. Recommend pyramid balance (unit/integration/E2E ratio)
3. Identify critical paths needing E2E coverage
4. Recommend frameworks and tooling
5. Define coverage targets by module
