# Minimal AI use policy — <PROJECT NAME>
**Version:** 1 · **Date:** YYYY-MM-DD · **Owner:** <name>
**Review:** on every change of plan, tool or model; at least every 6 months
Aligned with the principles of the organization's AI policy, if any: <link>.
Not legal advice and not a guarantee of legal compliance.

## 1. Tool and plan
Tool: Claude Code · Plan: <Pro/Max | Team/Enterprise | API>
Authorized accounts: <who>
The plan sets the training and retention rules
(official documentation, "Data usage" page).

## 2. What may and may not go to the model
| May | May not |
|---|---|
| Code and docs from this repository | Secrets: `.env`, keys, tokens |
| Synthetic or anonymized data | Real personal data without a recorded legal basis (data protection law) |
| Logs without personal data | Third-party confidential material without written authorization |

Everything the agent reads goes to the model: opened file,
command output, fetched page.

## 3. Privacy and retention (checked on YYYY-MM-DD)
- Training on your data: <off at claude.ai/settings/data-privacy-controls |
  commercial plan: no training unless you join a partner program>
- Provider retention: <30 days | 5 years if training is on |
  zero data retention (eligible Enterprise)>
- Local copy: transcripts in `~/.claude/projects/` for 30 days;
  `cleanupPeriodDays` in settings.json: <value>
- `/feedback`, `/bug` and `/share` send the conversation, code included,
  kept for 5 years: <allowed | DISABLE_FEEDBACK_COMMAND=1>
- Telemetry: <default | DISABLE_TELEMETRY=1 |
  CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1>

## 4. Human accountability
Whoever approves the merge answers for the code, written by a person or by an agent.
Nothing generated gets in without DoD, real evidence and diff review.
The agent does not approve its own work.

## 5. Intellectual property and licenses
- Who owns the output: <excerpt from the plan's terms + link>.
  Copyright protection for AI-generated code varies
  by country: questions go to legal.
- Generated code goes through the license audit together with
  the dependencies (L11). A long passage that resembles a known
  project: rewrite or attribute.
- Third-party skills, agents and MCPs: only with a declared license
  and the anti-chaos checklist.

## 6. Model and version
Aliases (`haiku`, `sonnet`, `opus`, `fable`) move to the new version on their own.
- Main session: `"model": "<full id>"` in settings.json
- Agent aliases, in the `env` of settings.json:
  ANTHROPIC_DEFAULT_SONNET_MODEL=<id> · ANTHROPIC_DEFAULT_OPUS_MODEL=<id>
  · ANTHROPIC_DEFAULT_HAIKU_MODEL=<id> · ANTHROPIC_DEFAULT_FABLE_MODEL=<id>
Changing model, version or plan is a controlled change: short ADR,
test mission with the suite and the risk matrix running, entry in the LOG.

## 7. Incident involving an agent
Examples: deleted or changed data unasked; ran a command outside its
limits; obeyed a hidden instruction (R04); sent a secret to the model.
1. Stop the session and revoke what the agent could reach (key, token, access)
2. Preserve the evidence: transcript, diff, commands run
3. Assess the scope and restore using the backup runbook
4. Communicate: project owner. With personal data, follow the deadline
   of the applicable law (e.g., GDPR: supervisory authority within 72 h)
5. Blameless post-mortem: the cause becomes a rule in CLAUDE.md,
   a deny rule in settings.json, a test or an ADR
