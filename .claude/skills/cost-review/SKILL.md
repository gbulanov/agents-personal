---
name: cost-review
description: Review infrastructure for cost optimization — right-sizing, waste, reserved capacity, architecture
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "[terraform path or 'aws' for live account analysis]"
---

# Cost Review

Target: $ARGUMENTS

## For Terraform/IaC Code Review

Analyze infrastructure code for cost optimization:

### Compute
- [ ] Instance types appropriate for workload (not over-provisioned)
- [ ] Auto-scaling configured (min/max/desired)
- [ ] Spot instances or Fargate Spot for fault-tolerant workloads
- [ ] Graviton (ARM) instances where compatible
- [ ] Right-sized EKS node groups

### Storage
- [ ] S3 lifecycle policies for old objects (transition to IA/Glacier)
- [ ] EBS volumes: gp3 over gp2 (cheaper, faster)
- [ ] Unused EBS snapshots cleanup
- [ ] RDS storage auto-scaling enabled
- [ ] DynamoDB on-demand vs provisioned (check usage patterns)

### Networking
- [ ] NAT Gateway optimization (one per AZ vs shared)
- [ ] VPC endpoints for S3/DynamoDB to avoid NAT costs
- [ ] Data transfer paths optimized (same-AZ where possible)
- [ ] CloudFront for static content (reduces origin load + transfer costs)

### Database
- [ ] RDS instance class right-sized
- [ ] Reserved instances for steady-state workloads
- [ ] Aurora Serverless v2 for variable workloads
- [ ] Read replicas vs scaling up
- [ ] ElastiCache node type appropriate

### Kubernetes
- [ ] Resource requests match actual usage (not over-requested)
- [ ] Cluster autoscaler configured
- [ ] Karpenter for dynamic node provisioning
- [ ] Pod right-sizing based on metrics

## For Live AWS Account Analysis

1. `aws ce get-cost-and-usage` — last 30 days by service
2. `aws ce get-cost-forecast` — projected costs
3. `aws compute-optimizer get-ec2-instance-recommendations` — right-sizing
4. Check for idle resources:
   - Unattached EBS volumes
   - Unused Elastic IPs
   - Idle load balancers
   - Stopped EC2 instances with attached storage
5. Reserved instance coverage gaps

## Output Format

```
## Cost Review

### Estimated Monthly Savings: $X,XXX

### Quick Wins (< 1 day effort)
1. **[Change]** — Save ~$XX/month
   - Current: ...
   - Recommended: ...

### Medium Effort (1-5 days)
1. ...

### Strategic Changes (> 1 week)
1. ...

### Already Optimized
- [What's already well-done]
```
