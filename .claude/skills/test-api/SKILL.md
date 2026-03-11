---
name: test-api
description: API test automation — generate REST/GraphQL/gRPC endpoint tests, contract tests (Pact), schema validation, load tests (k6/Locust), and mock servers (MSW/WireMock)
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: rest|graphql|contract|schema|load|mock|smoke> <target>"
---

# API Test Automation

Action: $ARGUMENTS

## Actions

### `rest` <endpoint-or-controller>
Generate REST API endpoint tests:
1. Read the controller/handler source code
2. Detect framework and test patterns
3. Generate tests covering:
   - All HTTP methods (GET, POST, PUT, PATCH, DELETE)
   - Success responses (200, 201, 204)
   - Client errors (400 validation, 401 auth, 403 authz, 404 not found, 409 conflict)
   - Server errors (500 handling)
   - Query parameters (filtering, sorting, pagination)
   - Request body validation
   - Response body structure
4. Framework patterns:
   - Java: MockMvc / WebTestClient / REST Assured
   - Python: httpx AsyncClient / TestClient (FastAPI) / Django test client
   - Go: httptest + chi/gin test mode
   - Rust: actix_web::test / axum::test
   - TypeScript: supertest + Vitest/Jest

### `graphql` <schema-or-resolver>
Generate GraphQL API tests:
1. Read schema and resolver code
2. Generate tests for:
   - Queries with variables
   - Mutations with input validation
   - Nested resolver chains
   - Error responses and error codes
   - Authorization on fields/types
   - N+1 query detection (DataLoader verification)
   - Pagination (cursor-based, offset)
3. Framework patterns:
   - Apollo Server: executeOperation
   - Strawberry/Ariadne (Python): test client
   - gqlgen (Go): test client
   - async-graphql (Rust): test executor

### `contract` <consumer-or-provider>
Generate Pact contract tests:
1. Determine role: consumer or provider
2. **Consumer side**:
   - Define interactions (request/response pairs)
   - Generate Pact consumer tests
   - Publish pacts to broker (provide config)
3. **Provider side**:
   - Set up provider verification
   - Create state handlers for all interactions
   - Configure provider states with test data
4. Include Pact broker configuration

### `schema` <openapi-spec>
Generate OpenAPI schema validation tests:
1. Parse the OpenAPI/Swagger specification
2. Generate tests that validate:
   - Response bodies match defined schemas
   - Required fields are present
   - Field types match spec
   - Enum values are valid
   - Nullable fields handled correctly
3. Test all documented endpoints
4. Flag undocumented endpoints that exist in code

### `load` <endpoint-or-service>
Generate load/performance test scripts:
1. Analyze the target API endpoints
2. Generate test scripts:
   - **k6**: JavaScript-based load tests with thresholds
   - **Locust**: Python-based load tests with task weighting
3. Define scenarios:
   - Smoke test (1 user, verify works)
   - Load test (expected traffic)
   - Stress test (2x expected traffic)
   - Spike test (sudden burst)
   - Soak test (sustained period)
4. Set thresholds: p95 latency, error rate, throughput
5. Include CI integration for performance regression detection

### `mock` <api-spec-or-service>
Generate mock API server:
1. Read API spec (OpenAPI) or existing handlers
2. Generate mock implementation:
   - **MSW** (frontend): handlers for browser/Node interception
   - **WireMock** (Java): stub mappings for service virtualization
   - **responses** (Python): mock HTTP responses
   - **httpmock** (Go/Rust): mock HTTP servers
3. Include realistic response data
4. Support error simulation (delays, failures, timeouts)
5. Generate setup/teardown helpers

### `smoke` <base-url-or-service>
Generate API smoke tests:
1. Discover or list all API endpoints
2. Generate lightweight tests that verify:
   - Each endpoint responds (not 5xx)
   - Auth endpoints return 401 without credentials
   - Health check endpoint returns 200
   - Required headers are enforced
3. Designed to run post-deploy in < 30 seconds
4. Output as standalone script (curl, httpie, or language-specific)

## Cross-Cutting Concerns

For all actions:
- Detect and match existing test patterns in the project
- Include proper auth handling (token fixtures, test users)
- Generate self-contained tests with data setup/teardown
- Include required dependency additions
- Provide the exact command to run the tests
- Provide CI pipeline integration snippet
