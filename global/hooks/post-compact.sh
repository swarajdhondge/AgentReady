#!/bin/bash
# PostCompaction hook: re-injects critical context after auto-compaction
# Outputs to stdout which gets added to the transcript after compaction

# Re-read agent instruction file if it exists
if [ -f "CLAUDE.md" ]; then
  echo "## Re-injected after compaction: CLAUDE.md"
  cat CLAUDE.md
  echo ""
elif [ -f "AGENTS.md" ]; then
  echo "## Re-injected after compaction: AGENTS.md"
  cat AGENTS.md
  echo ""
fi

# Re-read any active plan
if [ -f "plan.md" ]; then
  echo "## Re-injected after compaction: plan.md"
  cat plan.md
  echo ""
fi

# Remind about context management
echo "## Resume: Read the project knowledge map, relevant discovery and decisions, and current progress before continuing. Confirm the recorded state against the code."

exit 0
