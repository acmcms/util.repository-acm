---
executors: keeper-acm
maintainers: magic-coordinator, magic-librarian, magic-architect
invitees: none
---
# routine-readme-gap — the actual procedure

Normative contract: `magic-team/magic-team.shared.md`'s "Armed & Routine contracts" → Routine. This file is a derived skeleton; where the two disagree, `magic-team/magic-team.shared.md` wins.

# Summary

`keeper-acm`'s idle-run routine that writes one short, grounded README for an `acm-*`-tree directory that lacks one.

## Goals

- Look for a package/directory in the `acm-*` tree (or an AE3 skin package it depends on) that has no README (or a near-empty placeholder) and would benefit from one — same "read and actually understood" standard as the file-comment-gap routine — then write a short README covering what the package/directory is and why it is distinct from its siblings (e.g. which skin lineage it belongs to, which repo boundary it sits on), not a full manual, not exhaustive API docs. One directory per day, cumulative.

## Scope

- Does:
  - Write one short, source-grounded README per pass for a genuinely-understood directory.
- Doesn't:
  - Write a full manual/API docs, backfill a `CLAUDE.md` (a separate, incidentally-filled convention — never conflated with or substituted for this task), or re-touch a directory already logged in `processed/`.

# Steps

Exact instructions. Execute in order, every step, literally as written — not less, not more. If a step cannot execute as written: escalate, or fail loud.

1. **find-readme-gap**: Look for a package/directory in the `acm-*` tree (or an AE3 skin package it depends on) that has no README (or a near-empty placeholder) and would benefit from one, using the "read and actually understood" standard — don't proceed until you can say something true and specific about the directory. Skip anything already logged in `processed/`.
2. **write-short-readme**: Write a short README covering what the package/directory is and why it is distinct from its siblings (e.g. which skin lineage it belongs to, which repo boundary it sits on) — not a full manual, not exhaustive API docs.
   - rule: this is specifically about READMEs. A missing `CLAUDE.md` next to an *existing* README is a separate, already-covered convention (filled gradually and incidentally, never a dedicated sweep) — do not conflate the two or use this task to backfill `CLAUDE.md` instead.

# Closure steps

1. **log-outcome**: Log the activity and its outcome as a new dated file under `processed/` — `processed/<board-item-type>-<date>-<short-topic>.md`. One directory per day, cumulative, never a repeat. Then run this member's own post-activity reflection (`--member-inbox-reflection-upsert`), per `keeper-acm.armed.md`.

# Routine's local procedures

Named procedure blocks. Steps above call them by name. Not separate routines — not visible outside this file.

None currently defined.

# Routine's local rules

All statements apply at the same time, always. These rules override a participant's own general `.armed.md` rules while this routine is active.

- This routine's own executor (`keeper-acm`) is permitted and obliged to execute every step exactly as written.
- Participants obey this routine's own rules over their normal `.armed.md` rules while participating.
- The README lands only at `/Volumes/workspace/myx/`, never a mirror/reference copy elsewhere, per `keeper-acm.armed.md`.
- Idle-run scheduling (weight, min-interval, scope) is not set here — it lives in `keeper-acm.armed.md`'s `## Idle-Tasks` section, which the `daily-idle-task` procedure reads.

# Routine-specific tooling

Every `magic-tooling` operation this routine uses. Full syntax and behavior here. Steps use its name only.

## DistroAgentsTools magic-tooling operations

- `--console-start [--override-workspace <path>] [--console DistroSourceConsole.sh|DistroDeployConsole.sh] [--ttl <seconds>]` (**find-readme-gap**: batch the reads)
- `--console-send <channel> [-- <command...>]` (**find-readme-gap**)
- `--member-inbox-reflection-upsert <member> <item-filename> [--from-file <path>|--edit-patch-from-stdin]` (**log-outcome**)

## `--console-start` Operation Reference

`DistroAgentsTools.fn.sh --console-start [--override-workspace <path>] [--console DistroSourceConsole.sh|DistroDeployConsole.sh] [--ttl <seconds>]` — starts (or reuses) a Keep-Alive console session. Default `--ttl`: 3600 seconds.

## `--console-send` Operation Reference

`DistroAgentsTools.fn.sh --console-send <channel> [-- <command...>]` — sends one command line into an open channel's FIFO. Command-only, not a data-transport.

## `--member-inbox-reflection-upsert` Operation Reference

`DistroAgentsTools.fn.sh --member-inbox-reflection-upsert <member> <item-filename> [--from-file <path>|--edit-patch-from-stdin]` — files a `reflection-*` item into `<member>`'s own inbox.

# Maintainer Notes

Used to check this file's own definitions against its own goals when it is updated, assessed, or tested — resolved against the whole skillset, not this file alone. **IMPORTANT**: not applied during normal work!

## Verbatim-goals (intents)

- A README is written only once something true and specific about the directory can be said; READMEs only, `CLAUDE.md` backfill never folded in.

## Verbatim-tests (benchmarks)

- No genuinely-understood directory lacking a README this pass is a valid, reportable outcome.

## Librarian Comments

### Reference

- `keeper-acm.armed.md`'s `## Idle-Tasks` section — the scheduling policy governing when this routine fires.
- `keeper-acm.file-comment-gap.routine` — the sibling routine whose "read and actually understood" standard this one reuses.
- Migrated to routine form in the 2026-09 idle-task-to-routine refactor.

### Conventions

- None currently known beyond this file's own Local rules.
