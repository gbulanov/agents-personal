---
description: FastAPI conventions
paths:
  - "**/*router*.py"
  - "**/*endpoint*.py"
  - "**/*schema*.py"
  - "**/*route*.py"
  - "**/*api*.py"
---

# FastAPI Conventions

- Pydantic models for all request/response bodies — never use raw dicts
- Use `Depends()` for dependency injection (DB sessions, auth, config)
- Async endpoints (`async def`) for I/O-bound operations, sync for CPU-bound
- Status codes: use `status.HTTP_201_CREATED`, `status.HTTP_204_NO_CONTENT` explicitly
- Path operations: `@router.get`, `@router.post` — not `@app.get` (use APIRouter)
- Group routes in routers by resource, include in app with prefix
- Response models: `response_model=UserOut` to filter output fields
- Validation: Pydantic validators, `Field(min_length=1, max_length=255)`
- Error handling: raise `HTTPException` with appropriate status code and detail
- Background tasks: `BackgroundTasks` for fire-and-forget operations
- Lifespan events for startup/shutdown (DB connections, cache warmup)
- OpenAPI: customize operation IDs, tags, descriptions for auto-generated docs
- Testing: use `TestClient` for sync, `httpx.AsyncClient` for async endpoints
