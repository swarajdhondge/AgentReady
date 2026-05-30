# Example: AgentReady on a fullstack SaaS project

## Project: FastAPI + Next.js + PostgreSQL + Redis + Docker + GitHub Actions

### Step 1: Read existing state
- CLAUDE.md exists (180 lines) -- has architecture, conventions, phase tracking
- .claude/settings.json exists -- has some permissions
- No .mcp.json, no agents, no /go command

### Step 2: Detect
Python (FastAPI, SQLAlchemy, Pydantic, Alembic, Redis), TypeScript (Next.js, React, Tailwind, Zustand), Docker (compose with postgres + redis services), GitHub Actions (test + deploy workflows)

### Step 3: Rules loaded
python.md, typescript.md, react-nextjs.md, docker.md, cicd.md, workflow.md, context.md

### Step 4: Diff
- CLAUDE.md is 180 lines -- needs restructuring (over 100 line limit)
- Missing: code-reviewer agent, security-reviewer agent, /go command
- Missing: webapp-testing skill (install individually with `--skill` flag)
- Existing permissions cover most things, missing alembic + docker compose
- Architecture section (60 lines) should move to docs/architecture.md
- Deployment section (40 lines) should move to docs/deployment.md

### Step 5: Restructure CLAUDE.md (180 → 80 lines + 2 imported files)

Created `docs/architecture.md` (60 lines moved from CLAUDE.md)
Created `docs/deployment.md` (40 lines moved from CLAUDE.md)
CLAUDE.md rewritten as 80-line core with @imports. All 180 original lines preserved across 3 files.
Added Workflow section (agents fire automatically -- code-reviewer after changes, test-writer for new code, context7 for docs, Playwright for UI).

### Step 6-7: .mcp.json + settings.json
No .mcp.json needed (global servers cover it)
Merged alembic + docker compose permissions into existing settings.json

### Step 8-10: Skills, agents, commands
Installed: webapp-testing (via `--skill webapp-testing`), frontend-design (via `--skill frontend-design`)
Skipped: superpowers, trailofbits/skills (blanket install dumps 500+ irrelevant files)
Copied: code-reviewer.md, security-reviewer.md, test-writer.md
Copied: /go command

### Report
```
## AgentReady Applied

### Detected: Python (FastAPI), TypeScript (Next.js), Docker, GitHub Actions
### Rules loaded: python, typescript, react-nextjs, docker, cicd, workflow, context

### Created: docs/architecture.md, docs/deployment.md, .claude/agents/code-reviewer.md,
  .claude/agents/security-reviewer.md, .claude/agents/test-writer.md, .claude/commands/go.md

### Restructured: CLAUDE.md 180 lines → 80 lines + 2 @imported files (zero info loss)

### Updated: .claude/settings.json (added alembic + docker compose permissions)

### Skills installed: webapp-testing, frontend-design (individually via --skill flag)

### Already in place: CLAUDE.md conventions, tech stack docs, test commands, git workflow

### Suggestions: Consider Sentry MCP if using error monitoring in production
```
