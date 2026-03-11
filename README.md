# Personal Agent Agency

A collection of reusable [Claude Code](https://docs.anthropic.com/en/docs/claude-code) agents and skills for DevOps, SRE, cloud engineering, and software development workflows.

**23 agents** | **35 skills** | **15 rule files** — ready to drop into any project.

## What This Is

A personal library of Claude Code extensions:

- **Agents** — specialized subagents that Claude delegates to automatically for complex tasks
- **Skills** — slash commands (`/terraform`, `/k8s`, etc.) that encode repeatable workflows
- **Rules** — context-specific coding conventions applied automatically based on file patterns
- **Hooks** — lifecycle scripts (pre-commit secret scanning, post-edit validation)

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
> /deploy-review
> /onboard-cluster
> /scaffold helm-chart my-service
> /monitor slo my-api
> /db health my-rds-instance
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
| `/monitor` | `alerts` `slo` `dashboards` `cloudwatch` `review` | Monitoring, alerting, and SLO design |
| `/db` | `review` `optimize` `health` `migration` `connections` | Database operations and query optimization |
| `/docker` | `review` `scan` `harden` `compose` | Container security and Dockerfile review |
| `/deps` | `audit` `outdated` `licenses` `upgrade-plan` | Dependency vulnerability and license scanning |
| `/dns` | `query` `debug` `audit` `records` | DNS operations and Route53 management |
| `/dr` | `audit` `plan` `runbook` `test` | Disaster recovery and backup audit |

### Networking & Debugging

| Skill | Actions | Description |
|-------|---------|-------------|
| `/network-debug` | `<source> cannot reach <target>` | Systematic network connectivity diagnosis |
| `/logs` | `k8s` `cloudwatch` `file` `system` | Log analysis and error pattern detection |
| `/yaml` | `validate` `fix` `diff` `convert` `merge` | YAML validation and transformation |
| `/pipeline` | `debug` `review` `create` `status` | CI/CD pipeline operations |
| `/loadtest` | `generate` `analyze` `plan` | Load test generation and result analysis |
| `/api-review` | `review` `breaking` `validate` `design` | API design review and OpenAPI validation |

### Planning

| Skill | Actions | Description |
|-------|---------|-------------|
| `/migrate` | `k8s-upgrade` `cluster` `account` `service` `database` | Infrastructure migration planning |

### Workflow Compositions

Composite skills that chain multiple checks into a single gate.

| Skill | Runs | Description |
|-------|------|-------------|
| `/deploy-review` | infra-review + compliance + secrets + cost | Pre-deployment quality gate |
| `/onboard-cluster` | nodes + workloads + helm + capacity + networking | Map an unfamiliar K8s cluster |
| `/pre-merge` | code review + security audit + secret scan | Pre-merge quality gate |

### Scaffolding

| Skill | Templates | Description |
|-------|-----------|-------------|
| `/scaffold` | `terraform-module` `helm-chart` `github-actions` `service` | Generate production-ready project scaffolds |

### General Development

| Skill | Description |
|-------|-------------|
| `/commit` | Smart commits with conventional commit messages |
| `/pr-review` | Review a pull request for quality and issues |
| `/deep-research` | Thorough codebase or topic research |
| `/code-audit` | Security and quality audit |
| `/doc-gen` | Generate documentation for code |
| `/refactor` | Refactor code with safety checks |

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
| **secrets-auditor** | Sonnet | Hardcoded secret detection, git history scanning, rotation audit |
| **observability-ops** | Sonnet | Prometheus rules, Grafana dashboards, CloudWatch alarms, SLO/SLI design |
| **db-ops** | Sonnet | Query optimization, schema review, connection pooling, RDS/DynamoDB/Redis |
| **container-security** | Sonnet | Dockerfile review, image scanning, supply chain (SBOM/signing), runtime policies |
| **dependency-checker** | Sonnet | Vulnerability scanning, upgrade planning, breaking changes, license compliance |

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

### Infrastructure Rules

| Rule | Applies To | Key Conventions |
|------|-----------|----------------|
| **terraform.md** | `*.tf` files | Module structure, naming, state management, security |
| **kubernetes.md** | K8s manifests | Resource limits, labels, probes, security context |
| **kops.md** | Kops configs | Cluster spec, instance groups, networking, upgrades |
| **aws.md** | AWS infrastructure | Tagging, encryption, least privilege, multi-AZ |
| **docker.md** | Dockerfiles | Multi-stage builds, non-root users, layer caching |
| **cicd.md** | Workflows/pipelines | Pin actions to SHA, timeouts, concurrency, secrets |
| **helm-charts.md** | Chart.yaml, values.yaml | Standard labels, secure defaults, value documentation |
| **monitoring.md** | Alert rules, dashboards | Severity labels, runbook links, RED/USE methods |

### Language Rules

| Rule | Applies To | Key Conventions |
|------|-----------|----------------|
| **python.md** | `*.py` | Type hints, ruff/black formatting, pathlib, logging |
| **golang.md** | `*.go` | Error wrapping, small interfaces, context.Context, table tests |
| **typescript.md** | `*.ts`, `*.tsx` | Strict mode, no `any`, discriminated unions, zod validation |

### General Rules

| Rule | Applies To | Key Conventions |
|------|-----------|----------------|
| **code-style.md** | All code | Naming, function size, error handling, imports |
| **testing.md** | Test files | Behavior testing, AAA structure, edge cases |
| **security.md** | All files | No hardcoded secrets, input validation, HTTPS |
| **git.md** | Git operations | Conventional commits, atomic changes, no force-push |

---

## Hooks

### Pre-Commit Secret Scanner

Scans staged files for hardcoded secrets before every commit.

```bash
# Install into your project
ln -s $(pwd)/.claude/hooks/pre-commit-secrets.sh .git/hooks/pre-commit
```

Detects: AWS keys, private keys, passwords, connection strings, GitHub PATs, Slack tokens, JWTs, API keys (OpenAI/Anthropic/Stripe).

### Post-Edit Hook

Runs after every Write/Edit tool call. Customize per project for auto-formatting or linting.

---

## Project Structure

```
.claude/
├── settings.json              # Permissions, hooks, project config
│
├── skills/                    # 35 slash commands
│   │
│   │  DevOps & Infrastructure
│   ├── terraform/             ├── helm/              ├── iam/
│   ├── k8s/                   ├── incident/          ├── compliance/
│   ├── kops/                  ├── infra-review/      ├── capacity/
│   ├── aws/                   ├── cost-review/       ├── secrets/
│   ├── monitor/               ├── db/                ├── docker/
│   ├── deps/                  ├── dns/               ├── dr/
│   │
│   │  Networking & Debugging
│   ├── yaml/                  ├── logs/              ├── network-debug/
│   ├── pipeline/              ├── loadtest/          ├── api-review/
│   │
│   │  Planning & Migration
│   ├── migrate/
│   │
│   │  Workflow Compositions
│   ├── deploy-review/         ├── onboard-cluster/   ├── pre-merge/
│   │
│   │  Scaffolding
│   ├── scaffold/
│   │
│   │  General Development
│   ├── commit/                ├── pr-review/         ├── deep-research/
│   ├── code-audit/            ├── doc-gen/           └── refactor/
│
├── agents/                    # 23 specialized agents
│   ├── sre/                   ├── helm-ops/          ├── iam-analyzer/
│   ├── terraform-reviewer/    ├── compliance-checker/ ├── capacity-planner/
│   ├── k8s-ops/               ├── secrets-auditor/   ├── network-debugger/
│   ├── kops-manager/          ├── log-analyzer/      ├── yaml-surgeon/
│   ├── cloud-architect/       ├── pipeline-ops/      ├── migration-planner/
│   ├── observability-ops/     ├── db-ops/            ├── container-security/
│   ├── dependency-checker/
│   ├── code-reviewer/         ├── debugger/
│   ├── architect/             └── researcher/
│
├── rules/                     # 15 context-specific rule files
│   ├── terraform.md           ├── kubernetes.md      ├── kops.md
│   ├── aws.md                 ├── docker.md          ├── cicd.md
│   ├── helm-charts.md         ├── monitoring.md
│   ├── python.md              ├── golang.md          ├── typescript.md
│   ├── code-style.md          ├── testing.md
│   ├── security.md            └── git.md
│
└── hooks/                     # Lifecycle hook scripts
    ├── post-edit.sh           # Auto-format/lint after edits
    └── pre-commit-secrets.sh  # Block commits with hardcoded secrets
```

## Settings

The `settings.json` configures:

- **Allowed commands** — Read-only operations auto-approved: `kubectl get`, `aws describe`, `helm list`, `terraform plan`, `trivy`, `dig`, `npm audit`, `pip-audit`, `govulncheck`, and more
- **Denied commands** — Destructive operations blocked: `terraform destroy`, `kubectl delete namespace`, `force-push to main`, `aws terminate-instances`, `kops delete`
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

### Install the Pre-Commit Hook

```bash
ln -s $(pwd)/.claude/hooks/pre-commit-secrets.sh .git/hooks/pre-commit
```

## License

Personal use. Fork and adapt to your own workflows.
