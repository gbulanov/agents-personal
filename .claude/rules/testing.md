---
description: Testing conventions and patterns
---

# Testing

- Test behavior, not implementation — tests should survive refactors
- Use descriptive test names: `should return empty array when no items match filter`
- One assertion per test when possible (one logical assertion, not one `expect`)
- Arrange-Act-Assert structure in every test
- Don't mock what you don't own — use integration tests for external dependencies
- Test edge cases: empty input, null, boundary values, error paths
- Keep test files co-located with source or in a parallel `__tests__` directory
