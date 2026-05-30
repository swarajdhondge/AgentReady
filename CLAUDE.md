# AgentReady

Playbook for configuring any project with AI coding agent best practices. Works with Claude Code, Codex, Gemini CLI, Cursor, or any agent that reads instruction files.

When asked to "use AgentReady", "set up this project", "align with AgentReady", or similar -- read `ENV.md` and execute it against the current project.

**Preservation-first**: Every project may already have working agent instructions, settings, memory, context, and conventions. That existing state is MORE important than anything here. AgentReady fills gaps and restructures bloat -- it never overwrites, removes, or contradicts what's already established.

## Files

- `ENV.md` -- The playbook. Read and execute.
- `rules/` -- Per-tech rules (composable) + workflow + context management rules.
- `global/agents/` -- Agent definitions to copy into projects.
- `global/hooks/` -- Hook scripts (wired in global settings.json for Claude Code).
- `commands/go.md` -- /go slash command to copy into projects.

## Already Global (Claude Code, always active)

- MCP: github, context7, Playwright, sequential-thinking
- Hooks: validate-bash (PreToolUse), auto-format (PostToolUse), notify (Notification), stop-verify (Stop), post-compact (PostCompact)
- Agents: code-reviewer, security-reviewer, test-writer, docs-maintainer
- Command: /go
