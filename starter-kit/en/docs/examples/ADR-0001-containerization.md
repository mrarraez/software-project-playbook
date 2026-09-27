# ADR-0001 — Containerization strategy

Status: APPROVED · Date: 2026-09-30 · Decision maker: Lucas (technical owner), with Rita informed

> Filled-in example from Agenda, the fictional project in the book's Logbook.
> Delete the `docs/examples/` folder when you start your project.

## Context

Deploy target: a VPS · People/machines: 1 dev, 1 machine (Windows)
Services: API, messaging worker (scheduler) and database · Native dependencies: none

## Options

A — Nothing in containers (everything native)
B — Dependencies in containers, native app   ← acceptable minimum
C — Everything in containers (app + dependencies) right away

## Criteria

Part 05 matrix: 3 of 7 point to YES (deploy target on a VPS; three services; dev/prod parity,
because a clinic's schedule cannot fail on the day the front desk depends on it)

## Decision

C. With three YES, the application goes into a container now. The messaging worker gets the same image as
the API, with a different command. Verification tools (security scanner, lint) stay in their own image and
never go into the application image.

## Review trigger

Revisit if the deploy target changes to a platform that does the packaging itself.

## Consequences

Ports: app 3100 / db 55433, bound to 127.0.0.1 only · Runtime: Docker Desktop · Pinned image versions
