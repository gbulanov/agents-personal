---
description: Java coding conventions
paths:
  - "**/*.java"
  - "**/pom.xml"
  - "**/build.gradle*"
  - "**/settings.gradle*"
---

# Java Conventions

- Use `Optional` instead of returning `null` — `Optional.ofNullable()`, never `Optional.get()` without check
- Use records for DTOs, value objects, and immutable data carriers
- Constructor injection only — no `@Autowired` on fields or setters
- `@Transactional` on service methods, not controllers or repositories
- Catch specific exceptions — never `catch (Exception e)` unless re-throwing
- Use SLF4J with `{}` placeholders: `log.info("User {} logged in", userId)` not concatenation
- Close resources with try-with-resources (streams, connections, readers)
- Use `Stream` API for collection transformations, but don't chain more than 3-4 operations
- Prefer `List.of()`, `Map.of()` for immutable collections
- Use `sealed` interfaces for restricted type hierarchies (Java 17+)
- Override `equals`/`hashCode` consistently, or use records/Lombok `@Value`
- No business logic in controllers — delegate to service layer
- Use `var` for local variables when the type is obvious from context
