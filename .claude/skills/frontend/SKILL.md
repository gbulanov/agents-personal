---
name: frontend
description: Frontend development — components, pages, state management, testing, accessibility, performance across React/Vue/Svelte/Angular
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: component|page|state|test|a11y|perf|review> <target>"
---

# Frontend Development

Action: $ARGUMENTS

## Actions

### `component` <name> [framework]
Generate a UI component:
1. Detect framework from project (React/Vue/Svelte/Angular) or use specified
2. Generate component with:
   - Props interface/type definition
   - Proper state management
   - Event handling
   - Loading and error states
   - Accessibility attributes
3. Generate co-located test file
4. Generate Storybook story if applicable

### `page` <name> [framework]
Generate a page/route component:
1. Detect framework and routing (Next.js App Router, Vue Router, SvelteKit)
2. Generate page with:
   - Data fetching (SSR/SSG/client)
   - Loading state (skeleton/spinner)
   - Error boundary
   - SEO metadata
   - Responsive layout

### `state` <description>
Design state management for a feature:
1. Identify state type (local, shared, server, URL)
2. Recommend approach:
   - Local: useState/ref
   - Shared: Zustand/Pinia/Redux Toolkit
   - Server: TanStack Query/SWR/Apollo
   - URL: search params
3. Generate store/hook code

### `test` <component-or-file>
Generate frontend tests:
1. Detect test framework (Vitest, Jest, Playwright)
2. Generate tests:
   - Render test (component mounts without error)
   - User interaction (click, type, submit)
   - State changes (loading, error, success)
   - Accessibility (role queries, keyboard nav)
3. Use testing-library patterns (query by role, not class)

### `a11y` <file-or-component>
Accessibility audit:
1. Check semantic HTML usage
2. Check ARIA attributes
3. Check keyboard navigation
4. Check color contrast references
5. Check focus management
6. Suggest fixes for each issue

### `perf` <file-or-url>
Frontend performance review:
1. Bundle size analysis
2. Unnecessary re-renders / reactivity
3. Image and font optimization
4. Code splitting opportunities
5. Core Web Vitals impact

### `review` <file-or-directory>
Frontend code review:
- Component structure and responsibility
- State management correctness
- Accessibility compliance
- Performance patterns
- Responsive design
