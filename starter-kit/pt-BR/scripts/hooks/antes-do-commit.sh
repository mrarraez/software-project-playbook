#!/bin/sh
# Hook do Claude Code (PreToolUse): roda antes de todo git commit feito pelo agente.
# Sem o gitleaks instalado, não bloqueia nada.
command -v gitleaks >/dev/null 2>&1 || exit 0
gitleaks git --pre-commit --staged --redact >&2 || exit 2   # 2 = bloqueia o commit
