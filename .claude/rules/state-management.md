---
description: Frontend state management conventions
paths:
  - "**/store/**"
  - "**/stores/**"
  - "**/redux/**"
  - "**/atoms/**"
  - "**/state/**"
  - "**/slices/**"
---

# State Management

- Default to local state (`useState`/`ref`) — only promote to shared state when needed
- Separate server state (remote data) from UI state (local interactions)
- Use TanStack Query, SWR, or Apollo for server state — they handle caching, refetching, stale data
- Use Zustand, Pinia, or Redux Toolkit for shared client state — not React Context for frequent updates
- URL state for anything that should be shareable/bookmarkable (filters, tabs, search)
- Normalize nested data structures — avoid deeply nested state trees
- Derived/computed state should be computed, not stored (reduces sync bugs)
- Optimistic updates for better UX — roll back on error
- Never store data that can be derived from other state
- Keep store actions/mutations thin — complex logic belongs in services
- Avoid global state for data that only one component tree needs
- Form state: use a form library (React Hook Form, VeeValidate) — don't manage manually
