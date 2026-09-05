# Python

Optional inspection notes for [AgentReady](../skills/agentready/SKILL.md). Use the project's actual configuration; this file does not grant permissions or prescribe a stack.

Start with `pyproject.toml`, dependency files, and Python source.

- Read the supported Python version, dependency groups, test configuration, and formatter settings.
- Copy commands from the project. Do not assume it uses pytest, Ruff, mypy, or a particular package manager.
- Follow its existing validation, logging, database, and sync/async patterns. Record why they were chosen when that evidence exists.
- Inspect migration and integration-test commands before running them; they may connect to a database.
- Keep credentials out of source and use parameterized database queries.
