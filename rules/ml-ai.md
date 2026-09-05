# ML and AI

Optional inspection notes for [AgentReady](../skills/agentready/SKILL.md). Use the project's actual configuration; this file does not grant permissions or prescribe a stack.

Start with Model/provider dependencies, training code, notebooks, and evaluation records.

- Identify model versions, data sources, evaluation criteria, and experiment configuration.
- Preserve seeds and other reproducibility settings where relevant; record known nondeterminism.
- Read the rationale behind prompts, retrieval, caching, and retry behavior before changing them.
- Separate measured usage and cost from estimates. Missing usage data is not zero cost.
- Inspect scripts for provider calls and credential access. Follow the user's current approval and budget scope; use offline fixtures when live calls are not authorized.
- Check data/model storage and privacy requirements before committing artifacts.
