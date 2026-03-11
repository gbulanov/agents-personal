---
name: python-dev
description: Python development — new projects, debugging, FastAPI/Django, testing, packaging, code review
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: new|debug|fastapi|django|test|review> <target>"
---

# Python Development

Action: $ARGUMENTS

## Actions

### `new` <component-type> <name>
Generate Python code following best practices:
- **endpoint**: FastAPI route with Pydantic models, dependency injection
- **model**: SQLAlchemy model or Django model with fields, constraints
- **service**: Service class with type hints, error handling
- **schema**: Pydantic model for validation
- **cli**: Click/Typer CLI command
- **test**: pytest test with fixtures, parametrize

### `debug` <issue-description>
Diagnose Python application issues:
1. Read tracebacks and error context
2. Check common issues (import errors, async misuse, type errors)
3. Check configuration (settings, env vars)
4. Suggest fix

### `fastapi` <topic>
FastAPI-specific help:
- **routes**: Route design, path/query params, request body
- **deps**: Dependency injection patterns
- **auth**: OAuth2, JWT, API key middleware
- **db**: SQLAlchemy session, Alembic migrations
- **async**: Async endpoints, background tasks
- **test**: TestClient, async test patterns

### `django` <topic>
Django-specific help:
- **models**: Model design, managers, querysets
- **views**: CBV vs FBV, DRF viewsets
- **admin**: Admin customization
- **migrations**: Data migrations, squashing
- **celery**: Task design, retry, scheduling
- **test**: Django TestCase, fixtures, factory_boy

### `test` <file-or-function>
Generate or review tests:
1. Read the target code
2. Identify test cases (happy path, edge cases, errors)
3. Generate pytest tests with fixtures
4. Include parametrize for multiple inputs

### `review` <file-or-directory>
Code review against Python best practices:
- Type hints, Pydantic usage, error handling
- Async correctness, resource management
- Django/FastAPI-specific patterns
