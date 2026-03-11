---
name: rust-dev
description: Rust development — new projects, debugging, API handlers, testing, unsafe audit, code review
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: new|debug|api|test|review|unsafe-audit> <target>"
---

# Rust Development

Action: $ARGUMENTS

## Actions

### `new` <component-type> <name>
Generate Rust code following best practices:
- **handler**: Axum/Actix handler with extractors, error handling
- **service**: Service struct with trait, impl, error types
- **model**: Struct with Serde derives, validation
- **error**: Custom error enum with thiserror
- **middleware**: Tower layer/service or Actix middleware
- **test**: Unit test module with async support

### `debug` <issue-description>
Diagnose Rust application issues:
1. Read compiler errors (borrow checker, lifetime, type mismatch)
2. Explain what the compiler wants and why
3. Suggest idiomatic fix
4. Common patterns: ownership transfer, lifetime annotation, trait bounds

### `api` <description>
Design or implement API endpoints:
1. Define route structure (Axum Router or Actix scope)
2. Generate handler, request/response types with Serde
3. Add extractors, error handling
4. Add middleware layers

### `test` <file-or-function>
Generate or review tests:
1. Read the target code
2. Generate `#[test]` or `#[tokio::test]` functions
3. Include error cases, edge cases
4. Add property tests with proptest if appropriate

### `review` <file-or-directory>
Code review against Rust best practices:
- Ownership and borrowing correctness
- Error handling (Result, thiserror/anyhow)
- Unnecessary clones, allocations
- Clippy compliance, idiomatic patterns

### `unsafe-audit` <file-or-directory>
Audit unsafe code blocks:
1. Find all `unsafe` blocks
2. Verify safety comments exist
3. Check pointer validity, aliasing rules
4. Verify FFI boundary correctness
5. Assess if unsafe is actually needed
