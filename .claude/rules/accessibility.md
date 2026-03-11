---
description: Web accessibility (a11y) conventions
paths:
  - "**/*.tsx"
  - "**/*.jsx"
  - "**/*.vue"
  - "**/*.svelte"
  - "**/*.html"
---

# Accessibility (a11y)

- Use semantic HTML: `<button>` not `<div onClick>`, `<nav>` not `<div class="nav">`
- Every `<img>` needs an `alt` attribute — decorative images use `alt=""`
- Form inputs need associated `<label>` elements (or `aria-label`)
- Interactive elements must be keyboard accessible — `Tab`, `Enter`, `Escape`
- Focus management: trap focus in modals, restore focus on close
- Color is not the only indicator — use icons, text, or patterns alongside color
- Color contrast: WCAG AA minimum — 4.5:1 for normal text, 3:1 for large text
- ARIA attributes: use only when semantic HTML is insufficient — don't ARIA-ify everything
- `aria-live` regions for dynamic content updates (toasts, form errors)
- Skip navigation link for keyboard users: `<a href="#main">Skip to content</a>`
- Respect `prefers-reduced-motion` — disable/reduce animations
- Test with keyboard only (no mouse), screen reader (VoiceOver/NVDA), and browser extensions (axe)
- Heading hierarchy: one `<h1>` per page, don't skip levels (`h1` → `h2` → `h3`)
- Touch targets: minimum 44x44px for mobile interactive elements
