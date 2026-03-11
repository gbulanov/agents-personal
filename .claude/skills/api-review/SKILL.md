---
name: api-review
description: API design review — OpenAPI validation, breaking change detection, versioning strategy, consistency checks
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: review|breaking|validate|design> <spec-file or endpoint>"
---

# API Design Review

Action: $ARGUMENTS

## Actions

### `review` <spec-file or code-dir>
Review API design for best practices:
1. Read OpenAPI spec or infer API from route handlers
2. Check naming consistency (plural nouns, kebab-case paths)
3. Check HTTP method usage (GET=read, POST=create, PUT=replace, PATCH=update, DELETE=remove)
4. Check status code correctness (201 for create, 204 for delete, 404 vs 400)
5. Check pagination on list endpoints
6. Check filtering, sorting, field selection
7. Check error response format consistency
8. Check authentication/authorization headers
9. Check versioning strategy
10. Check rate limiting headers

### `breaking` <old-spec> <new-spec>
Detect breaking changes between API versions:
1. Removed endpoints
2. Removed or renamed fields in responses
3. New required fields in requests
4. Changed field types
5. Changed status codes
6. Removed enum values
7. Tightened validation rules
8. Changed authentication requirements

### `validate` <openapi-spec>
Validate OpenAPI specification:
1. Parse and check for syntax errors
2. Verify all `$ref` references resolve
3. Check required fields on all schemas
4. Verify example values match schemas
5. Check for undocumented error responses
6. Flag endpoints missing descriptions
7. Flag parameters missing descriptions or examples

### `design` <description>
Help design an API for a given use case:
1. Define resource model
2. Design endpoints with proper REST semantics
3. Design request/response schemas
4. Plan pagination strategy
5. Design error format
6. Consider versioning approach
7. Output as OpenAPI 3.0 YAML skeleton
