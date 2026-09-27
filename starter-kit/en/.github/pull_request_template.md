## What changes

<1 to 3 sentences: the outcome, the mission (MNN) and the linked SPEC or ADR>

## Evidence

<real command and output that prove the acceptance criterion>

## Definition of Done (Part 08)

- [ ] Acceptance criterion demonstrated with real evidence (command and output)
- [ ] Tests for the valid case, the invalid case and the no-permission case, passing in CI
- [ ] Critical- and high-risk flows validated, with evidence
- [ ] Every fixed bug accompanied by a regression test
- [ ] Diff reviewed by code-reviewer, with no BLOCKER
- [ ] Part 06 security triggers reviewed
- [ ] No new field or endpoint without approval
- [ ] Metric instrumentation working
- [ ] Errors handled: useful 4xx, generic 500 with requestId
- [ ] Basic accessibility, if there is a screen
- [ ] Docs and ADRs updated, and no new document without a reader
- [ ] STATUS and LOG updated
- [ ] Every CI check verified on this page: a queued job or a stopped runner is not green
