---
description: General code style guidelines applied to all files
---

# Code Style

- Use clear, descriptive names — optimize for readability, not brevity
- Keep functions under 30 lines; extract when logic is complex, not when it's repeated once
- Use early returns to reduce nesting depth
- Prefer `const` over `let`; never use `var`
- Handle errors at the appropriate level — don't swallow exceptions silently
- No `console.log` in production code — use a proper logger
- No `any` types unless interfacing with untyped external code
- Import order: stdlib, external packages, internal modules, relative imports
