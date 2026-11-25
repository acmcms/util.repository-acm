---
type: routine
executors: keeper-acm
maintainers: magic-coordinator, magic-librarian, magic-architect
invitees: none
requires-session-kind: standalone
input-scan-def: none
review-by: inherit
---
# keeper-acm.skill-reference-gap.routine — the actual procedure

## Contents

- Summary
  - Goals
  - Scope
- Opening steps
- Steps
- Closure steps
- Routine's local procedures
- Routine's local rules
- Routine-specific tooling
  - Tooling operations
  - `--console-start` Operation Reference
  - `--console-send` Operation Reference
  - `--upsert-inbox-reflection` Operation Reference
- Maintainer Notes
  - Verbatim-goals (intents)
  - Verbatim-tests (benchmarks)
  - Librarian Comments
    - Reference
    - Conventions

# Summary

`keeper-acm`'s idle-run routine that adds one confirmed template-language / `skin.settings.xml` / skin-lineage entry to this skill's own reference sections.

## Goals

- While reading, when a template-language construct, a `skin.settings.xml` field, or a skin lineage is hit that is not yet captured in this skill's own reference sections (the template-language tag list, the `skin.settings.xml` field list, or "Known skin lineages"), add a short, grounded entry for it there instead of just leaving a note. The `ACM.ECMA` renderer and its `<%CODE: 'ACM.ECMA' %>` tag (in `acm-com.vlapan/vlapan-richedit/skin.settings.xml`) is an example of exactly this gap shape.

## Scope

- Does:
  - Add one source-confirmed reference entry per pass to the appropriate reference section.
- Doesn't:
  - Guess the general shape from a single example — only what has actually been confirmed in the source, said so briefly.

# Opening steps

None of its own: the Opening steps of the routine it inherits from run first (its session kind's, or `magic-team.inline.routine`'s when it runs inline).

# Steps

Exact instructions. Execute in order, every step, literally as written — not less, not more. If a step cannot execute as written: escalate it, and never skip it silently.

1. **spot-reference-gap**: While reading, spot a template-language construct, a `skin.settings.xml` field, or a skin lineage not yet captured in this skill's own reference sections (the template-language tag list, the `skin.settings.xml` field list, or "Known skin lineages").
2. **add-grounded-entry**: Add a short, grounded entry for it in the right reference section — only what has actually been confirmed in the source, and say so briefly. Do not guess the general shape from a single example.

# Closure steps

1. **log-outcome**: Log the addition like any other idle-day entry, as a new `note-*` own-inbox log item, through `--upsert-inbox-note`, named `note-<date>-<short-topic>.md`. Then run this member's own post-activity reflection (`--upsert-inbox-reflection`), per `keeper-acm.armed.md`.

# Routine's local procedures

Named procedure blocks. Steps above call them by name. Not separate routines — not visible outside this file.

None currently defined.

# Routine's local rules

All statements apply at the same time, always. These rules override a participant's own general `.armed.md` rules while this routine is active.

- This routine's own executor (`keeper-acm`) is permitted and obliged to execute every step exactly as written.
- Participants obey this routine's own rules over their normal `.armed.md` rules while participating.
- This skill's tag/field/path reference lists stay verbatim, enumerated — never compressed into prose (per `keeper-acm.armed.md`).
- Idle-run scheduling (weight, min-interval, scope) is not set here — it lives in `keeper-acm.armed.md`'s `## Idle-Tasks` section, which the `daily-idle-task` procedure reads.

# Routine-specific tooling

Every `magic-tooling` operation this routine uses. Full syntax and behavior here. Steps use its name only.

## Tooling operations

- `--console-start [--override-workspace <path>] [--console DistroSourceConsole.sh|DistroDeployConsole.sh] [--ttl <seconds>]` (**spot-reference-gap**: batch the reads)
- `--console-send <channel> [-- <command...>]` (**spot-reference-gap**)
- `--upsert-inbox-reflection <item-filename> [--from-file <path>|--edit-patch-from-stdin]` (**log-outcome**)

## `--console-start` Operation Reference

`DistroAgentsTools.fn.sh --console-start [--override-workspace <path>] [--console DistroSourceConsole.sh|DistroDeployConsole.sh] [--ttl <seconds>]` — starts (or reuses) a Keep-Alive console session. Default `--ttl`: 3600 seconds.

## `--console-send` Operation Reference

`DistroAgentsTools.fn.sh --console-send <channel> [-- <command...>]` — sends one command line into an open channel's FIFO. Command-only, not a data-transport.

## `--upsert-inbox-reflection` Operation Reference

`DistroAgentsItems.fn.sh --upsert-inbox-reflection <item-filename> [--from-file <path>|--edit-patch-from-stdin]` — files a `reflection-*` item into `<member>`'s own inbox.

# Maintainer Notes

Used to check this file's own definitions against its own goals when it is updated, assessed, or tested — resolved against the whole skillset, not this file alone. **IMPORTANT**: not applied during normal work!

## Verbatim-goals (intents)

- A reference entry is added only from what was actually confirmed in source, never guessed from a single example.

## Verbatim-tests (benchmarks)

- No new uncaptured construct/field/lineage found this pass is a valid, reportable outcome.

## Librarian Comments

### Reference

- `keeper-acm.armed.md`'s `## Idle-Tasks` section — the scheduling policy governing when this routine fires.
- `keeper-acm.armed.md`'s "Domain knowledge: ACM.TPL / ACM.ECMA / skin.settings.xml" — the reference sections this routine adds to.

### Conventions

- None currently known beyond this file's own Local rules.
