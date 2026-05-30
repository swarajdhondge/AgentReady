#!/bin/bash
# Stop hook: prevents Claude from declaring "done" without running verification
# Exit code 2 = block stop, feed stderr back to Claude so it runs tests
#
# This hook checks if the project has a test/build/lint command and whether
# Claude ran it in this session. If tests exist but weren't run, it blocks.

INPUT=$(cat)
if ! command -v jq &>/dev/null; then
  # Without jq we cannot reliably parse the hook payload — allow the stop
  exit 0
fi
STOP_REASON=$(echo "$INPUT" | jq -r '.stop_reason // empty')
TRANSCRIPT=$(echo "$INPUT" | jq -r '.transcript // empty')

# Only gate on natural stops, not user interrupts
if [ "$STOP_REASON" = "user" ]; then
  exit 0
fi

# Check if project has test commands
HAS_TESTS=false
if [ -f "package.json" ]; then
  if (command -v jq &>/dev/null && jq -e '.scripts.test' package.json &>/dev/null) || grep -q '"test"' package.json 2>/dev/null; then
    HAS_TESTS=true
    TEST_CMD="npm test"
  fi
elif [ -f "pyproject.toml" ] || [ -f "setup.py" ] || [ -f "pytest.ini" ]; then
  HAS_TESTS=true
  TEST_CMD="pytest"
elif [ -f "Makefile" ] && grep -q "^test:" Makefile 2>/dev/null; then
  HAS_TESTS=true
  TEST_CMD="make test"
elif find . -name "*.csproj" -maxdepth 2 2>/dev/null | head -1 | grep -q .; then
  HAS_TESTS=true
  TEST_CMD="dotnet test"
fi

if [ "$HAS_TESTS" = false ]; then
  exit 0
fi

# Check if tests were already run in this session (look for test command in transcript)
if echo "$TRANSCRIPT" | grep -qi "test\|pytest\|vitest\|jest\|xunit\|dotnet test" 2>/dev/null; then
  exit 0
fi

echo "STOP BLOCKED: You made changes but didn't run tests. Run '$TEST_CMD' to verify your changes before finishing." >&2
exit 2
