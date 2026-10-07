#!/bin/sh
# Claude Code hook (PreToolUse): runs before every git commit the agent makes.
# Fails closed: without gitleaks, the commit stops and the message says what to do.
if ! command -v gitleaks >/dev/null 2>&1; then
  echo "gitleaks not found: install it (Part 06) before committing." >&2
  exit 2
fi
gitleaks git --pre-commit --staged --redact >&2 || exit 2   # 2 = block the commit
