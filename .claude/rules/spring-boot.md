---
description: Spring Boot conventions
paths:
  - "**/application*.yml"
  - "**/application*.yaml"
  - "**/application*.properties"
  - "**/*Controller.java"
  - "**/*Service.java"
  - "**/*Repository.java"
  - "**/*Config*.java"
---

# Spring Boot Conventions

- Layered architecture: Controller → Service → Repository — no skipping layers
- Controllers handle HTTP concerns only (validation, status codes, response mapping)
- Services contain business logic and transaction boundaries
- Repositories handle data access only — no business logic
- Use `@ControllerAdvice` with `ProblemDetail` for global exception handling
- Use `@Valid` on request body parameters for bean validation
- Configuration via `@ConfigurationProperties` bound classes, not scattered `@Value`
- Profile-specific config: `application-{profile}.yml` — never hardcode environment values
- Enable Actuator health checks: `/actuator/health` with custom health indicators
- Use `@Transactional(readOnly = true)` for read-only service methods
- `@Async` methods must return `CompletableFuture` and be called from outside the class
- Use `@SpringBootTest` sparingly — prefer `@WebMvcTest`, `@DataJpaTest` for sliced tests
- Configure connection pool (HikariCP) max size: `maximumPoolSize` ≈ (core_count * 2) + disk_spindles
