---
description: Backend test automation patterns and conventions
paths:
  - "**/test/**"
  - "**/tests/**"
  - "**/*Test.java"
  - "**/*_test.go"
  - "**/*_test.py"
  - "**/*_test.rs"
  - "**/test_*.py"
---

# Backend Testing Patterns

## Unit Tests
- Mock at boundaries: repositories, HTTP clients, message producers, filesystem
- Never mock the class under test — only its dependencies
- Use constructor injection so dependencies are mockable
- One test class per production class, same package/module
- Factories/builders for test data — never repeat manual object construction
- Java: `@ExtendWith(MockitoExtension.class)` + `@InjectMocks` + AssertJ
- Python: `pytest` fixtures + `unittest.mock.patch` + `factory_boy`
- Go: table-driven tests + `testify/assert` + `gomock` or `mockery`
- Rust: `#[cfg(test)] mod tests` + `mockall` + `rstest` for parametrize

## Database Tests
- Use TestContainers for Postgres/MySQL/MongoDB — never mock the database for repository tests
- Each test gets a clean database state (transaction rollback or truncate)
- Test actual SQL/queries, not just mock returns
- Python alternative: SQLite in-memory for simple cases, TestContainers for complex
- Go: `testcontainers-go` or `dockertest`
- Verify constraints: unique keys, foreign keys, NOT NULL, CHECK constraints

## Integration Tests
- Test real component interaction, mock only external third-party services
- Use separate test configuration (application-test.yml, .env.test)
- Tag/mark integration tests so they can run separately: `@Tag("integration")`, `@pytest.mark.integration`
- Clean up resources in teardown — don't leak connections, containers, or temp files

## Queue / Event Tests
- Use in-memory broker for unit tests (EmbeddedKafka, in-memory SQS)
- Test message serialization roundtrip (produce → serialize → deserialize → consume)
- Verify idempotency: process the same message twice, assert no duplicate side effects
- Test dead-letter queue routing on processing failure
- Test consumer offset/ack behavior

## Worker / Background Job Tests
- Mock the clock — never use real time for scheduled job tests
- Test job execution logic separate from scheduling trigger
- Verify retry behavior with simulated failures
- Test concurrent execution safety (if applicable)
- Test graceful shutdown / in-progress job completion

## Contract Tests
- Provider tests verify API meets consumer expectations (Pact, Spring Cloud Contract)
- Run contract tests in CI on every change to API code
- State handlers must create realistic test data — not empty stubs
- Keep contracts versioned and published to a broker

## General Rules
- No `sleep()` or `time.Sleep()` — use `Awaitility` (Java), `polling` (Python), `Eventually` (Go)
- Tests must pass in random order: `--randomize` / `--shuffle`
- No hardcoded ports — use dynamic port allocation or `0` for random
- No hardcoded file paths — use `@TempDir` (Java), `tmp_path` (pytest), `t.TempDir()` (Go)
- Test names describe behavior: `shouldRejectOrderWhenInventoryInsufficient`
- Separate test data creation from assertions — Arrange-Act-Assert
