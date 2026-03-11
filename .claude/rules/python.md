---
description: Python coding conventions
paths:
  - "**/*.py"
  - "**/pyproject.toml"
  - "**/requirements*.txt"
  - "**/Pipfile"
---

# Python Conventions

- Use type hints on all function signatures — `def fetch(url: str, timeout: int = 30) -> Response:`
- Format with `ruff` or `black` (line length 100)
- Sort imports with `isort` or `ruff` (stdlib → third-party → local)
- Use `pathlib.Path` over `os.path` for file operations
- Use f-strings over `.format()` or `%` interpolation
- Use `dataclasses` or `pydantic` for structured data — avoid plain dicts for domain objects
- Use context managers (`with`) for resources (files, connections, locks)
- Raise specific exceptions (`ValueError`, `KeyError`) — never bare `raise Exception`
- Use `logging` module, never `print()` for production output
- Virtual environments required — never install globally
- Pin dependency versions in `requirements.txt` or lock file
- Use `__all__` to define public API in modules
- Prefer `pytest` over `unittest` — use fixtures, parametrize, and descriptive test names
