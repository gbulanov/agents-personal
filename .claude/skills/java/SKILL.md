---
name: java
description: Java/Spring Boot development — new projects, debugging, Spring config, build issues, migrations, code review
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: new|debug|spring|build|migrate|review> <target>"
---

# Java Development

Action: $ARGUMENTS

## Actions

### `new` <component-type> <name>
Generate Java code following best practices:
- **controller**: REST controller with proper annotations, validation, error handling
- **service**: Service class with constructor injection, transactional boundaries
- **repository**: Spring Data JPA repository with custom queries
- **entity**: JPA entity with proper mapping, audit fields
- **dto**: Record-based DTO with validation annotations
- **test**: JUnit 5 test class with Mockito setup

### `debug` <issue-description>
Diagnose Java/Spring Boot issues:
1. Read error logs and stack traces
2. Identify common patterns (bean creation failure, transaction issues, classpath conflicts)
3. Check configuration (application.yml, profiles)
4. Suggest fix with code changes

### `spring` <topic>
Spring Boot configuration help:
- **security**: Security filter chain, auth config, CORS
- **data**: JPA config, datasource, Flyway/Liquibase
- **web**: MVC config, interceptors, exception handling
- **actuator**: Health checks, metrics, custom endpoints
- **cache**: Cache configuration, providers, eviction
- **async**: @Async setup, thread pool config, CompletableFuture

### `build` <issue>
Maven/Gradle build troubleshooting:
1. Dependency conflict resolution (`mvn dependency:tree`, `gradle dependencies`)
2. Plugin configuration issues
3. Multi-module build ordering
4. Version catalog management (Gradle)

### `migrate` <from> <to>
Plan version migration:
- Java 8→11, 11→17, 17→21
- Spring Boot 2→3
- JUnit 4→5
- javax→jakarta namespace

### `review` <file-or-directory>
Code review against Java best practices:
- Optional over null, Records for DTOs
- Proper exception handling, logging
- Transaction scope, N+1 detection
- Thread safety, resource management
