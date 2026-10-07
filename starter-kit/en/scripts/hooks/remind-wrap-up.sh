#!/bin/sh
# Claude Code hook (UserPromptSubmit): when the message sounds like a goodbye,
# reminds Claude to suggest /wrap-up. It only reminds, never blocks.
input=$(cat)
if printf '%s' "$input" | grep -qiE '"prompt": *"[^"]*(bye|goodbye|good night|see you tomorrow|that.s all for today|wrapping up)'; then
  echo "Hook reminder: the user seems to be saying goodbye. Before answering, suggest running /wrap-up to save STATUS, LOG and HANDOFF."
fi
exit 0
