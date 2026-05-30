#!/bin/bash
# PostCompaction hook: re-injects critical context after auto-compaction
# Outputs to stdout which gets added to the transcript after compaction

# Re-read CLAUDE.md if it exists
if [ -f "CLAUDE.md" ]; then
  echo "## Re-injected after compaction: CLAUDE.md"
  cat CLAUDE.md
  echo ""
fi

# Re-read any active plan
if [ -f "plan.md" ]; then
  echo "## Re-injected after compaction: plan.md"
  cat plan.md
  echo ""
fi

# Remind about context management
echo "## Context reminder: You just went through compaction. Use /compact <focus> proactively before hitting 40% context. Use subagents for exploration to keep main context clean."

exit 0
