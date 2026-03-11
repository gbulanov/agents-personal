---
description: React and Next.js conventions
paths:
  - "**/*.tsx"
  - "**/*.jsx"
  - "**/next.config*"
  - "**/vite.config*"
---

# React Conventions

- Functional components only — no class components
- Hooks rules: only call at top level, only call from React functions
- Use `useState` for local state, `useReducer` for complex state logic
- `useEffect` cleanup: return cleanup function for subscriptions, timers, listeners
- `useMemo`/`useCallback` only when measured as necessary — don't optimize prematurely
- Compose components: prefer children/slots over deeply nested prop drilling
- Key prop: use stable unique IDs, not array index (for dynamic lists)
- Error boundaries for graceful failure handling
- Co-locate: component + test + styles in same directory
- Props: destructure in function signature, define interface above component
- Avoid inline object/arrow creation in JSX — extract to `useMemo`/`useCallback` if causing re-renders
- Server Components (Next.js App Router): default to server, add `'use client'` only when needed
- Loading states: use Suspense boundaries, skeleton screens over spinners
- Forms: use React Hook Form or server actions — avoid uncontrolled manual state
