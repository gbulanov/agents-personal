---
description: TypeScript coding conventions
paths:
  - "**/*.ts"
  - "**/*.tsx"
  - "**/tsconfig*.json"
---

# TypeScript Conventions

- Enable strict mode (`"strict": true` in tsconfig) — no exceptions
- Never use `any` — use `unknown` and narrow with type guards, or define proper types
- Use `interface` for object shapes, `type` for unions and intersections
- Use `readonly` for properties that shouldn't change after construction
- Use discriminated unions for state machines and variant types
- Prefer `const` assertions for literal types: `as const`
- Use `satisfies` operator to validate types without widening
- Use `zod` or similar for runtime validation at system boundaries (API input, env vars)
- Avoid enums — use `as const` objects or string union types instead
- Use `Promise<T>` return types explicitly — don't rely on inference for public APIs
- Handle all cases in switch statements — use exhaustive checks with `never`
- Use `Map`/`Set` over plain objects when keys are dynamic
- No non-null assertions (`!`) unless the assertion is provably safe
- Use barrel exports (`index.ts`) sparingly — they hurt tree-shaking
