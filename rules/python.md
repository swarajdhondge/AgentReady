# Python Rules

## Signals
`requirements.txt`, `pyproject.toml`, `setup.py`, `*.py` files, `Pipfile`

## CLAUDE.md sections to include

### Commands
```bash
pip install -e ".[dev]"        # or: pip install -r requirements.txt
pytest -x --tb=short           # stop on first failure
ruff check . && ruff format .  # lint + format
mypy .                         # only if mypy is in project dependencies
```

### Conventions
- Type hints on all function signatures
- snake_case for functions/variables, PascalCase for classes
- Pydantic models for data validation (only if pydantic is in project dependencies)
- Use `logging` module, never `print` for production code
- Async/await for all I/O operations (only if FastAPI, aiohttp, or other async framework is in dependencies)
- `pathlib.Path` for file paths, not string concatenation

### Prohibitions
- NEVER hardcode secrets -- use environment variables
- NEVER use string interpolation for SQL -- use parameterized queries
- NEVER commit .env files

## Permissions to allow
```
Bash(pytest:*), Bash(python -m pytest:*), Bash(ruff:*), Bash(mypy:*), Bash(pip:*)
```

## Formatting hook
Ruff: `ruff format "$FILE_PATH" && ruff check --fix "$FILE_PATH"`

## If FastAPI is in project dependencies
- Add: `Bash(uvicorn:*)` to permissions
- Convention: dependency injection via `Depends()`, HTTPException for errors
- Convention: Pydantic v2 models for all request/response schemas
- Convention: async routes by default

## If Django is in project dependencies
- Add: `Bash(python manage.py:*)` to permissions
- Convention: fat models, thin views
- Convention: use Django ORM, not raw SQL

## If SQLAlchemy is in project dependencies
- Convention: async sessions with context managers
- Convention: Alembic for migrations, never manual schema changes
- Add: `Bash(alembic:*)` to permissions (but deny `alembic downgrade`)
