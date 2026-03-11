# Personal Agent Agency

A collection of reusable [Claude Code](https://docs.anthropic.com/en/docs/claude-code) agents and skills for DevOps, SRE, cloud engineering, and software development workflows.

**19 agents** | **23 skills** | **10 rule files** — ready to drop into any project.

## What This Is

A personal library of Claude Code extensions:

- **Agents** — specialized subagents that Claude delegates to automatically for complex tasks
- **Skills** — slash commands (`/terraform`, `/k8s`, etc.) that encode repeatable workflows
- **Rules** — context-specific coding conventions applied automatically based on file patterns

Clone or symlink the `.claude/` directory into any project to get a fully-equipped AI-powered DevOps toolkit.

## Quick Start

```bash
# Option 1: Clone the whole repo
git clone <repo-url> ~/agents-personal

# Option 2: Symlink into an existing project
ln -s ~/agents-personal/.claude /path/to/your/project/.claude

# Then just use Claude Code as normal — agents and skills are auto-discovered
claude
```

Once set up, use skills with slash commands:

```
> /terraform plan
> /k8s debug my-pod
> /logs k8s my-deployment production
> /compliance cis-aws
> /secrets scan
```

Agents are invoked automatically by Claude when the task matches their specialization.

---

## Skills Reference

### DevOps & Infrastructure

| Skill | Actions | Description |
|-------|---------|-------------|
| `/terraform` | `plan` `validate` `fmt` `new-module` `import` `migrate` `debug` | Terraform operations and code generation |
| `/k8s` | `manifest` `debug` `review` `status` `rollback` `scale` `logs` | Kubernetes operations and debugging |
| `/kops` | `status` `get` `create` `edit` `update` `upgrade` `rolling-update` `ig` `drain` `certs` `etcd` `addons` `debug` `export` `delete` | Full Kops cluster lifecycle management |
| `/helm` | `status` `diff` `template` `lint` `debug` `history` `deps` | Helm chart and release operations |
| `/aws` | `query` `debug` `iam` `sg` `logs` `costs` `whoami` | AWS operations and resource management |
| `/iam` | `analyze` `policy` `role` `audit` `irsa` | AWS IAM analysis and policy generation |
| `/incident` | `investigate` `mitigate` `postmortem` `runbook` | Incident response workflow |
| `/infra-review` | — | Review IaC for security, reliability, and best practices |
| `/cost-review` | — | Infrastructure cost optimization analysis |
| `/compliance` | `cis-aws` `cis-k8s` `soc2` `pci` `all` | Compliance audit against security benchmarks |
| `/capacity` | `analyze` `rightsize` `forecast` `nodes` | Resource utilization and capacity planning |
| `/secrets` | `scan` `audit` `rotation` `review` | Secret leak detection and management audit |

### Networking & Debugging

| Skill | Actions | Description |
|-------|---------|-------------|
| `/network-debug` | `<source> cannot reach <target>` | Systematic network connectivity diagnosis |
| `/logs` | `k8s` `cloudwatch` `file` `system` | Log analysis and error pattern detection |
| `/yaml` | `validate` `fix` `diff` `convert` `merge` | YAML validation and transformation |
| `/pipeline` | `debug` `review` `create` `status` | CI/CD pipeline operations |

### Planning

| Skill | Actions | Description |
|-------|---------|-------------|
| `/migrate` | `k8s-upgrade` `cluster` `account` `service` `database` | Infrastructure migration planning |

### General Development

| Skill | Actions | Description |
|-------|---------|-------------|
| `/commit` | — | Smart commits with conventional commit messages |
| `/pr-review` | — | Review a pull request for quality and issues |
| `/deep-research` | — | Thorough codebase or topic research |
| `/code-audit` | — | Security and quality audit |
| `/doc-gen` | — | Generate documentation for code |
| `/refactor` | — | Refactor code with safety checks |

---

## Agents Reference

Agents are automatically delegated to by Claude when tasks match their specialization. You don't invoke them directly — Claude routes work to them.

### DevOps & Infrastructure

| Agent | Model | What It Does |
|-------|-------|-------------|
| **sre** | Sonnet | Incident investigation, reliability assessment, SLO review, monitoring gaps |
| **terraform-reviewer** | Sonnet | Terraform code review for security, cost, reliability, and best practices |
| **k8s-ops** | Sonnet | Cluster health checks, pod debugging, manifest review, workload management |
| **kops-manager** | Sonnet | Kops cluster operations, upgrades, instance groups, networking, etcd |
| **helm-ops** | Sonnet | Release debugging, chart review, values diffing, dependency management |
| **cloud-architect** | Opus | AWS architecture design, migration planning, cost/perf trade-off analysis |
| **iam-analyzer** | Sonnet | Permission chain tracing, least-privilege policies, IRSA/OIDC, escalation paths |
| **compliance-checker** | Sonnet | CIS AWS/K8s, SOC2, PCI-DSS audits with specific Terraform/K8s remediation |
| **capacity-planner** | Sonnet | Resource right-sizing, node pool optimization, RI/Savings Plans, forecasting |
| **secrets-auditor** | Sonnet | Hardcoded secret detection, git history scanning, rotation audit, management review |

### Networking & Debugging

| Agent | Model | What It Does |
|-------|-------|-------------|
| **network-debugger** | Sonnet | Layer-by-layer diagnosis: DNS → K8s → SGs → NACLs → routes → LBs → app |
| **log-analyzer** | Sonnet | Cross-service log correlation, error pattern detection, timeline analysis |
| **yaml-surgeon** | Sonnet | Schema-aware YAML validation (K8s, Helm, kops, GH Actions, compose) |
| **pipeline-ops** | Sonnet | CI/CD debugging for GitHub Actions, ArgoCD, Jenkins, GitLab CI |
| **migration-planner** | Opus | Phased migration plans with rollback strategies for any infra change |

### General Development

| Agent | Model | What It Does |
|-------|-------|-------------|
| **code-reviewer** | Sonnet | Code quality, security, performance, and best practices review |
| **debugger** | Sonnet | Test failure diagnosis, runtime error investigation, root cause analysis |
| **architect** | Opus | System architecture design, technical trade-offs, implementation strategy |
| **researcher** | Sonnet | Deep codebase exploration, library research, technical context gathering |

---

## Rules

Rules are automatically applied based on file patterns. They enforce conventions without manual invocation.

| Rule | Applies To | Key Conventions |
|------|-----------|----------------|
| **terraform.md** | `*.tf` files | Module structure, naming, state management, security |
| **kubernetes.md** | K8s manifests | Resource limits, labels, probes, security context |
| **kops.md** | Kops configs | Cluster spec, instance groups, networking, upgrades |
| **aws.md** | AWS infrastructure | Tagging, encryption, least privilege, multi-AZ |
| **docker.md** | Dockerfiles | Multi-stage builds, non-root users, layer caching |
| **cicd.md** | Workflows/pipelines | Pin actions to SHA, timeouts, concurrency, secrets |
| **code-style.md** | All code | Naming, function size, error handling, imports |
| **testing.md** | Test files | Behavior testing, AAA structure, edge cases |
| **security.md** | All files | No hardcoded secrets, input validation, HTTPS |
| **git.md** | Git operations | Conventional commits, atomic changes, no force-push |

---

## Project Structure

```
.claude/
├── settings.json              # Permissions, hooks, project config
│
├── skills/                    # 23 slash commands
│   ├── terraform/             ├── helm/              ├── iam/
│   ├── k8s/                   ├── incident/          ├── compliance/
│   ├── kops/                  ├── infra-review/      ├── capacity/
│   ├── aws/                   ├── cost-review/       ├── secrets/
│   ├── yaml/                  ├── logs/              ├── network-debug/
│   ├── pipeline/              ├── migrate/
│   ├── commit/                ├── pr-review/         ├── deep-research/
│   ├── code-audit/            ├── doc-gen/           └── refactor/
│
├── agents/                    # 19 specialized agents
│   ├── sre/                   ├── helm-ops/          ├── iam-analyzer/
│   ├── terraform-reviewer/    ├── compliance-checker/ ├── capacity-planner/
│   ├── k8s-ops/               ├── secrets-auditor/   ├── network-debugger/
│   ├── kops-manager/          ├── log-analyzer/      ├── yaml-surgeon/
│   ├── cloud-architect/       ├── pipeline-ops/      ├── migration-planner/
│   ├── code-reviewer/         ├── debugger/
│   ├── architect/             └── researcher/
│
├── rules/                     # 10 context-specific rule files
│   ├── terraform.md           ├── kubernetes.md      ├── kops.md
│   ├── aws.md                 ├── docker.md          ├── cicd.md
│   ├── code-style.md          ├── testing.md
│   ├── security.md            └── git.md
│
└── hooks/                     # Lifecycle hook scripts
    └── post-edit.sh
```

## Settings

The `settings.json` configures:

- **Allowed commands** — Read-only operations auto-approved (kubectl get, aws describe, helm list, terraform plan, etc.)
- **Denied commands** — Destructive operations blocked (terraform destroy, kubectl delete namespace, force-push to main, etc.)
- **Hooks** — Post-edit hooks for linting and validation

## Extending

### Add a New Skill

```bash
mkdir .claude/skills/my-skill
cat > .claude/skills/my-skill/SKILL.md << 'EOF'
---
name: my-skill
description: What this skill does
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action> <target>"
---

# My Skill

Instructions for the skill...
EOF
```

### Add a New Agent

```bash
mkdir .claude/agents/my-agent
cat > .claude/agents/my-agent/agent.md << 'EOF'
---
name: my-agent
description: What this agent does
tools: Read, Grep, Glob, Bash
model: sonnet
maxTurns: 25
---

Instructions for the agent...
EOF
```

### Add a New Rule

```bash
cat > .claude/rules/my-rule.md << 'EOF'
---
description: When this rule applies
paths:
  - "**/*.ext"
---

# My Rule

Conventions to enforce...
EOF
```

## License

Personal use. Fork and adapt to your own workflows.
