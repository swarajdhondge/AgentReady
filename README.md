# AgentReady

One prompt to understand a project, preserve its discoveries and decisions, and work toward a goal.

Paste this into your coding agent while your project is open:

> Read swarajdhondge/AgentReady on GitHub and set it up for this project.

For personal defaults across projects, say “Read swarajdhondge/AgentReady on GitHub and set it up globally.” To work on a feature, add “Then help me deliver [goal].” No clone or skill installation is needed.

**For the coding agent:** Read [START.md](START.md), then fetch the linked skill and relevant references from the same revision. A repository-name prompt identifies this GitHub repository; it does not require downloading a checkout.

This workflow is available on the default branch after this PR merges. To try it before merge, include “use branch feat/one-prompt-project-continuity” in your prompt.

Setup creates or updates instructions only. It does not authorize building an app or running paid services. If the agent cannot fetch a required file, it should identify that file rather than claim setup worked.

## What happens

- Discover existing code, research, experiments, decisions, plans, and progress.
- Read the sources relevant to your goal, including the evidence behind the plan.
- Ask about missing decisions; distinguish your decisions from agent assumptions.
- Work within your authorization, verify the outcome, and preserve discoveries for the next session.

Existing knowledge stays in its existing locations. Use `AGENTS.md` as the entry point for project instructions and knowledge links. If no separate knowledge record exists, keep the initial record there too. Use the project’s existing structure.

## AGENTS.md format

Project instructions use five sections: **Project, Knowledge, Working rules, Checks, Constraints**. Keep only the sections the project needs, use real source links and commands, and preserve existing content. Global instructions contain shared working preferences; each project keeps its own knowledge.

See the [project template](skills/agentready/assets/project-AGENTS.md) and [global template](skills/agentready/assets/global-AGENTS.md). Templates are filled by the agent, not copied with placeholders.

## Install as a skill (optional)

Copy the entire `skills/agentready/` directory into your coding tool's supported skill location. For a Codex project, use `.agents/skills/agentready/`. Then ask to use AgentReady; the host's skill picker/invocation syntax may vary. Installation is optional when the agent can read this repository directly.

The shared workflow is Markdown. Native skills, subagents, goals, and permissions depend on the host. The [adapter reference](skills/agentready/references/adapters.md) documents Codex integration and fallbacks; native integration with every other coding tool has not been tested.

## Boundaries

Personal model preferences and spending policies stay in personal configuration. AgentReady does not supply credentials, authorize charges, or enforce billing limits. A historical approval does not authorize a new session. Parallel work is optional and may consume more tokens.

## Repository map

- [Hosted entry point](START.md): setup without a checkout.
- [Single skill](skills/agentready/SKILL.md): current workflow and supporting references.
- [Validation](tests/README.md): offline scenarios, measured outcomes, and limitations.

## License

MIT
