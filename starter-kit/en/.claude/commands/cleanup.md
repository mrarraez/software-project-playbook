---
description: YAGNI routine - finds and proposes cleanup and compaction of code and documents
---
AUDIT mode. Do not delete, move, or edit anything before my "approved".
Delegate to the yagni-curator subagent; report in
docs/_archive/cleanup-YYYY-MM-DD.md.

Scope:
1. Code: unused exports, files, and dependencies (knip, depcheck,
   or vulture, depending on the stack); dead feature flags; TODOs older
   than 30 days.
2. Documents: drafts, duplicates, docs superseded by a newer ADR,
   unreferenced files.
3. Size: CLAUDE.md > 150 lines; DECISION-LOG.md > 300 lines;
   STATUS.md > 40 lines; HANDOFF.md > 20 lines; code files
   > 300 lines (candidates for splitting) and > 400 (mandatory review).
4. For each item: KEEP / COMPACT / ARCHIVE (docs/_archive/) /
   DELETE + 1-line reason.
5. Diaries (LOG, CHANGELOG, risks, changes, weekly status): entries
   outside the current and the previous mission go to
   docs/_archive/<name>/YYYY-MM.md (month of the entry); the file
   keeps a 1-line pointer.
6. Apply the YAGNI test to speculative code (does a requirement exist today?
   will it be used in the next 2 missions? is it expensive to add later?).
7. Run the test suite before and after applying any code removal:
   "unused" code may be called through reflection or dependency
   injection.

Return only: summary table (max. 20 lines) + report path
+ proposed diff.
