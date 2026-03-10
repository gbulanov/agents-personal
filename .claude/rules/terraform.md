---
description: Terraform and IaC conventions
paths:
  - "**/*.tf"
  - "**/*.tfvars"
  - "**/terragrunt.hcl"
  - "modules/**"
  - "terraform/**"
  - "infra/**"
---

# Terraform Conventions

## File Structure
- `main.tf` — primary resources
- `variables.tf` — all input variables with descriptions and types
- `outputs.tf` — all outputs with descriptions
- `versions.tf` — required providers and terraform version
- `locals.tf` — local values
- `data.tf` — data sources (or co-locate with the resources that use them)
- `backend.tf` — backend configuration (environment-specific)

## Naming
- Resources: `snake_case`, descriptive (`aws_s3_bucket.app_assets`, not `aws_s3_bucket.bucket1`)
- Variables: `snake_case`, prefixed by purpose if in a module (`db_instance_class`)
- Outputs: `snake_case`, describe what they expose (`vpc_id`, `cluster_endpoint`)

## Variables
- Always include `description` and `type`
- Add `validation` blocks for constrained values
- Use `default` only when a sensible default exists
- Mark secrets with `sensitive = true`
- Group related variables together

## Resources
- Tag everything: Name, Environment, Owner, Team, ManagedBy=terraform
- Use `for_each` over `count` — stable resource keys survive reordering
- Use `lifecycle { prevent_destroy = true }` on stateful resources
- Use `depends_on` sparingly — prefer implicit dependencies
- Use `moved` blocks for renaming resources (not state surgery)

## State
- Remote backend with locking (S3 + DynamoDB)
- State encryption enabled
- Separate state per environment
- Never edit state manually — use `terraform state mv/rm/import`

## Providers
- Pin with pessimistic constraint: `~> 5.0`
- Configure in root module only
- Use `required_providers` block in all modules

## Modules
- Version pin with git tags or registry versions
- Keep modules focused — one logical concern per module
- Document inputs, outputs, and usage in README
- Use `terraform-docs` for auto-generated documentation
