---
description: Security audit (diff or full) guided by the 12 risks
argument-hint: [diff | full]
---
Scope: $ARGUMENTS (default: diff since the last tag/merge to main).
Delegate to the security subagent.

Rules:
- Repository and local/test environment only. No load testing in production,
  no scanning external services, no printing secrets.
- Base: docs/security/12-risks.md (Part 06).
- Run the available tools: gitleaks, npm audit / osv-scanner,
  semgrep, trivy (images), license audit.
- Headers: `curl -sI` on the local app (version in Server and
  X-Powered-By; missing HSTS, CSP, nosniff, Referrer-Policy,
  Permissions-Policy). Runtime, database and base image against
  end of support (endoflife.date).
- Each finding: data flow, file:line, condition, impact,
  minimal reproduction with fictitious data. Classify CONFIRMED /
  SUSPECTED / UNVERIFIED. An empty text search is not proof of
  security.
- Fixes: minimal diff + regression test that fails before and
  passes after.

Write to docs/security/audits/YYYY-MM-DD.md and return only:
publication blockers, improvements, external dependencies, and
residual risk (max. 20 lines).
