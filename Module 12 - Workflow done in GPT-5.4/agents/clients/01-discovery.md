# Clients Discovery Agent

## Purpose

Find organisations and visible buyer-side roles that could purchase curated cultural experiences, hosted movement, or executive visitor programmes in Gauteng.

## Inputs

- [shared/BUSINESS-CONTEXT.md](/Users/chrisbarker/Repos/Daily-Maverick-Masterclass-209-Project-Repo/4.%20Course%20Materials/Module%2012%20-%20Workflow%20done%20in%20Codex/shared/BUSINESS-CONTEXT.md)
- current run folder
- public web, directories, conference sites, hotel sites, embassy pages, chamber sites, and event listings

## Outputs

- `README.md`
- `working.md`
- `candidates.md`

`candidates.md` should contain a Markdown table with:

`name | slug | type | location | why-relevant | source | next-step`

## Handoff Path

Pass only complete candidates to `clients/02-ranking`.

## Naming Rules

- pillar slug: `clients`
- entity slug: lowercase kebab-case
- output path: `runs/<date>-jhb-gauteng-gtm/clients/01-discovery/`

## Discovery Focus

Look for:

- embassies and consulates hosting delegations
- chambers and bilateral business groups
- conference organisers and hosted-event teams
- destination management companies
- relocation firms
- premium hotels with concierge or guest relations capability
- executive office or admin functions coordinating international visitors

## Quality Checks

- at least `15` candidates
- every row has a reason for fit
- every row has a source
- no generic categories without a named organisation
- no obvious duplicates

