#!/bin/bash
# PreToolUse hook: blocks destructive bash commands
# Exit code 2 = block the tool call, stderr fed back to Claude

INPUT=$(cat)
if ! command -v jq &>/dev/null; then
  # Without jq we cannot parse the command — allow it through
  exit 0
fi
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

BLOCKED_PATTERNS=(
  "rm[[:space:]]+-[a-zA-Z]*r[a-zA-Z]*f[[:space:]]+/"
  "rm[[:space:]]+-[a-zA-Z]*f[a-zA-Z]*r[[:space:]]+/"
  "rm[[:space:]]+-r[[:space:]]+-f[[:space:]]+/"
  "rm[[:space:]]+-f[[:space:]]+-r[[:space:]]+/"
  "rm[[:space:]]+-[a-zA-Z]*r[a-zA-Z]*f[[:space:]]+~"
  "rm[[:space:]]+-[a-zA-Z]*r[a-zA-Z]*f[[:space:]]+\*"
  "DROP DATABASE"
  "DROP TABLE"
  "truncate"
  "format C:"
  ":(){ :|:& };:"
  "mkfs"
  "dd if="
  "> /dev/sda"
  "chmod -R 777 /"
  "git push.*--force.*main"
  "git push.*--force.*master"
  "git push.*main.*--force"
  "git push.*master.*--force"
  "git reset --hard origin"
)

for pattern in "${BLOCKED_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -Eqi "$pattern"; then
    echo "BLOCKED: Command matches destructive pattern '$pattern'. Refusing to execute." >&2
    exit 2
  fi
done

exit 0
