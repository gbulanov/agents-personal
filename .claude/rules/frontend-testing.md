---
description: Frontend test automation patterns and conventions
paths:
  - "**/*.test.tsx"
  - "**/*.test.ts"
  - "**/*.spec.tsx"
  - "**/*.spec.ts"
  - "**/e2e/**"
  - "**/playwright/**"
  - "**/__tests__/**"
---

# Frontend Testing Patterns

## Component Tests
- Test behavior, not implementation — never assert on component internals
- Use role-based selectors: `getByRole('button', { name: 'Submit' })` — not CSS classes
- Use `userEvent` (not `fireEvent`) for realistic user interactions
- Test all visual states: default, loading, error, empty, disabled
- One component = one test file, co-located or in `__tests__/` directory
- React: `@testing-library/react` + `userEvent` + Vitest/Jest
- Vue: `@vue/test-utils` or `@testing-library/vue` + Vitest
- Svelte: `@testing-library/svelte` + Vitest
- Angular: Angular Testing Utilities + Jest/Karma

## Selector Priority (best → last resort)
1. `getByRole` — buttons, links, headings, form elements
2. `getByLabelText` — form fields with labels
3. `getByPlaceholderText` — inputs without visible labels
4. `getByText` — non-interactive text content
5. `getByTestId` — when nothing semantic applies

Never use: CSS selectors (`.class`), IDs (`#id`), DOM hierarchy (`div > span`)

## E2E Tests (Playwright)
- Use `data-testid` attributes for test-specific selectors
- Never use `page.waitForTimeout()` — rely on Playwright auto-waiting
- Each test seeds its own data via API — no shared mutable state
- Use `storageState` for auth — don't log in through UI in every test
- Run with `--retries=2` in CI but fix flaky tests immediately
- Use `test.describe.serial()` only when test order genuinely matters
- Mobile testing: set viewport via `page.setViewportSize()` or project config
- Keep E2E count low: only critical user paths (checkout, signup, core workflows)

## Visual Regression
- Snapshot specific components, not full pages (less fragile)
- Mask dynamic content: dates, avatars, animations, third-party widgets
- Set `maxDiffPixelRatio: 0.01` — tight but not pixel-perfect
- Test responsive breakpoints: 375px (mobile), 768px (tablet), 1280px (desktop)
- Update snapshots intentionally, never blindly (`--update-snapshots`)
- Store baseline images in version control

## Accessibility Tests
- Run `jest-axe` / `@axe-core/playwright` on every component/page
- Test WCAG 2.1 AA by default (both A and AA tags)
- Verify keyboard navigation: Tab order, Enter/Space activation, Escape to close
- Test focus management: modals trap focus, focus returns after close
- Verify `aria-live` regions announce dynamic content
- Test all states: error messages, loading indicators, disabled controls

## Hook / Composable Tests
- Use `renderHook` (React) to test hooks in isolation
- Test initial state, state transitions, cleanup/unmount
- Mock context providers to test different scenarios
- Test error boundaries and error states
- For Vue composables: mount a wrapper component or use `@vue/test-utils`

## Integration Tests (Component + Store + Router)
- Wrap components in real providers (store, router, query client)
- Mock API layer with MSW — not the store or router
- Test complete user flows within a page
- Verify navigation, store mutations, and API calls together
- Test loading → success and loading → error flows

## General Rules
- No `sleep()` — use `waitFor`, `findBy*`, or Playwright auto-waiting
- Component tests must not depend on global CSS or external state
- Mock API responses at the network layer (MSW) — not at the import level
- Use `vi.useFakeTimers()` for animations, debounce, setTimeout
- Clean up: `cleanup()` after each test (automatic in Testing Library)
- Tests must work in headless mode — no browser-specific assumptions
