#!/bin/bash
# Cloud sessions start from a fresh container: install the CLIs that the
# agent-browser and graphify skills call, and point agent-browser at the
# preinstalled Chromium.
[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] || exit 0

command -v agent-browser >/dev/null 2>&1 || npm install -g agent-browser >/dev/null 2>&1
command -v graphify >/dev/null 2>&1 || uv tool install graphifyy >/dev/null 2>&1

chrome=$(ls -d /opt/pw-browsers/chromium-*/chrome-linux/chrome 2>/dev/null | sort -V | tail -1)
if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  [ -n "$chrome" ] && echo "export AGENT_BROWSER_EXECUTABLE_PATH=\"$chrome\"" >> "$CLAUDE_ENV_FILE"
  echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> "$CLAUDE_ENV_FILE"
fi
exit 0
