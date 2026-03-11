---
description: Vue and Nuxt conventions
paths:
  - "**/*.vue"
  - "**/nuxt.config*"
---

# Vue Conventions

- Composition API with `<script setup>` — no Options API in new code
- Use `ref()` for primitives, `reactive()` for objects — prefer `ref()` for consistency
- `defineProps` and `defineEmits` with TypeScript types for full type safety
- `computed` for derived state — never compute in template expressions
- `watch` with explicit sources — avoid `watchEffect` unless truly needed
- Pinia stores: define with `defineStore()`, use setup syntax for complex stores
- Component naming: PascalCase in script, kebab-case in template
- Emit events with `update:modelName` for custom v-model support
- Use `provide/inject` for deep prop passing — document the contract
- Template refs: `const myRef = ref<HTMLElement | null>(null)` — type them
- Composables: prefix with `use` (e.g., `useAuth`, `useFetch`), return reactive state
- Nuxt: use `useFetch`/`useAsyncData` for data fetching — they handle SSR serialization
- Auto-imports (Nuxt): rely on them for Vue/Nuxt APIs, explicit imports for third-party
- Keep templates readable: extract complex logic to computed properties or composables
