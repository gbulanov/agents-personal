---
description: Rust coding conventions
paths:
  - "**/*.rs"
  - "**/Cargo.toml"
  - "**/Cargo.lock"
---

# Rust Conventions

- Use `Result<T, E>` for recoverable errors — `panic!` only for unrecoverable programmer bugs
- Use `thiserror` for library error types, `anyhow` for application error handling
- Wrap errors with context: `.context("failed to fetch user")?` or `map_err`
- Prefer borrowing (`&T`) over ownership (`T`) in function parameters when possible
- Avoid unnecessary `clone()` — borrow first, clone only if ownership is required
- Use `#[derive(...)]` thoughtfully — don't derive `Clone` or `Debug` on types that don't need it
- Every `unsafe` block must have a `// SAFETY: ...` comment explaining the invariant
- Use `clippy` in CI — treat warnings as errors: `#![deny(clippy::all)]`
- Prefer `&str` over `String` in function parameters, return `String` when ownership is given
- Use `Cow<'_, str>` when a function may or may not need to allocate
- Keep lifetimes explicit when elision rules make the code ambiguous
- Use `impl Trait` in argument position for simple generic bounds
- Organize: public API at top of file, private helpers at bottom, tests in `#[cfg(test)]` module
- Use `todo!()` and `unimplemented!()` as placeholders, never in production code
