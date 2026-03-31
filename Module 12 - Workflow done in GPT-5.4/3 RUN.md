# Run This Workflow

From this folder, run:

```bash
./run-workflow.sh
```

To force a specific date:

```bash
./run-workflow.sh 2026-03-29
```

## What The Command Does

- creates a dated run folder in `runs/`
- creates all pillar and stage subfolders
- drops starter Markdown files into each stage
- creates a `run-index.md` checklist for the whole run
- prints the execution order

## Recommended Demo Sequence

1. Start with `clients`
2. Then `partners`
3. Then `experiences`

Within each pillar, follow:

1. `01-discovery`
2. `02-ranking`
3. `03-research`
4. `04-outreach`

## Working Style

- use the agent brief in `agents/<pillar>/`
- write outputs only inside the active `runs/<date>-jhb-gauteng-gtm/` folder
- keep outputs practical, not academic
- prefer short tables, short dossiers, and usable outreach drafts

## Expected Demo Outcome

By the end of one run, you should have:

- a prospect list for buyer organisations and buyer-side contacts
- a partner shortlist for referral and channel development
- an experience shortlist worth packaging
- dossiers on the top targets
- draft outreach messages grounded in actual fit

