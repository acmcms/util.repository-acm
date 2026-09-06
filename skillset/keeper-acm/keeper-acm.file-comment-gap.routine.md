---
executors: keeper-acm
maintainers: magic-coordinator, magic-librarian, magic-architect
invitees: none
---
# keeper-acm.file-comment-gap.routine — the actual procedure

# Summary

`keeper-acm`'s idle-run routine that adds one grounded comment/header to an understood `acm-*` legacy file that lacks one.

## Goals

- Pick one file in the `acm-*` legacy tree (a Java class, or a `.tpl` template) that has been read and actually understood but lacks a good comment/header, and add a short comment explaining *why this file is distinct from all the others* — its specific reason for existing, the non-obvious thing about it (e.g. which skin lineage it belongs to, why it diverges from its prototype) — not how it works line-by-line and not a restatement of its interface. One file per day, cumulative.

## Scope

- Does:
  - Add one grounded distinctness comment per pass to a genuinely-understood file.
- Doesn't:
  - Comment how the file works line-by-line, restate its interface, or re-touch a file already logged in `processed/`.
  - Modernize the file — legacy-maintenance territory, explicit-request-only (per `keeper-acm.armed.md`).

# Steps

Exact instructions. Execute in order, every step, literally as written — not less, not more. If a step cannot execute as written: escalate, or fail loud.

1. **pick-understood-file**: Pick one file in the `acm-*` legacy tree (a Java class, or a `.tpl` template) that has been read and actually understood but lacks a good comment/header, and is not already logged in `processed/`.
2. **add-distinctness-comment**: Add a short comment explaining *why this file is distinct from all the others* — its specific reason for existing, the non-obvious thing about it (e.g. which skin lineage it belongs to, why it diverges from its prototype) — not how it works line-by-line, not a restatement of its interface.

# Closure steps

1. **log-outcome**: Log the activity and its outcome as a new dated file under `processed/` — `processed/<board-item-type>-<date>-<short-topic>.md`. Then run this member's own post-activity reflection (`--member-inbox-reflection-upsert`), per `keeper-acm.armed.md`.

# Routine's local procedures

Named procedure blocks. Steps above call them by name. Not separate routines — not visible outside this file.

None currently defined.

# Routine's local rules

All statements apply at the same time, always. These rules override a participant's own general `.armed.md` rules while this routine is active.

- This routine's own executor (`keeper-acm`) is permitted and obliged to execute every step exactly as written.
- Participants obey this routine's own rules over their normal `.armed.md` rules while participating.
- The comment lands only at `/Volumes/workspace/myx/`, never a mirror/reference copy elsewhere, per `keeper-acm.armed.md`.
- Idle-run scheduling (weight, min-interval, scope) is not set here — it lives in `keeper-acm.armed.md`'s `## Idle-Tasks` section, which the `daily-idle-task` procedure reads.

# Routine-specific tooling

Every `magic-tooling` operation this routine uses. Full syntax and behavior here. Steps use its name only.

## DistroAgentsTools magic-tooling operations

- `--console-start [--override-workspace <path>] [--console DistroSourceConsole.sh|DistroDeployConsole.sh] [--ttl <seconds>]` (**pick-understood-file**: batch the reads)
- `--console-send <channel> [-- <command...>]` (**pick-understood-file**)
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

- The comment explains the file's reason for existing (its skin-lineage distinctness), never line-by-line mechanics; one file per pass, never a repeat.

## Verbatim-tests (benchmarks)

- No understood, un-commented file found this pass is a valid, reportable outcome.

## Librarian Comments

### Reference

- `keeper-acm.armed.md`'s `## Idle-Tasks` section — the scheduling policy governing when this routine fires.

### Conventions

- None currently known beyond this file's own Local rules.
