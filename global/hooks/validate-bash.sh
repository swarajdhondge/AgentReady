#!/bin/bash
# PreToolUse hook: blocks destructive bash commands
# Exit code 2 = block the tool call, stderr fed back to Claude

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

BLOCKED_PATTERNS=(
  "rm -rf /"
  "rm -rf ~"
  "rm -rf \*"
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
  "git reset --hard origin"
)

for pattern in "${BLOCKED_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qi "$pattern"; then
    echo "BLOCKED: Command matches destructive pattern '$pattern'. Refusing to execute." >&2
    exit 2
  fi
done

exit 0
