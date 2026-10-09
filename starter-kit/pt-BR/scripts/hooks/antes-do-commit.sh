#!/bin/sh
# Hook do Claude Code (PreToolUse): roda antes de todo git commit feito pelo agente.
# Fail closed: sem o gitleaks, o commit para e a mensagem diz o que fazer.
if ! command -v gitleaks >/dev/null 2>&1; then
  echo "gitleaks não encontrado: instale-o (https://github.com/gitleaks/gitleaks) antes de commitar." >&2
  exit 2
fi
gitleaks git --pre-commit --staged --redact >&2 || exit 2   # 2 = bloqueia o commit
