---
name: test
description: Test orchestrator — generate unit/integration/E2E tests, analyze coverage, diagnose flaky tests, design test strategy. Routes to /test-backend, /test-frontend, /test-api for specialized automation.
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: generate|e2e|integration|coverage|flaky|strategy|setup> <target>"
---

# Testing

Action: $ARGUMENTS

## Routing to Specialists

For deeper automation, use specialized test skills:
- **`/test-backend`** — unit, integration, DB, queue, worker, contract tests for backend services
- **`/test-frontend`** — component, E2E, visual regression, a11y, hook tests for UI apps
- **`/test-api`** — REST, GraphQL, contract, schema validation, load tests, mock servers

This skill handles cross-cutting test concerns and general test generation.

## Actions

### `generate` <file-or-function>
Generate unit tests for the target:
1. Read and understand the code
2. Detect language, framework, and existing test patterns
3. Determine the best specialist:
   - Backend service/model → use backend-test-engineer patterns
   - UI component → use frontend-test-engineer patterns
   - API endpoint → use api-test-engineer patterns
4. Generate tests covering:
   - Happy path with expected output
   - Edge cases (empty, null, boundary, max)
   - Error paths (invalid input, failures)
5. Use framework-idiomatic patterns:
   - Java: JUnit 5 + Mockito + AssertJ
   - Python: pytest + fixtures + parametrize
   - Go: table-driven tests + testify
   - Rust: #[test] module + tokio::test
   - TypeScript: Vitest/Jest + testing-library
   - React/Vue/Svelte/Angular: Testing Library variants

### `e2e` <description-or-feature>
Generate E2E tests:
1. Design user journey test scenarios
2. Generate Playwright tests (default) or Cypress
3. Use stable selectors (data-testid, role, label)
4. Handle async: explicit waits, not sleep
5. Include setup/teardown for test data
6. Support both UI E2E and API E2E scenarios

### `integration` <service-or-module>
Generate integration tests:
1. Identify integration points (DB, APIs, queues, UI+store)
2. For backend: use TestContainers or embedded DBs
3. For frontend: use real stores, routers, mocked API (MSW)
4. For API: test full request lifecycle with real middleware
5. Setup/teardown for test state

### `coverage` [path]
Analyze test coverage:
1. Run coverage tool:
   - `npx vitest --coverage` / `npx jest --coverage`
   - `pytest --cov` / `coverage run`
   - `go test -coverprofile`
   - `cargo tarpaulin` / `cargo llvm-cov`
   - `mvn jacoco:report` / `gradle jacocoTestReport`
2. Identify uncovered code paths
3. Prioritize: untested business logic > utility code > boilerplate
4. Suggest specific tests to add with priority ranking
5. Report by layer: unit coverage, integration coverage, E2E coverage

### `flaky` <test-name-or-pattern>
Diagnose flaky test:
1. Read the test code
2. Identify likely cause:
   - Timing/async (explicit waits fix)
   - Shared state (isolation fix)
   - Order dependency (independence fix)
   - External service (mock fix)
   - Browser state (fresh context fix)
   - Port conflict (dynamic allocation fix)
3. Suggest specific fix with code

### `strategy` <project-or-service>
Design test strategy:
1. Assess current testing state across all layers
2. Recommend pyramid balance (unit/integration/E2E ratio)
3. Identify critical paths needing E2E coverage
4. Recommend framework stack per layer:
   - Backend: unit + integration + contract
   - Frontend: component + E2E + a11y + visual
   - API: endpoint + schema + load
5. Define coverage targets by module
6. Design CI pipeline integration (what runs when)
7. Recommend specialized skills for implementation:
   - `/test-backend` for backend automation
   - `/test-frontend` for frontend automation
   - `/test-api` for API automation

### `setup` <project-path>
Set up test infrastructure:
1. Detect project type and language
2. Install test dependencies
3. Create test configuration files:
   - vitest.config.ts / jest.config.ts
   - pytest.ini / conftest.py
   - playwright.config.ts
   - testcontainers config
4. Create test directory structure
5. Generate example tests as templates
6. Add test scripts to package.json / Makefile / taskfile
7. Configure CI pipeline for test execution
