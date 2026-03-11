---
name: api
description: API design and management — design endpoints, detect breaking changes, validate specs, generate mock servers and clients
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: design|breaking|validate|mock|client|docs> <target>"
---

# API Design & Management

Action: $ARGUMENTS

## Actions

### `design` <description>
Design an API from requirements:
1. Define resource model and relationships
2. Design RESTful endpoints with proper HTTP methods
3. Design request/response schemas
4. Define pagination, filtering, sorting
5. Design error format (RFC 7807)
6. Output as OpenAPI 3.0 YAML

### `breaking` <old-spec-or-branch> <new-spec-or-branch>
Detect breaking API changes:
1. Compare OpenAPI specs or API routes between versions
2. Flag: removed endpoints, removed fields, type changes, new required params
3. Classify: breaking vs non-breaking
4. Suggest migration path for breaking changes

### `validate` <openapi-spec>
Validate OpenAPI specification:
1. Syntax and structure validation
2. All $ref references resolve
3. Required fields on schemas
4. Examples match schemas
5. Error responses documented
6. Descriptions present

### `mock` <openapi-spec-or-routes>
Generate mock server or responses:
1. Generate mock data from schemas
2. Create mock server setup (MSW, json-server, or framework-specific)
3. Cover success and error responses
4. Include realistic example data

### `client` <openapi-spec>
Generate API client code:
1. Choose target language/framework
2. Generate typed client with request/response types
3. Include error handling
4. Include authentication header injection

### `docs` <routes-or-spec>
Generate API documentation:
1. Scan route handlers or read OpenAPI spec
2. Generate endpoint documentation
3. Include request/response examples
4. Document authentication requirements
5. Document rate limits and pagination
