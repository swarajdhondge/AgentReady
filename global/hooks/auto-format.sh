#!/bin/bash
# PostToolUse hook: auto-formats files after Edit/Write
# Only runs formatters that exist in the project

INPUT=$(cat)
if ! command -v jq &>/dev/null; then
  # Without jq we cannot parse the file path — skip formatting
  exit 0
fi
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_result.filePath // empty')

if [ -z "$FILE_PATH" ] || [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

EXT="${FILE_PATH##*.}"

case "$EXT" in
  ts|tsx|js|jsx|json|css|scss|html|md|yaml|yml)
    if command -v npx &>/dev/null && [ -f "$(git rev-parse --show-toplevel 2>/dev/null)/.prettierrc" ] 2>/dev/null; then
      npx prettier --write "$FILE_PATH" 2>/dev/null
    elif command -v npx &>/dev/null && [ -f "$(git rev-parse --show-toplevel 2>/dev/null)/node_modules/.bin/prettier" ] 2>/dev/null; then
      npx prettier --write "$FILE_PATH" 2>/dev/null
    fi
    ;;
  py)
    if command -v ruff &>/dev/null; then
      ruff format "$FILE_PATH" 2>/dev/null
      ruff check --fix "$FILE_PATH" 2>/dev/null
    fi
    ;;
  cs)
    if command -v dotnet &>/dev/null; then
      dotnet format --include "$FILE_PATH" 2>/dev/null
    fi
    ;;
esac

exit 0
