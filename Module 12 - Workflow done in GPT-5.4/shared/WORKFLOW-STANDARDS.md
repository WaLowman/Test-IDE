# Workflow Standards

## Naming Rules

- Date format: `YYYY-MM-DD`
- Run slug: `YYYY-MM-DD-jhb-gauteng-gtm`
- Entity slug: lowercase kebab-case
- Stage folder names:
  - `01-discovery`
  - `02-ranking`
  - `03-research`
  - `04-outreach`

## Required Files Per Stage

Each stage should keep its outputs simple:

- `README.md`: what was done, by whom, and stage status
- `working.md`: notes, reasoning, source fragments, assumptions
- stage-specific output file

Recommended stage-specific outputs:

- discovery: `candidates.md`
- ranking: `priority-list.md`
- research: `dossiers.md`
- outreach: `drafts.md`

## Source Hygiene

- Prefer recent, public, primary, and directly attributable sources.
- Record the source link or origin beside important claims.
- Separate facts from assumptions.
- Flag stale or weak evidence.

## Quality Bar

- discovery outputs must be broad enough to rank
- ranking outputs must explain why the top names matter now
- research outputs must support real outreach without further basic lookup
- outreach outputs must sound credible to a human recipient and reflect the dossier

## Minimal Markdown Tables

Discovery table columns:

`name | slug | type | location | why-relevant | source | next-step`

Ranking table columns:

`rank | name | slug | score | rationale | owner | next-stage`

Research dossier headings:

- snapshot
- fit
- decision-maker or route-in
- evidence
- offer angle
- risks
- recommended outreach move

Outreach headings:

- target
- objective
- message
- subject line or opener
- proof points to mention
- follow-up note

