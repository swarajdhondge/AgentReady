# AgentReady

One prompt to understand a project, preserve its discoveries and decisions, and work toward a goal.

> Use https://github.com/swarajdhondge/AgentReady to understand this project and help me deliver [goal].

For setup only, say “Use AgentReady to set up this project.” Setup does not authorize implementing an app or running paid services.

Your agent reads [SKILL.md](skills/agentready/SKILL.md), follows its relevant references, and works in your target project. If the agent cannot fetch the repository, provide a local checkout. No API key, server, or external dependency is required by AgentReady itself; the coding tool's normal usage terms still apply.

## What happens

- Discover existing code, research, experiments, decisions, plans, and progress.
- Read the sources relevant to your goal, including the evidence behind the plan.
- Ask about missing decisions; distinguish your decisions from agent assumptions.
- Work within your authorization, verify the outcome, and preserve discoveries for the next session.

Existing knowledge stays in its existing locations. If no suitable record exists, the agent can create one small `AGENTREADY.md`. Use the project’s existing structure.

## Install as a skill (optional)

Copy the entire `skills/agentready/` directory into your coding tool's supported skill location. For a Codex project, use `.agents/skills/agentready/`. Then ask to use AgentReady; the host's skill picker/invocation syntax may vary. Installation is optional when the agent can read this repository directly.

The shared workflow is Markdown. Native skills, subagents, goals, and permissions depend on the host. The [adapter reference](skills/agentready/references/adapters.md) documents Codex integration and fallbacks; native integration with every other coding tool has not been tested.

## Boundaries

Personal model preferences and spending policies stay in personal configuration. AgentReady does not supply credentials, authorize charges, or enforce billing limits. A historical approval does not authorize a new session. Parallel work is optional and may consume more tokens.

## Repository map

- [Single skill](skills/agentready/SKILL.md): current workflow and supporting references.
- [ENV.md](ENV.md): compatibility entry point for existing one-prompt users.
- [Validation](tests/README.md): offline scenarios, measured outcomes, and limitations.
- `examples/`: short usage scenarios, separate from executed tests.
- `rules/`: optional notes on what to inspect for each stack.
- `global/`: legacy Claude agent and hook templates; not installed automatically.

## License

MIT
