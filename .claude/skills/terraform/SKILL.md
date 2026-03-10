---
name: terraform
description: Write, review, or troubleshoot Terraform/OpenTofu IaC code
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: plan|validate|fmt|new-module|import|migrate|debug> [target]"
---

# Terraform Helper

Action: $ARGUMENTS

## Actions

### `plan` [path]
1. Run `terraform fmt -check -recursive` to catch formatting issues
2. Run `terraform validate` to check syntax
3. Run `terraform plan -no-color` and analyze the output
4. Summarize: resources to add/change/destroy, potential issues, blast radius
5. Flag any destructive changes (destroy, replace) prominently

### `validate` [path]
1. Run `terraform fmt -check -recursive`
2. Run `terraform validate`
3. Check for common issues:
   - Hardcoded values that should be variables
   - Missing description on variables/outputs
   - Resources without tags
   - Deprecated resource attributes
   - Missing lifecycle blocks on stateful resources

### `fmt`
1. Run `terraform fmt -recursive -diff` to show what would change
2. Apply with `terraform fmt -recursive`

### `new-module` <name>
Create a new Terraform module following best practices:
```
modules/<name>/
├── main.tf          # Primary resources
├── variables.tf     # Input variables with descriptions and types
├── outputs.tf       # Output values
├── versions.tf      # Required providers and terraform version
├── locals.tf        # Local values (if needed)
└── README.md        # Module documentation
```
- Use sensible variable defaults where possible
- Add validation blocks on variables with constraints
- Tag all resources with `var.tags`
- Use `terraform-docs` compatible comments

### `import` <resource_type> <resource_id>
1. Generate the import block
2. Generate a skeleton resource block matching the cloud resource
3. Suggest `terraform import` command or import block syntax

### `migrate` <description>
Help migrate Terraform code:
- State moves (`terraform state mv`)
- Resource renames with `moved` blocks
- Provider upgrades
- Backend migration

### `debug` [error message or issue]
1. Parse the error message
2. Common fixes for known errors (state lock, provider auth, dependency cycles)
3. Check provider versions and constraints
4. Suggest resolution

## Best Practices Applied
- Use `for_each` over `count` for resources that need stable identity
- Use data sources to reference existing infrastructure
- Never hardcode AWS account IDs, regions, or ARNs
- Use `terraform_remote_state` or SSM parameters for cross-stack references
- Pin provider versions with pessimistic constraint (`~>`)
