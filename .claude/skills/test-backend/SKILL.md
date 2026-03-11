---
name: test-backend
description: Backend test automation — generate unit, integration, DB, queue, worker, and contract tests for Java, Python, Go, Rust, TypeScript backends
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: unit|integration|db|queue|worker|contract|fixture> <target>"
---

# Backend Test Automation

Action: $ARGUMENTS

## Actions

### `unit` <file-or-class>
Generate unit tests for a service/business logic class:
1. Read the source code and understand all public methods
2. Detect language and existing test framework
3. Generate tests covering:
   - Happy path with expected output
   - Edge cases (empty, null, boundary, overflow)
   - Error paths (exceptions, error returns)
   - All branches/conditionals
4. Mock all external dependencies (repos, clients, gateways)
5. Match existing test style in the project
6. Framework patterns:
   - Java: JUnit 5 + Mockito + AssertJ
   - Python: pytest + unittest.mock + factory_boy
   - Go: table-driven tests + testify + gomock
   - Rust: #[cfg(test)] + mockall + rstest
   - TypeScript: Vitest/Jest + vi.mock

### `integration` <service-or-module>
Generate integration tests with real dependencies:
1. Identify integration points (DB, cache, external APIs, queues)
2. Use TestContainers or embedded DBs for database tests
3. Set up proper test data seeding and cleanup
4. Test actual queries, transactions, and side effects
5. Include both success and failure scenarios

### `db` <repository-or-dao>
Generate database/repository tests:
1. Read the repository/DAO code
2. Set up TestContainers (Postgres, MySQL, MongoDB) or SQLite for testing
3. Test all query methods with realistic data
4. Test transactions, rollbacks, and concurrent access
5. Test edge cases: empty results, duplicate keys, constraint violations
6. Include migration verification if applicable

### `queue` <consumer-or-producer>
Generate message queue/event handler tests:
1. Read the consumer/producer code
2. Set up in-memory broker or TestContainers (Kafka, RabbitMQ, SQS)
3. Test message serialization/deserialization
4. Test consumer processing logic
5. Test retry behavior and dead-letter handling
6. Test idempotency (processing same message twice)

### `worker` <job-or-task>
Generate background job/worker tests:
1. Read the job/task code
2. Test with mocked dependencies and clock
3. Test scheduling/cron trigger logic
4. Test failure handling and retry behavior
5. Test concurrent execution safety
6. Test graceful shutdown behavior

### `contract` <service-name>
Generate contract tests (provider-side Pact):
1. Identify consumer contracts (Pact files or broker)
2. Set up provider verification test
3. Configure state handlers for each interaction
4. Verify all consumer expectations are met
5. Include pending pact support for new consumers

### `fixture` <entity-or-model>
Generate test data factories/fixtures:
1. Read the entity/model definition
2. Generate factory/builder with sensible defaults
3. Support overrides for specific test scenarios
4. Create preset variants (valid, invalid, edge cases)
5. Framework patterns:
   - Java: Builder pattern or Instancio
   - Python: factory_boy factories
   - Go: functional options pattern
   - Rust: builder pattern with Default
   - TypeScript: factory functions

## Cross-Cutting Concerns

For all actions:
- Detect and match existing test patterns in the project
- Use Arrange-Act-Assert structure
- Never use `sleep()` — use polling, mocked time, or explicit waits
- Generate self-contained tests with no inter-test dependencies
- Include required dependency additions in output
- Provide the exact command to run the tests
