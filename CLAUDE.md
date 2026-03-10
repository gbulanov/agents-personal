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
- `/aws <query|debug|iam|sg|logs|costs|whoami>` — AWS operations and resource management
- `/incident <investigate|mitigate|postmortem|runbook>` — Incident response workflow
- `/infra-review` — Review IaC for security, reliability, and best practices
- `/cost-review` — Infrastructure cost optimization analysis

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
- **cloud-architect** — AWS architecture design, migration planning, trade-off analysis

**General Development:**
- **code-reviewer** — Reviews code changes for quality, security, and best practices
- **debugger** — Diagnoses test failures and runtime errors
- **architect** — Designs system architecture and evaluates trade-offs
- **researcher** — Deep dives into codebases and technical topics

## Project Structure
```
.claude/
├── settings.json          # Shared project settings
├── skills/                # Slash command definitions
│   ├── terraform/         # /terraform
│   ├── k8s/               # /k8s
│   ├── aws/               # /aws
│   ├── incident/          # /incident
│   ├── infra-review/      # /infra-review
│   ├── cost-review/       # /cost-review
│   ├── commit/            # /commit
│   ├── pr-review/         # /pr-review
│   ├── deep-research/     # /deep-research
│   ├── code-audit/        # /code-audit
│   ├── doc-gen/           # /doc-gen
│   └── refactor/          # /refactor
├── agents/                # Subagent definitions
│   ├── sre/
│   ├── terraform-reviewer/
│   ├── k8s-ops/
│   ├── cloud-architect/
│   ├── code-reviewer/
│   ├── debugger/
│   ├── architect/
│   └── researcher/
├── rules/                 # Context-specific coding rules
│   ├── terraform.md       # Terraform conventions (*.tf files)
│   ├── kubernetes.md      # K8s manifest conventions (*.yaml)
│   ├── aws.md             # AWS infrastructure conventions
│   ├── docker.md          # Dockerfile conventions
│   ├── code-style.md      # General code style
│   ├── testing.md         # Testing conventions
│   ├── security.md        # Security requirements
│   └── git.md             # Git workflow
└── hooks/                 # Lifecycle hook scripts
```

## Adding New Skills

Create a directory under `.claude/skills/<name>/` with a `SKILL.md` file.
See existing skills for the frontmatter format.

## Adding New Agents

Create a directory under `.claude/agents/<name>/` with an `agent.md` file.
See existing agents for the configuration format.
