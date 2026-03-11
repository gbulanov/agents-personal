---
name: db
description: Database operations — query optimization, schema review, connection pooling, RDS/DynamoDB/Redis analysis
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: review|optimize|health|migration|connections> <target>"
---

# Database Ops

Action: $ARGUMENTS

## Actions

### `review` <schema-file or migration-dir>
Review database schema or migrations:
1. Read schema/migration files
2. Check data types, constraints, indexes
3. Flag missing foreign keys, NOT NULL constraints
4. Check migration safety (table locks, backfill risks)
5. Verify index coverage for common query patterns

### `optimize` <query or file>
Analyze query performance:
1. Review the query structure
2. Identify missing indexes, full table scans
3. Check for N+1 patterns in application code
4. Suggest query rewrites or index additions
5. Estimate impact of changes

### `health` <rds-instance or db-identifier>
Check database health:
```bash
aws rds describe-db-instances --db-instance-identifier <id>
aws cloudwatch get-metric-statistics --namespace AWS/RDS ...
```
- CPU, memory, IOPS, connections, replica lag
- Storage utilization and auto-scaling status
- Backup configuration and retention
- Parameter group settings

### `migration` <description>
Plan a database migration:
1. Assess schema change risk (locking, data loss)
2. Estimate migration duration
3. Plan zero-downtime strategy (expand/contract, dual-write)
4. Define rollback procedure
5. Create pre/post migration validation checks

### `connections` <service or rds-instance>
Analyze connection management:
1. Check connection pool configuration in application
2. Compare pool size vs RDS max_connections
3. Check for connection leaks
4. Review PgBouncer/ProxySQL/RDS Proxy setup
5. Recommend optimal pool sizing
