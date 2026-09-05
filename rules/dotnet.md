# .NET

Optional inspection notes for [AgentReady](../skills/agentready/SKILL.md). Use the project's actual configuration; this file does not grant permissions or prescribe a stack.

Start with Solution and project files, `global.json`, NuGet configuration, and tests.

- Identify target frameworks, project references, build commands, and test projects.
- Follow the existing UI, dependency-injection, data-access, and disposal patterns.
- For desktop work, inspect thread-affinity and UI responsiveness around the changed code.
- Read build and run targets before invoking them; they may restore dependencies or contact services.
- Keep private connection strings and user secrets out of source control.
