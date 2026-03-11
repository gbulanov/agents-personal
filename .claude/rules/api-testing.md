---
description: API test automation patterns and conventions
paths:
  - "**/api/**test*"
  - "**/test**/api/**"
  - "**/*Controller*Test*"
  - "**/*Handler*Test*"
  - "**/*_handler_test*"
  - "**/contracts/**"
  - "**/pacts/**"
  - "**/*.k6.*"
  - "**/locust*"
---

# API Testing Patterns

## REST Endpoint Tests
- Test all HTTP methods the endpoint supports (GET, POST, PUT, PATCH, DELETE)
- Test all response codes: success (200, 201, 204), client error (400, 401, 403, 404, 409), server error (500)
- Validate response body structure — use schema validation or explicit field assertions
- Test request validation: missing required fields, wrong types, boundary values
- Test auth/authz: requests without token (401), wrong role (403)
- Test pagination: first page, last page, empty results, out-of-range page
- Test filtering/sorting: valid params, invalid params, edge cases
- Java: `@WebMvcTest` + MockMvc for unit, `@SpringBootTest` + TestRestTemplate for integration
- Python: `TestClient` (FastAPI), `Client` (Django), `httpx.AsyncClient`
- Go: `httptest.NewRecorder` + router `ServeHTTP`
- TypeScript: `supertest` + app instance

## GraphQL Tests
- Test queries return expected data shape
- Test mutations validate input and return updated state
- Test authorization on individual fields and types
- Test error responses include proper error codes
- Test N+1 queries are handled (DataLoader / batch loading)
- Test subscription setup and message delivery (if applicable)
- Validate against GraphQL schema — no undocumented fields

## Contract Tests (Pact)
- Consumer tests define expected interactions — keep them minimal
- Provider tests verify interactions with real service logic
- State handlers must set up realistic data (not empty mocks)
- Run provider verification on every PR to the API service
- Publish pacts to a broker — never exchange files manually
- Use `pending` pacts for new consumers to avoid blocking deploys
- Version pacts with consumer version and git SHA

## Schema Validation
- Validate every response against its OpenAPI / JSON Schema definition
- Ensure required fields are always present
- Validate enum values, nullable fields, nested objects
- Detect schema drift: fields in response not documented in spec
- Run schema validation in CI — fail on violations

## Mock Servers
- MSW (frontend): intercept at network level, not import level
- WireMock (Java): use `@WireMockTest` for lifecycle management
- Use realistic response data — not empty objects or "test" strings
- Simulate error scenarios: 500, timeout, malformed response
- Simulate latency for timeout testing
- Keep mocks in sync with real API — use contract tests

## Load / Performance Tests
- Smoke test (1 VU): verify endpoint works under load tooling
- Load test: expected concurrent users for 5+ minutes
- Stress test: 2x expected load, find breaking point
- Set thresholds: p95 < 500ms, p99 < 1s, error rate < 1%
- Test with realistic data distribution (not all same payload)
- Run in CI as regression check against baseline
- k6: use `check()` for assertions, `Rate` for custom metrics
- Locust: use `@task` weighting to match real traffic patterns

## API Smoke Tests
- Run post-deploy, test all critical endpoints respond
- Verify health check returns 200
- Verify auth endpoints reject unauthenticated requests
- Verify CORS headers are correct
- Keep under 30 seconds total execution time
- Fail deployment pipeline if smoke tests fail

## General Rules
- Never test internal implementation through the API — test the HTTP contract
- Use separate test database or TestContainers for integration tests
- Seed test data via the same API or dedicated test fixtures — not direct DB manipulation
- Include `Content-Type` and `Accept` headers in requests
- Test CORS, rate limiting, and security headers
- Log request/response on failure for debugging
- Use descriptive test names: `POST /orders should return 400 when items array is empty`
