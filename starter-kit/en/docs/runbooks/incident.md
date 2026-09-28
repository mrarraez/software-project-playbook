# Runbook — Security incident (leaked secret)

Source: Software Project Playbook, Part 06, "When the secret leaks".
The order is not a suggestion. Especially step 1 before step 4.

1. **Revoke and rotate.** Generate the new key and invalidate the old one. Deleting the file or the commit does not undo the leak.
2. **Contain.** Block access, pause integrations, go into maintenance mode if needed.
3. **Assess the reach.** Key usage logs, data accessed, exposure window.
4. **Clean the history, if needed.** `git filter-repo`, and only after rotating.
5. **Communicate.** Sponsor. If personal data was affected, follow the deadline of the applicable law. GDPR: the supervisory authority within 72 hours, unless the breach is unlikely to result in a risk, and the data subjects without undue delay when the risk is high. California (Civil Code 1798.82): affected residents within 30 calendar days of discovery and, if more than 500 were affected, the Attorney General within 15 days of that notice. Brazil (LGPD): the ANPD and the data subjects within 3 business days when there is relevant risk or harm.
6. **Blameless post-mortem.** Timeline, root cause, preventive action that becomes a rule, test or ADR.
