---
name: test-frontend
description: Frontend test automation — generate component tests, E2E browser tests, visual regression, accessibility audits, hook/composable tests for React, Vue, Svelte, Angular
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: component|e2e|visual|a11y|hook|integration|snapshot> <target>"
---

# Frontend Test Automation

Action: $ARGUMENTS

## Actions

### `component` <component-file>
Generate component unit tests:
1. Read the component source code
2. Detect framework (React/Vue/Svelte/Angular) and test library
3. Generate tests covering:
   - Renders correctly with default props
   - Renders correctly with each prop variant
   - User interactions (click, type, select, hover)
   - Conditional rendering (loading, error, empty states)
   - Event emission / callback invocation
4. Use role-based selectors (`getByRole`, `getByLabel`) — not CSS classes
5. Framework patterns:
   - React: Vitest/Jest + React Testing Library + userEvent
   - Vue: Vitest + Vue Test Utils or @testing-library/vue
   - Svelte: Vitest + @testing-library/svelte
   - Angular: Jest/Karma + Angular Testing Utilities

### `e2e` <feature-or-flow>
Generate E2E browser tests with Playwright:
1. Design user journey test scenarios for the feature
2. Generate Playwright test files with:
   - Page navigation and form interactions
   - Assertions on visible text and element state
   - Proper test data seeding via API
   - Authentication setup (storageState or API login)
3. Best practices:
   - Use `getByRole`, `getByLabel`, `getByTestId` — never CSS selectors
   - Use Playwright auto-waiting — never `waitForTimeout()`
   - Isolate tests — each seeds and cleans its own data
   - Support parallel execution
4. Include playwright.config.ts updates if needed

### `visual` <page-or-component>
Generate visual regression tests:
1. Identify pages/components to snapshot
2. Generate Playwright visual comparison tests
3. Configure viewport sizes (desktop, tablet, mobile)
4. Set appropriate diff thresholds (maxDiffPixelRatio)
5. Capture specific elements or full pages
6. Handle dynamic content (mask dates, avatars, ads)
7. Include Storybook visual test setup if project uses Storybook

### `a11y` <page-or-component>
Generate accessibility tests:
1. Component-level: jest-axe integration with Testing Library
2. E2E-level: @axe-core/playwright integration
3. Test all component states (default, loading, error, disabled)
4. Configure WCAG level (2.0 A, 2.0 AA, 2.1 AA)
5. Test keyboard navigation and focus management
6. Test screen reader announcements (aria-live regions)
7. Check color contrast ratios

### `hook` <hook-or-composable>
Generate tests for React hooks, Vue composables, or Svelte stores:
1. Read the hook/composable source
2. Use renderHook (React) or mount with wrapper (Vue)
3. Test initial state
4. Test state transitions via actions
5. Test cleanup/unmount behavior
6. Test error states and edge cases
7. Test with different provider/context values

### `integration` <page-or-feature>
Generate component integration tests with real stores/routing:
1. Identify all integrated pieces (components, stores, router, API)
2. Set up providers (Redux/Zustand store, Router, QueryClient)
3. Mock API layer (MSW or vi.mock) but use real components
4. Test complete user flows within the page
5. Verify store state changes and navigation
6. Test loading, success, and error states end-to-end

### `snapshot` <component-file>
Generate snapshot tests for a component:
1. Create snapshots for each visual variant/state
2. Use inline snapshots where possible (more readable)
3. Keep snapshots small — snapshot specific elements, not full pages
4. Include both default and edge case renders
5. Provide guidance on when to update vs investigate snapshot changes

## Selector Strategy (in priority order)

1. **Role**: `getByRole('button', { name: 'Submit' })` — best for a11y
2. **Label**: `getByLabelText('Email')` — for form fields
3. **Placeholder**: `getByPlaceholderText('Search...')` — when no label
4. **Text**: `getByText('Welcome')` — for visible content
5. **TestId**: `getByTestId('cart-count')` — last resort, but stable

**Never use**: `.btn-primary`, `#submit-btn`, `div > span:nth-child(2)`

## Cross-Cutting Concerns

For all actions:
- Detect and match existing test patterns in the project
- Never use `sleep()` or `waitForTimeout()` — use auto-waiting
- Generate self-contained tests (no shared mutable state)
- Include required dev dependency installations
- Provide the exact command to run the tests
- Tests must work in headless CI mode
