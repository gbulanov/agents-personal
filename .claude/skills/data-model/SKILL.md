---
name: data-model
description: Data modeling — design schemas, plan migrations, review entity relationships, generate seed data, optimize queries
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, Edit, Write
argument-hint: "<action: design|migrate|review|seed|query> <target>"
---

# Data Modeling

Action: $ARGUMENTS

## Actions

### `design` <description>
Design a data model:
1. Identify entities and relationships
2. Choose appropriate field types
3. Design indexes for query patterns
4. Add constraints (NOT NULL, UNIQUE, CHECK, FK)
5. Include audit fields (created_at, updated_at)
6. Output as SQL DDL or ORM model code

### `migrate` <description>
Plan a schema migration:
1. Analyze current schema
2. Design target schema changes
3. Assess migration safety (table locks, backfill)
4. Generate migration file (Flyway/Alembic/goose/Prisma)
5. Plan zero-downtime strategy if needed
6. Write rollback migration

### `review` <schema-or-migration-file>
Review data model:
1. Check normalization level
2. Verify indexes match query patterns
3. Check constraint completeness
4. Flag missing audit fields
5. Check migration safety for production

### `seed` <table-or-model>
Generate seed/fixture data:
1. Read schema/model definition
2. Generate realistic test data
3. Handle foreign key relationships
4. Output as SQL INSERT, factory, or fixture file

### `query` <description>
Design optimized queries:
1. Understand the data requirement
2. Write query (SQL, ORM, or query builder)
3. Check index usage
4. Optimize for the specific database (PostgreSQL, MySQL, etc.)
5. Include pagination if returning multiple rows
