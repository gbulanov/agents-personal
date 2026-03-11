---
description: API endpoint conventions across all frameworks
paths:
  - "**/routes/**"
  - "**/controllers/**"
  - "**/handlers/**"
  - "**/endpoints/**"
  - "**/routers/**"
  - "**/api/**"
---

# API Conventions

- Use plural nouns for resource endpoints: `/users`, `/orders` not `/user`, `/order`
- HTTP methods: GET=read, POST=create, PUT=replace, PATCH=partial-update, DELETE=remove
- Status codes: 201 for created (with Location header), 204 for delete, 422 for validation
- Consistent error format across all endpoints (RFC 7807 Problem Details recommended)
- Pagination on all list endpoints — never return unbounded results
- Input validation at the handler/controller level — fail fast with clear error messages
- Return only the fields the client needs — don't expose internal model structure
- Use consistent naming convention throughout (camelCase or snake_case, pick one)
- Version APIs (`/v1/`) from the start — cheaper than adding later
- Rate limiting with `Retry-After` header on 429 responses
- Idempotency keys for non-idempotent POST operations
- Authentication: Bearer token in Authorization header, never in query params
- No sensitive data in URLs — use request body or headers
