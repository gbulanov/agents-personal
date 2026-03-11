---
description: Go coding conventions
paths:
  - "**/*.go"
  - "**/go.mod"
  - "**/go.sum"
---

# Go Conventions

- Always handle errors — never use `_` to discard errors unless explicitly justified
- Wrap errors with context: `fmt.Errorf("fetch user %d: %w", id, err)`
- Use `errors.Is()` and `errors.As()` for error checking — never string comparison
- Keep interfaces small (1-3 methods) and define them where they're used, not where they're implemented
- Accept interfaces, return structs
- Use `context.Context` as first parameter for functions that do I/O or may be cancelled
- Use `struct{}` for signal channels, not `bool`
- Avoid `init()` — prefer explicit initialization
- Use table-driven tests with `t.Run()` subtests
- Use `go vet`, `staticcheck`, and `golangci-lint`
- No `panic` in library code — return errors instead
- Use `sync.Mutex` only when necessary — prefer channels for communication
- Name return values only when they meaningfully document the function
- Export only what external packages need — keep packages focused
