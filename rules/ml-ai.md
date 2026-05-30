# ML / AI Agent Rules

## Signals
`torch` or `tensorflow` in deps, `transformers`, `llamaindex`, `langchain`, `chromadb`,
`google-adk`, `litellm`, `instructor`, `openai`, `anthropic` in deps,
`train.py`, `inference.py`, `models/` with model definitions, `notebooks/` directory

## CLAUDE.md sections to include

### Conventions
- Reproducibility: seed everything (random, numpy, torch), log all hyperparameters
- Config-driven experiments (YAML/JSON files), not hardcoded values
- Structured logging for metrics, not print statements
- pathlib for file paths
- Type hints on all functions
- Separate data loading, model definition, training loop, evaluation

### Conventions (LLM/Agent projects)
- Use environment variables for API keys, never hardcode
- Structured output with Pydantic models (if using instructor/litellm)
- Retry logic with exponential backoff for API calls
- Token counting and cost tracking
- Cache LLM responses during development to save costs

### Conventions (RAG)
- Chunk size and overlap as configurable parameters
- Embedding model versioned and documented
- Vector DB indexes documented with dimensionality
- Evaluation: precision, recall, and relevance scoring

### Prohibitions
- NEVER commit model weights or large datasets to git (use .gitignore)
- NEVER hardcode API keys for LLM/cloud providers
- NEVER train without setting random seeds
- NEVER skip evaluation before deploying a model change

## Permissions
```
Bash(pytest:*), Bash(ruff:*), Bash(python:*), Bash(pip:*)
```

## If Anthropic SDK detected
Suggest using built-in `/claude-api` skill for building and debugging.
