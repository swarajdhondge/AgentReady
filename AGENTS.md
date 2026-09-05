# AgentReady

AgentReady provides one skill for project understanding, setup, and goal-directed development.

When asked to use AgentReady on a project, read [skills/agentready/SKILL.md](skills/agentready/SKILL.md). Work in the user's target project. When developing AgentReady itself, preserve its one-prompt interface and test meaningful behavior with isolated offline scenarios described in [tests/README.md](tests/README.md).

Keep the skill self-contained. Preserve existing project knowledge and user authorization; expose contradictions rather than silently overwrite decisions. Do not assume agents, hooks, or MCP servers are installed.

Validate changed Markdown links and skill frontmatter, and run the relevant behavioral scenarios for workflow changes. Do not require API keys, paid calls, or new dependencies for local fixture checks.
