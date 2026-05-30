# AgentReady -- Executable Playbook

You are an AI coding agent configuring a project for development. This playbook works with Claude Code, Codex, Gemini CLI, Cursor, or any agent that reads instruction files. Follow every step.

This project may already have working configuration. **Augment, not replace.** Never delete or lose existing information.

**Locating AgentReady files**: All paths (rules/, global/, commands/) are relative to this file. Determine the AgentReady root path first and use it throughout.

---

## Step 1: Read Existing State

Before changing anything, read every file that exists from this list in the target project:

```
CLAUDE.md / AGENTS.md / CODEX.md    → agent instructions
.claude/ or .cursor/ or .kiro/      → settings, agents, commands, rules
.mcp.json                           → MCP servers
MEMORY.md / memory/*.md             → memory files
CONTEXT.md                          → context
docs/**/*.md                        → architecture, deployment docs
README.md                           → project description
```

Also discover what's already available on the system (Claude Code only):
```
claude mcp list                → active MCP servers (global + project)
.claude/commands/              → slash commands
.agents/skills/                → installed skills
.claude/agents/                → available agents
```

Use what's already there before adding anything. The user's existing setup is the starting point, not a blank slate.

**CRITICAL**: Existing project knowledge (architecture decisions, conventions, deployment quirks) overrides AgentReady rules. Rules are defaults. Project context is truth.

---

## Step 2: Detect Tech Stack

Scan the project for these signals. Read files to extract real data (versions, deps, scripts):

```
package.json          → read scripts + dependencies (check for react, next, vue, tailwindcss, etc.)
pyproject.toml        → read [project.dependencies]
requirements.txt      → libraries
*.csproj / *.sln      → .NET packages
Cargo.toml            → Rust deps
go.mod                → Go deps
Dockerfile            → container patterns
docker-compose.yml    → services
*.tf                  → Terraform
charts/ / helm/       → Kubernetes
.github/workflows/    → CI/CD
next.config.*         → Next.js
vite.config.*         → Vite
alembic.ini           → SQLAlchemy migrations
prisma/               → Prisma ORM
Makefile              → build targets
```

Note: detect frameworks from package.json `dependencies` too, not just config files. Tailwind v4 has no config file -- check deps.

---

## Step 3: Load Matching Rules

Read ALL matching rule files from the `rules/` directory:

| Detected | Load |
|----------|------|
| .py, requirements.txt, pyproject.toml | `rules/python.md` |
| .ts/.tsx/.js/.jsx, package.json | `rules/typescript.md` |
| next.config.* OR react/next in package.json deps | `rules/react-nextjs.md` |
| Dockerfile, docker-compose.yml | `rules/docker.md` |
| *.tf, terraform/ | `rules/terraform.md` |
| *.csproj, *.sln, *.cs | `rules/dotnet.md` |
| ML/AI libs in deps (torch, tensorflow, llamaindex, langchain, anthropic, openai, google-adk) | `rules/ml-ai.md` |
| .github/workflows/, Jenkinsfile, cloudbuild.yaml | `rules/cicd.md` |

**Always load (every project). These are for agent behavior, NOT for the project's instruction file:**
- `rules/workflow.md` -- internalize the autonomous workflow patterns
- `rules/context.md` -- internalize session management rules

---

## Step 4: Diff

For each matched rule, go through its sections and check:

1. **Commands**: Is each command from the rule already documented? If not, note it.
2. **Conventions**: Is each convention already covered (even if worded differently)? If not, note it.
3. **Prohibitions**: Is each prohibition already listed? If not, note it.
4. **Permissions**: Are the permissions from the rule already in settings? If not, note them.

Only note items that are genuinely missing AND relevant to this project. Skip:
- Anything already covered
- Anything that contradicts existing project decisions
- Conditional rules where the condition doesn't match (e.g. "if mypy in deps" when mypy isn't in deps)

---

## Step 5: Update Agent Instructions

The project's primary instruction file must be **under 100 lines**.

### Which file to create/update:
- If CLAUDE.md exists → update it
- If AGENTS.md exists → update it
- If none exist → create AGENTS.md (universal, works across Claude Code, Codex, Copilot, Gemini CLI)

### If over 100 lines -- restructure (zero info loss):

Move details to separate files, keep lean core:
- Architecture → `docs/architecture.md`
- Detailed conventions → `docs/conventions.md`
- Deployment/infra → `docs/deployment.md`

For Claude Code: use `@docs/file.md` import syntax.
For other agents: add "See also: docs/architecture.md" references.

### If under 100 lines or new:
Add missing items from Step 4. Use ACTUAL commands from package.json/pyproject.toml/Makefile -- never template placeholders. Read the project's real directory structure for architecture section.

### Workflow section (always include):
Add this section to the instruction file so agents fire automatically every session:

```
## Workflow
- Plan before multi-file changes, execute after alignment
- After changes: spawn code-reviewer agent on the diff
- After new code: spawn test-writer if test framework exists
- Verify: run the project's test/build/lint commands before declaring done
- Suggest relevant available tools/skills when they fit the current task
```

This section makes agents automatic -- without it they sit unused. These lines are universal and apply to any tech stack. The last line ensures Claude actively uses whatever MCP servers, agents, and skills are available on the system rather than ignoring them.

workflow.md and context.md contain deeper patterns for you to internalize (subagent routing, context thresholds, parallel agents). Do NOT dump their full content into the instruction file -- only the lean workflow section above goes in.

---

## Step 6: Configure MCP (Claude Code only)

Skip this step if the agent is not Claude Code.

Check what MCP servers the user already has (globally and per-project). Only add what's missing AND needed.

**Typically global** (do NOT duplicate if already installed): github, context7, Playwright, sequential-thinking. Run `claude mcp list` to verify what's already active before adding anything.

If the project needs a server that isn't already installed (globally or per-project), add it to `.mcp.json`:

| Project needs | Add to .mcp.json |
|---------------|------------------|
| Database querying during dev | `postgres`: `npx -y @bytebase/dbhub --dsn "postgresql://..."` |

Do NOT add context7, Playwright, github, or sequential-thinking to `.mcp.json` if they're already in the user's global config. Adding them per-project creates duplicates and wastes tool budget.

If all needed servers are already installed, do NOT create .mcp.json.

---

## Step 7: Update Permissions (Claude Code only)

Skip for non-Claude Code agents.

Update `.claude/settings.json` with permissions from matched rules.

Permission format is always: `Bash(command:*)` for allow, same for deny. Merge into existing file. Never remove entries. Project decisions win conflicts.

Collect `allow` entries from each rule's "Permissions" section. Collect `deny` entries from prohibitions. Always include:
```
Allow: Read, Grep, Glob, Bash(git status), Bash(git diff:*), Bash(git log:*)
```

---

## Step 8: Suggest & Install Skills (Claude Code only)

Skip for non-Claude Code agents.

**Discover first**: List `.agents/skills/` and `.claude/commands/` to see what's already installed. Never re-install an existing skill.

**Suggest, don't force**: Present relevant skills to the user based on their project. Install only what they approve. Ask the user whether they want skills to auto-trigger when relevant or stay manual (slash command only).

| Condition | Skill | Source | What it does |
|-----------|-------|--------|-------------|
| Any project | `grill-me` | `anthropics/skills` | Quizzes you on your codebase to find knowledge gaps |
| Has docs/ or README.md | `grill-with-docs` | `anthropics/skills` | Reviews code against project documentation |
| Has react/next in deps | `webapp-testing` | `anthropics/skills` | Browser-based testing workflows |
| Has react/next in deps | `frontend-design` | `anthropics/skills` | UI/UX design assistance |
| Has next in deps | `vercel-react-best-practices` | `vercel-labs/agent-skills` | Next.js patterns and optimization |

Install command: `npx skills add <repo-url> --skill <name>`

**WARNING**: Never install an entire skill repo (`npx skills add <repo>` without `--skill`). Repos like `obra/superpowers` or `trailofbits/skills` dump 500+ irrelevant files. Always use `--skill <name>`.

---

## Step 9: Copy Agents (Claude Code only -- for portability)

These agents may already be installed globally. Copy them per-project only so other developers cloning this repo get them too.

Check `.claude/agents/` -- never overwrite existing files (they may be customized).

| Condition | Copy from AgentReady `global/agents/` |
|-----------|--------------------------------------|
| Every project | `code-reviewer.md` |
| Has Docker, cloud infra, auth, or handles user data | `security-reviewer.md` |
| Has pytest, vitest, jest, or xunit in deps | `test-writer.md` |
| Has README.md or docs/ | `docs-maintainer.md` |

---

## Step 10: Copy /go Command (Claude Code only -- for portability)

Copy `commands/go.md` to `.claude/commands/go.md` if not already present. Same logic as Step 9 -- ensures portability.

---

## Step 11: Suggest Additional MCP Servers

SUGGEST only. Tell the user what would help and how to install:

| Detected | Suggest | Install command |
|----------|---------|-----------------|
| PostgreSQL/MySQL/SQLite in deps, no DB server configured | Database MCP | `claude mcp add db -- npx -y @bytebase/dbhub --dsn "connection_string"` |
| Sentry in deps or config | Sentry MCP | `claude mcp add --transport http sentry https://mcp.sentry.dev/mcp` |
| Linear ticket references (LIN- prefixes, linear.app URLs) | Linear MCP | `claude mcp add --transport http linear https://mcp.linear.app/sse` |
| Very large codebase (500+ source files) | Serena semantic search | `claude mcp add serena -- uvx --from git+https://github.com/oraios/serena serena start-mcp-server` |
| Needs web research beyond docs | Brave Search | `claude mcp add brave -- npx -y @anthropic/mcp-server-brave-search` |

---

## Step 12: Report

```
## AgentReady Applied

### Detected: [technologies found]
### Rules loaded: [rule files read]
### Agent: [Claude Code / Codex / Gemini / Cursor]

### Created:
- [new files with line counts]

### Updated:
- [modified files + what was added]

### Restructured:
- [instruction file: X lines → Y lines + imported files]

### Skills installed:
- [list, or "N/A -- not Claude Code"]

### Agents copied:
- [list, or "N/A"]

### Already in place:
- [things that needed no changes]

### Suggestions:
- [MCP servers with install commands]
```

---

## Principles

1. **Read before write.** Understand current state first.
2. **Zero information loss.** Restructure moves content, never deletes.
3. **Instruction file under 100 lines.** Details in imported files.
4. **Merge, don't replace.** Project config wins conflicts.
5. **Real data only.** Commands from actual project files, never templates.
6. **Verify before done.** Run the project's test/build/lint commands.
7. **Manage context.** Compact at 40%, clear between tasks, subagents for exploration.
8. **Agent-agnostic.** Right files for whichever agent is running.
9. **Portable.** Per-project agents/commands ensure cloners get the setup too.
10. **Idempotent.** Running AgentReady twice produces the same result as running it once. Every step must check existing state and skip what's already done. Never duplicate files, skills, permissions, MCP servers, or instruction content.
