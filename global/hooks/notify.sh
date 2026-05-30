#!/bin/bash
# Notification hook: desktop alert when Claude needs input
# Works cross-platform: Windows (PowerShell toast), macOS (osascript), Linux (notify-send)

INPUT=$(cat)
MESSAGE=$(echo "$INPUT" | jq -r '.message // "Claude Code needs your attention"')

if command -v powershell.exe &>/dev/null; then
  powershell.exe -Command "[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('$MESSAGE','Claude Code')" &>/dev/null &
elif command -v osascript &>/dev/null; then
  osascript -e "display notification \"$MESSAGE\" with title \"Claude Code\"" &>/dev/null &
elif command -v notify-send &>/dev/null; then
  notify-send "Claude Code" "$MESSAGE" &>/dev/null &
fi

exit 0
