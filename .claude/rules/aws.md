---
description: AWS infrastructure conventions and security requirements
paths:
  - "**/*.tf"
  - "**/*.tfvars"
  - "**/aws/**"
  - "**/cdk/**"
  - "**/cloudformation/**"
---

# AWS Conventions

## IAM
- Least privilege — only the permissions needed
- Use roles over users for services and automation
- Use IRSA (IAM Roles for Service Accounts) for EKS workloads
- No inline policies on roles — use managed or customer policies
- Never use `*` for resources unless absolutely necessary
- Add condition keys: `aws:SourceVpc`, `aws:PrincipalOrgID`
- Review and rotate credentials regularly

## Networking
- Private subnets for compute, public only for load balancers
- VPC endpoints for S3 and DynamoDB (saves NAT costs + faster)
- Security groups: deny by default, minimal ingress rules
- No 0.0.0.0/0 on SSH/RDP — use SSM Session Manager
- Use AWS PrivateLink for cross-account/service connectivity
- Tag all networking resources

## Storage
- S3: block public access, enable versioning, SSE-S3 or SSE-KMS
- S3 lifecycle policies for cost management
- EBS: use gp3 (cheaper and faster than gp2)
- Enable encryption at rest for all data stores

## Compute
- Use Graviton (ARM) instances where compatible
- Auto-scaling groups with proper health checks
- Use Spot for fault-tolerant workloads
- IMDSv2 required (disable IMDSv1)

## Database
- Multi-AZ for production
- Automated backups with appropriate retention
- Encryption at rest and in transit
- No public accessibility for databases
- Use IAM authentication where possible

## Monitoring
- CloudWatch alarms for critical metrics
- CloudTrail enabled in all regions
- VPC Flow Logs for security monitoring
- AWS Config for compliance tracking
- Centralize logs in CloudWatch Logs or S3

## Tagging
Required tags on all resources:
- `Name` — human-readable identifier
- `Environment` — dev/staging/prod
- `Owner` — team or individual
- `ManagedBy` — terraform/manual/cdk
- `CostCenter` — for cost allocation
