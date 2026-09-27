#!/bin/sh
# Hook de Claude Code (PreToolUse): se ejecuta antes de cada git commit que hace el agente.
# Sin gitleaks instalado, no bloquea nada.
command -v gitleaks >/dev/null 2>&1 || exit 0
gitleaks git --pre-commit --staged --redact >&2 || exit 2   # 2 = bloquea el commit
