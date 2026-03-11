---
name: dr
description: Disaster recovery — audit backups, assess RTO/RPO, review DR runbooks, plan recovery procedures
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: audit|plan|runbook|test> [scope]"
---

# Disaster Recovery

Action: $ARGUMENTS

## Actions

### `audit` [scope]
Audit current backup and DR posture:
1. **Databases**: Check backup configuration
   ```bash
   aws rds describe-db-instances --query "DBInstances[*].{ID:DBInstanceIdentifier,Backup:BackupRetentionPeriod,MultiAZ:MultiAZ,Encrypted:StorageEncrypted}"
   ```
2. **S3**: Versioning and cross-region replication
   ```bash
   aws s3api get-bucket-versioning --bucket <name>
   aws s3api get-bucket-replication --bucket <name>
   ```
3. **EBS**: Snapshots and lifecycle policies
4. **Kubernetes**: etcd backup, PV snapshots, Velero/backup-operator
5. **Secrets**: Backup of secrets and encryption keys
6. **DNS**: Failover routing configured?

### `plan` <service or scope>
Create a DR plan:
1. Identify critical services and data stores
2. Define RTO (Recovery Time Objective) and RPO (Recovery Point Objective)
3. Map dependencies and recovery order
4. Design recovery procedure for each failure scenario:
   - Single AZ failure
   - Full region failure
   - Data corruption
   - Accidental deletion
5. Estimate recovery time for each scenario

### `runbook` <scenario>
Generate a DR runbook for a specific scenario:
1. Pre-conditions and detection
2. Decision criteria (when to invoke DR)
3. Step-by-step recovery procedure
4. Validation checks at each step
5. Communication plan (who to notify, when)
6. Post-recovery actions (data reconciliation, monitoring)

### `test` [scope]
Plan a DR test:
1. Define test scope (tabletop, partial, full failover)
2. Pre-test checklist
3. Test execution steps
4. Success criteria
5. Rollback procedure if test fails
6. Post-test review template
