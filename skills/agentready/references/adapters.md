# Tool integration

Use the host's supported mechanisms; a shared Markdown workflow does not imply identical feature support. Detect installed capabilities and existing project configuration before changing anything. Do not assume a server, hook, skill, or agent is already active.

## Codex

Use AGENTS.md for concise project instructions and links to existing knowledge. Skills use a folder containing SKILL.md, with supporting references loaded when relevant; this entire `agentready` directory is the portable unit. Repository skills can live in `.agents/skills/agentready/`. Use the host's supported personal skill location for personal installation.

Native subagent definitions use TOML in `.codex/agents/` (project) or `~/.codex/agents/` (personal). Create roles only when needed; do not copy Claude Markdown agent definitions into these locations. Preserve user-selected models and explicit role preferences.

Use native goals when available and explicitly requested. Memories can help recall, but important project knowledge and requirements belong in checked-in documentation/instructions. Global AGENTS.md is not an unoverrideable policy: closer project instructions can take precedence. Instruction text alone is not a credential or billing enforcement boundary.

Sources (checked 2026-09-05):
- [Instructions](https://learn.chatgpt.com/docs/agent-configuration/agents-md)
- [Skills](https://learn.chatgpt.com/docs/build-skills)
- [Subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents)
- [Goals](https://learn.chatgpt.com/use-cases/follow-goals)
- [Memories](https://learn.chatgpt.com/docs/customization/memories)

The [ExecPlans cookbook](https://developers.openai.com/cookbook/articles/codex_exec_plans) is archived. Its living-plan pattern is optional inspiration, not a required current configuration.

## Other coding tools

The same entry point can be read as Markdown. Before generating tool-specific settings, consult that tool's current official documentation and detect its supported skills, instruction files, permissions, and delegation features. Do not promise identical native integration across Codex, Claude Code, Gemini CLI, Cursor, or Copilot without testing it.

Without native skills, read SKILL.md and resolve its relative references from the AgentReady source location. Without native subagents, execute sequentially. Without persistent goals, leave a durable checkpoint. Do not simulate unsupported capabilities with hidden API calls or automatically installed services.

## Migration and personal policy

Existing instructions, knowledge, and configuration are the starting point. Identify conflicts rather than silently overriding them. Preview consequential migrations; never infer permission to weaken restrictions from a setup request. Do not restructure files to satisfy arbitrary line limits.

Legacy `rules/`, `global/agents/`, and `global/hooks/` in the AgentReady repository are optional historical resources, not auto-installed dependencies of this skill. Inspect any selected resource against current tool documentation and project needs before use. Personal model routing and spending preferences belong in personal configuration, not universal public defaults. On another machine, install the skill/personal configuration separately; project records travel with the repository, credentials do not.
