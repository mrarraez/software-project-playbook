#!/bin/sh
# Claude Code hook (PreToolUse): runs before every git commit the agent makes.
# Without gitleaks installed, it blocks nothing.
command -v gitleaks >/dev/null 2>&1 || exit 0
gitleaks git --pre-commit --staged --redact >&2 || exit 2   # 2 = block the commit
