---
name: aws
description: AWS operations — query resources, debug issues, generate IaC, analyze costs
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: query|debug|iam|sg|logs|costs|whoami> [target]"
---

# AWS Helper

Action: $ARGUMENTS

## Actions

### `whoami`
1. `aws sts get-caller-identity` — show current identity
2. `aws configure list` — show config source
3. Show current region and account context

### `query` <service> [filters]
Query AWS resources using the CLI:
- Format output as table or JSON depending on complexity
- Use `--query` JMESPath for filtering
- Always include region context
- Common queries:
  - EC2 instances: `aws ec2 describe-instances --query 'Reservations[].Instances[].{ID:InstanceId,Type:InstanceType,State:State.Name,Name:Tags[?Key==\`Name\`]|[0].Value}'`
  - EKS clusters: `aws eks list-clusters`
  - RDS instances: `aws rds describe-db-instances`
  - S3 buckets: `aws s3 ls`
  - Lambda functions: `aws lambda list-functions`

### `debug` <description>
Diagnose AWS issues:
1. Identify the service and resource involved
2. Check resource status and configuration
3. Check CloudWatch logs if applicable
4. Check IAM permissions if access denied
5. Check security groups and NACLs for networking issues
6. Check VPC flow logs for connectivity problems
7. Provide root cause and fix

### `iam` <action: analyze|policy|role>
IAM operations:
- `analyze <role/user>`: Show attached policies, effective permissions
- `policy <description>`: Generate least-privilege IAM policy JSON
- `role <description>`: Generate IAM role with trust policy for a specific use case

When generating policies:
- Use least privilege — only the actions and resources needed
- Use specific resource ARNs, not `*` where possible
- Add condition keys for extra security (e.g., `aws:SourceVpc`)
- Include deny statements for sensitive actions

### `sg` <security-group-id or description>
Security group analysis:
1. Show inbound and outbound rules
2. Flag overly permissive rules (0.0.0.0/0 on non-80/443)
3. Show which resources use this SG
4. Suggest tighter rules if possible

### `logs` <log-group or service>
1. Identify the CloudWatch log group
2. `aws logs tail <group> --since 1h --format short`
3. Filter for errors: `aws logs filter-log-events --log-group-name <group> --filter-pattern "ERROR"`
4. Summarize findings

### `costs` [service or timeframe]
1. `aws ce get-cost-and-usage` for the specified period (default: last 30 days)
2. Break down by service
3. Compare with previous period
4. Flag any unusual spikes
5. Suggest cost optimization opportunities

## Safety
- Never create or delete resources without explicit user confirmation
- Always show what a command will do before destructive operations
- Use `--dry-run` flag when available
- Confirm account and region before any write operations
