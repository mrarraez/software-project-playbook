# SPEC-0001 — Appointment confirmation by text message

**Status:** APPROVED · **Mission:** M02 · **Date:** 2026-10-05

> Filled-in example from Agenda, the fictional project in the book's Logbook.
> Use it as a model for filling in yours, and delete the `docs/examples/` folder when you start your project.

## Goal

Reduce no-shows at the three clinics: the patient receives the appointment confirmation by text message and
replies YES or NO. Affected metric: no-show rate (docs/00-product/metrics.md).

## Requirements

| ID | Requirement | Acceptance criterion (with negative case) |
|---|---|---|
| REQ-001 | Send the confirmation by text message 24 h before the appointment | Given an appointment tomorrow at 10 a.m., When the scheduler runs today at 10 a.m., Then the patient receives date, time and clinic. Given a patient with no phone on file, Then nothing is sent and the front desk sees the "no phone" alert |
| REQ-002 | Never send the confirmation by email | Given a patient with email and phone, When the confirmation goes out, Then only the text message is sent and no email appears in the send log |
| REQ-003 | A NO reply frees the slot | Given a NO reply, Then the slot returns to the schedule within 1 minute and the front desk is notified. Given a non-standard reply ("maybe"), Then the slot stays booked and the front desk sees the reply |

## Out of scope

- Reminder 2 hours before the appointment (goes into the roadmap if the no-show rate does not drop)
- Rescheduling by the patient

## Gaps (what's still unknown)

| Gap | Who decides | By when |
|---|---|---|
| Message delivery provider (becomes ADR-0003) | Lucas | Day 3 of M02 |
| Exact message text | Rita | Day 3 of M02 |

## Tasks (up to 1 day each)

- [ ] T1 — Daily scheduler that selects tomorrow's appointments (REQ-001)
- [ ] T2 — Sending through the provider, with the credential only in `.env` (REQ-001)
- [ ] T3 — Test proving that no email goes out, even with an email on file (REQ-002)
- [ ] T4 — Process the reply and free the slot on NO (REQ-003)
- [ ] T5 — "No phone" alert on the front desk screen (REQ-001)
- [ ] T6 — Tests start the server with the provider credential empty, with no real call (REQ-001)

## References

Source of REQ-001 to REQ-003: interview with Rita on 2026-09-28, with the notes checked with her before
approval (the agent's summary had inverted REQ-002; see the Logbook in Part 01).
ADR-0001 (containerization) · metric in docs/00-product/metrics.md
