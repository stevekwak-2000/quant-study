#!/bin/bash
set -euo pipefail

# Only run in Claude Code cloud sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install the agent-browser CLI used by .claude/skills/agent-browser
if ! command -v agent-browser >/dev/null 2>&1; then
  npm install -g agent-browser
fi

# Chrome downloads are blocked by the proxy; use the pre-installed Chromium
if [ -n "${CLAUDE_ENV_FILE:-}" ] && [ -x /opt/pw-browsers/chromium ]; then
  echo 'export AGENT_BROWSER_EXECUTABLE_PATH=/opt/pw-browsers/chromium' >> "$CLAUDE_ENV_FILE"
fi
