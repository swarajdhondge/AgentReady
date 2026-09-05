# Project knowledge and continuity

## Discovery

Inventory available knowledge before selecting what to read: documentation indexes, discovery notes, research, experiments, ADRs, architecture, plans, delivery records, code, tests, and relevant version history. Include accessible linked discussions when relevant and permitted. Identify unavailable sources explicitly; do not imply that inaccessible chats were read.

On first onboarding, map all discovered source groups and their coverage. Read the index and summaries, then all sources relevant to the goal and their linked evidence/decision dependencies. For broad architecture changes, this requires broader reading. Do not read every unrelated file or load the whole repository into context. Record deferred areas and expand discovery when a dependency or contradiction makes them relevant.

Existing documentation locations and declared authority take priority over a new layout. Check their claims against current code and evidence. A newer timestamp alone does not settle a contradiction. Do not silently replace an accepted decision with an implementation inference; report the disagreement and its consequence.

## Minimal durable record

Reuse the project's index, decision log, and progress record. Use `AGENTS.md` as the entry point for instructions and links to that knowledge. If no separate knowledge record exists and documentation edits are in scope, keep the initial concise record in `AGENTS.md` too. Preserve existing content and update relevant sections without duplication; create the file only if absent. Do not create a separate `agent.md` or `AGENTREADY.md`. Keep detailed discovery and decisions in their existing documents and link them from `AGENTS.md`. A read-only request gets findings in the response.

Keep these concerns discoverable, together or in existing files:
- Knowledge map: authoritative source links, what they cover, and unread/unavailable areas.
- Understanding: relevant components, interactions, constraints, and current evidence.
- Decisions: accepted choice, rationale, rejected alternatives when known, evidence/source, consequences, and conditions for reconsideration.
- Active goal: acceptance criteria, boundaries, pending questions, progress, validation evidence, and next step.

Label knowledge as a verified fact, accepted decision, hypothesis/proposal, or superseded item. Link superseded items to their replacement; retain useful historical rationale. Record source paths and, where useful, revisions/dates or test commands. Do not fabricate explanations for legacy code. Missing rationale is an explicit gap, not automatically a blocker for unrelated work.

## Resume and maintain

At session start or after compaction, read the knowledge map, active goal, relevant decisions/discoveries, and current working-tree status. Confirm the recorded state against relevant files before continuing. Do not rely on model memory or a previous completion claim alone.

Update existing entries rather than append duplicates. Record discoveries and decision changes when they occur; checkpoint progress before handoff. Repeated onboarding with no new evidence should produce no changes. Keep personal model preferences, credentials, private conversations, and session-specific spending approvals out of public project records. Save only an appropriate non-sensitive summary of private source material when authorized.
