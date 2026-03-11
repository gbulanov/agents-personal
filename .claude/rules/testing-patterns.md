---
description: Testing patterns and conventions across all languages
paths:
  - "**/*test*"
  - "**/*spec*"
  - "**/__tests__/**"
  - "**/tests/**"
  - "**/test/**"
---

# Testing Patterns

- Use factory/builder patterns for test data — no manual object construction repeated across tests
- No `sleep()` or `time.Sleep()` in tests — use explicit waits, mocked time, or polling
- Mock at system boundaries (HTTP, DB, filesystem) — not internal modules
- One logical assertion per test — multiple `expect` calls testing the same thing is fine
- Test names describe behavior: `should return 404 when user not found` not `test_get_user_3`
- Arrange-Act-Assert structure in every test — visually separate the sections
- Test data should be self-contained — tests must not depend on other tests' data
- Clean up after tests: reset DB state, clear mocks, restore mocked time
- Use snapshot testing sparingly — only for complex output that's hard to assert field-by-field
- Parametrize/table-driven tests for same logic with different inputs
- Never test implementation details (private methods, internal state) — test the public API
- Flaky test tolerance: zero — fix or quarantine immediately
- Integration tests use real dependencies (TestContainers, docker-compose) not mocks
