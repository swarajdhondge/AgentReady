# AgentReady

Playbook for configuring any project with AI coding agent best practices. Works with Claude Code, Codex, Gemini CLI, Cursor, Copilot, or any agent that reads instruction files.

When asked to "use AgentReady", "set up this project", "align with AgentReady", or similar -- read `ENV.md` and execute it against the current project.

**Preservation-first**: Every project may already have working agent instructions, settings, memory, context, and conventions. That existing state is MORE important than anything here. AgentReady fills gaps and restructures bloat -- it never overwrites, removes, or contradicts what's already established.

## Quick Start

1. Read `ENV.md` -- it's the complete step-by-step playbook
2. It tells you to: scan the project → load matching rules from `rules/` → generate/update config
3. Rules are composable: a Python + Docker + CI project loads `rules/python.md` + `rules/docker.md` + `rules/cicd.md`
4. Every project also gets `rules/workflow.md` (autonomous patterns) and `rules/context.md` (session management)
