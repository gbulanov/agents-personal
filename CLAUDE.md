# Personal Agent Agency

A collection of reusable Claude Code agents and skills for DevOps, SRE, cloud engineering,
and software development workflows.

## What This Repo Is

This is a personal library of Claude Code extensions — agents that handle specialized tasks
and skills (slash commands) that encode repeatable workflows. Clone or symlink into any
project to get a ready-made AI-powered development toolkit.

## How to Use

### Skills (slash commands)
Skills are invoked with `/<skill-name>` in Claude Code:

**DevOps & Infrastructure:**
- `/terraform <plan|validate|fmt|new-module|import|migrate|debug>` — Terraform operations and code generation
- `/k8s <manifest|debug|review|status|rollback|scale|logs>` — Kubernetes operations and debugging
- `/kops <status|get|create|edit|update|upgrade|rolling-update|ig|drain|certs|etcd|addons|debug|export|delete>` — Full Kops cluster lifecycle management
- `/helm <status|diff|template|lint|debug|history|deps>` — Helm chart and release operations
- `/aws <query|debug|iam|sg|logs|costs|whoami>` — AWS operations and resource management
- `/iam <analyze|policy|role|audit|irsa>` — AWS IAM analysis and policy generation
- `/incident <investigate|mitigate|postmortem|runbook>` — Incident response workflow
- `/infra-review` — Review IaC for security, reliability, and best practices
- `/cost-review` — Infrastructure cost optimization analysis
- `/compliance <cis-aws|cis-k8s|soc2|pci|all>` — Compliance audit against security benchmarks
- `/capacity <analyze|rightsize|forecast|nodes>` — Resource utilization and capacity planning
- `/secrets <scan|audit|rotation|review>` — Secret leak detection and management audit
- `/monitor <alerts|slo|dashboards|cloudwatch|review>` — Monitoring and observability
- `/db <review|optimize|health|migration|connections>` — Database operations
- `/docker <review|scan|harden|compose>` — Container security
- `/deps <audit|outdated|licenses|upgrade-plan>` — Dependency management
- `/dns <query|debug|audit|records>` — DNS operations
- `/dr <audit|plan|runbook|test>` — Disaster recovery

**Networking & Debugging:**
- `/network-debug <source> cannot reach <target>` — Systematic network connectivity diagnosis
- `/logs <k8s|cloudwatch|file|system> <target>` — Log analysis and error pattern detection
- `/yaml <validate|fix|diff|convert|merge> <file>` — YAML validation and transformation
- `/pipeline <debug|review|create|status>` — CI/CD pipeline operations
- `/loadtest <generate|analyze|plan>` — Load and performance testing
- `/api-review <review|breaking|validate|design>` — API design review

**Planning & Migration:**
- `/migrate <k8s-upgrade|cluster|account|service|database>` — Infrastructure migration planning

**Workflow Compositions:**
- `/deploy-review` — Pre-deployment gate (infra + compliance + secrets + cost)
- `/onboard-cluster` — Map an unfamiliar K8s cluster
- `/pre-merge` — Pre-merge quality gate (code review + security + secrets)

**Scaffolding:**
- `/scaffold <terraform-module|helm-chart|github-actions|service>` — Generate project scaffolds

**General Development:**
- `/commit` — Smart commits with conventional commit messages
- `/pr-review` — Review a pull request for quality and issues
- `/deep-research` — Thorough codebase or topic research
- `/code-audit` — Security and quality audit
- `/doc-gen` — Generate documentation for code
- `/refactor` — Refactor code with safety checks

### Agents (subagents)
Agents are specialized assistants that Claude delegates to automatically:

**DevOps & Infrastructure:**
- **sre** — Incident investigation, reliability assessment, monitoring review
- **terraform-reviewer** — Terraform code review for security, cost, and best practices
- **k8s-ops** — Cluster health, pod debugging, manifest review
- **kops-manager** — Kops cluster operations, upgrades, troubleshooting, instance groups
- **helm-ops** — Helm release debugging, chart review, values diffing
- **cloud-architect** — AWS architecture design, migration planning, trade-off analysis
- **iam-analyzer** — IAM permission tracing, least-privilege policies, IRSA review
- **compliance-checker** — CIS, SOC2, PCI audits with specific remediation guidance
- **capacity-planner** — Resource right-sizing, forecasting, reserved instance planning
- **secrets-auditor** — Secret leak detection, rotation audit, management review
- **observability-ops** — Prometheus rules, Grafana dashboards, alerting, SLO design
- **db-ops** — Query optimization, schema review, RDS/DynamoDB/Redis debugging
- **container-security** — Dockerfile review, image scanning, supply chain, runtime security
- **dependency-checker** — Vulnerability scanning, upgrade planning, license compliance

**Networking & Debugging:**
- **network-debugger** — DNS, SGs, NACLs, VPC routing, K8s networking, service mesh
- **log-analyzer** — Error pattern detection, cross-service correlation, timeline analysis
- **yaml-surgeon** — YAML validation, schema awareness, structural diff, common pitfalls
- **pipeline-ops** — CI/CD debugging for GitHub Actions, ArgoCD, Jenkins, GitLab CI
- **migration-planner** — Phased migration plans with rollback strategies

**General Development:**
- **code-reviewer** — Reviews code changes for quality, security, and best practices
- **debugger** — Diagnoses test failures and runtime errors
- **architect** — Designs system architecture and evaluates trade-offs
- **researcher** — Deep dives into codebases and technical topics

## Project Structure
```
.claude/
├── settings.json          # Shared project settings
├── skills/                # 35 slash commands
│   ├── terraform/         ├── helm/          ├── iam/
│   ├── k8s/               ├── incident/      ├── compliance/
│   ├── kops/              ├── infra-review/   ├── capacity/
│   ├── aws/               ├── cost-review/    ├── secrets/
│   ├── yaml/              ├── logs/           ├── network-debug/
│   ├── pipeline/          ├── migrate/        ├── monitor/
│   ├── db/                ├── docker/         ├── deps/
│   ├── dns/               ├── loadtest/       ├── dr/
│   ├── api-review/        ├── deploy-review/  ├── onboard-cluster/
│   ├── pre-merge/         ├── scaffold/
│   ├── commit/            ├── pr-review/      ├── deep-research/
│   ├── code-audit/        ├── doc-gen/        └── refactor/
├── agents/                # 23 specialized agents
│   ├── sre/               ├── helm-ops/       ├── iam-analyzer/
│   ├── terraform-reviewer/├── compliance-checker/├── capacity-planner/
│   ├── k8s-ops/           ├── secrets-auditor/├── network-debugger/
│   ├── kops-manager/      ├── log-analyzer/   ├── yaml-surgeon/
│   ├── cloud-architect/   ├── pipeline-ops/   ├── migration-planner/
│   ├── observability-ops/ ├── db-ops/         ├── container-security/
│   ├── dependency-checker/
│   ├── code-reviewer/     ├── debugger/
│   ├── architect/         └── researcher/
├── rules/                 # 15 context-specific coding rules
│   ├── terraform.md       ├── kubernetes.md   ├── kops.md
│   ├── aws.md             ├── docker.md       ├── cicd.md
│   ├── code-style.md      ├── testing.md      ├── security.md
│   ├── git.md             ├── python.md       ├── golang.md
│   ├── typescript.md      ├── helm-charts.md  └── monitoring.md
└── hooks/                 # Lifecycle hook scripts
    ├── post-edit.sh       └── pre-commit-secrets.sh
```

## Adding New Skills

Create a directory under `.claude/skills/<name>/` with a `SKILL.md` file.
See existing skills for the frontmatter format.

## Adding New Agents

Create a directory under `.claude/agents/<name>/` with an `agent.md` file.
See existing agents for the configuration format.
