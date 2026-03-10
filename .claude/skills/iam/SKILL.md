---
name: iam
description: AWS IAM operations — analyze permissions, generate least-privilege policies, review roles, audit IRSA, trace access
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: analyze|policy|role|audit|irsa> <target>"
---

# IAM Analyzer

Action: $ARGUMENTS

## Actions

### `analyze` <role-or-user>
Trace effective permissions:
1. List attached and inline policies
2. Check group memberships (users)
3. Check trust policy (roles)
4. Show permission boundaries
5. Flag overly permissive policies
6. Identify privilege escalation paths

### `policy` <description>
Generate least-privilege IAM policy:
1. Understand the exact use case
2. Identify minimum required actions
3. Scope to specific resource ARNs
4. Add conditions (SourceVpc, PrincipalOrgID, etc.)
5. Output policy JSON ready to use

### `role` <description>
Generate IAM role with trust policy:
1. Determine the trust principal (service, account, OIDC)
2. Generate trust policy
3. Generate permission policy
4. Output complete Terraform `aws_iam_role` + `aws_iam_role_policy`

### `audit`
Full IAM security audit:
1. Users with console access but no MFA
2. Access keys older than 90 days
3. Unused roles and users
4. Policies with `*:*`
5. Cross-account trust relationships
6. Privilege escalation paths

### `irsa` <service-account> [namespace]
Review IRSA (IAM Roles for Service Accounts):
1. Check service account annotation for role ARN
2. Check role trust policy (OIDC provider, namespace, SA name)
3. Check role permissions
4. Verify OIDC provider configuration
5. Flag overly broad trust (missing namespace/SA conditions)
