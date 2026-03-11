---
description: Django and Django REST Framework conventions
paths:
  - "**/models.py"
  - "**/views.py"
  - "**/urls.py"
  - "**/admin.py"
  - "**/serializers.py"
  - "**/settings*.py"
  - "**/managers.py"
---

# Django Conventions

- Fat models, thin views — business logic in model methods and managers, not views
- Custom managers for reusable querysets: `MyModel.objects.active().recent()`
- Always use `select_related()` for FK/OneToOne, `prefetch_related()` for M2M/reverse FK
- Never call `.all()` without limiting — use pagination or `.only()` / `.defer()`
- Use `F()` expressions for database-level operations (avoid race conditions)
- Signals: use sparingly — prefer explicit method calls for clarity
- Migrations: one logical change per migration, test both forward and reverse
- Data migrations: use `RunPython` with reverse function, never import models directly
- Settings: use `django-environ` or `pydantic-settings` for environment config
- Admin: customize `list_display`, `search_fields`, `list_filter` for every model
- DRF serializers: use `ModelSerializer` for CRUD, plain `Serializer` for custom input
- DRF viewsets: `ModelViewSet` for standard CRUD, `APIView` for custom logic
- Permissions: per-view permission classes, not global-only
- Celery tasks: idempotent, short-lived, with retry and dead-letter handling
