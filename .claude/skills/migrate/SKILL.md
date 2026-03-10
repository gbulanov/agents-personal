---
name: migrate
description: Plan infrastructure migrations — K8s upgrades, cluster rebuilds, cloud moves, service migrations, database migrations
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash, WebSearch, WebFetch
argument-hint: "<type: k8s-upgrade|cluster|account|service|database> <description>"
---

# Migration Planner

Migration: $ARGUMENTS

## Process

1. **Discover** — Inventory current state
   - Read IaC code, manifests, configs
   - List running resources and dependencies
   - Identify data stores and volumes

2. **Assess** — Risk and effort analysis
   - Breaking changes and compatibility
   - Data migration complexity
   - Downtime requirements
   - Rollback feasibility

3. **Plan** — Phased execution
   - Prerequisites and pre-flight checks
   - Step-by-step execution with validation gates
   - Rollback procedure for each phase
   - Maintenance window estimation

4. **Output** — Migration plan document
   ```
   ## Migration Plan: [Title]

   ### Current → Target
   ### Risk Assessment (table)
   ### Prerequisites (checklist)
   ### Phases with rollback
   ### Success Criteria
   ### Estimated Duration
   ```

Never execute migration steps — only plan and document.
