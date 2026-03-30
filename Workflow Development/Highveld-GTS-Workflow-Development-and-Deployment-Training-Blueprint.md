# Training Blueprint: Build Your Own GTM Pipeline

**Version:** 1.0
**Date:** 2026-03-29
**Status:** In Progress
**Objective:** Step-by-step guide for building an agentic go-to-market workflow for Highveld-GTS's Authentic Cultural Experiences (ACEs) — suitable for use as a training course blueprint
**Author:** Claude Opus 4.6
**Related Documents:** `GTM Workflow Requirement.md`, `Highveld GTS ACE Profile.md`

---

## Introduction

This blueprint guides participants through building a complete LLM-orchestrated go-to-market pipeline using Claude Code. It is structured as a software development lifecycle (SDLC) — using standard phases (PRD, architecture, implementation, testing, iteration) — so participants recognise the parallels with traditional software development.

**Company used throughout:** _Highveld-GTS_ — a ground transportation company in Johannesburg expanding into Authentic Cultural Experiences (ACEs) for business visitors. They need to identify potential clients, referral partners, and experience providers across Gauteng to bring their ACE offering to market.

The pipeline operates across three GTM pillars — **Clients**, **Partners**, and **Experiences** — each of which passes through the same four workflow stages: Discovery, Ranking, Research, and Outreach. The blueprint builds one pillar pipeline first, then replicates the architecture for the remaining two.

---

## Process Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                    AGENTIC PIPELINE BUILD LIFECYCLE                  │
│                                                                       │
│  Phase 0          Phase 1          Phase 2          Phase 3          │
│  DEFINE           DESIGN           BUILD            TEST             │
│                                                                       │
│  ┌─────────┐      ┌─────────┐      ┌─────────┐      ┌─────────┐    │
│  │   PRD   │  →   │  Arch   │  →   │  Impl   │  →   │  Test   │    │
│  │         │      │  Design │      │         │      │         │    │
│  └────┬────┘      └────┬────┘      └────┬────┘      └────┬────┘    │
│       │                │                │                │           │
│       ▼                ▼                ▼                ▼           │
│  Problem def      Agent roles      Agent files      First run       │
│  3 pillar scopes  Data schemas     Slash commands   Verify outputs  │
│  Quality criteria JSON contracts   Context loading  Fix failures    │
│  Persona defs     CLAUDE.md        Verification     Document issues │
│                   skeleton         scripts                           │
│                                                                       │
│  Phase 4          Phase 5                                            │
│  ITERATE          EXTEND                                             │
│                                                                       │
│  ┌─────────┐      ┌─────────┐                                       │
│  │ Improve │  →   │  MCP &  │                                       │
│  │         │      │  Scale  │                                       │
│  └────┬────┘      └────┬────┘                                       │
│       │                │                                             │
│       ▼                ▼                                             │
│  Fix quality      MCP integrations                                   │
│  issues           Parallel agents                                    │
│  Improve sources  Booking handoff                                    │
│  Calibrate scores Multi-pillar orchestration                         │
└─────────────────────────────────────────────────────────────────────┘
```

### Three-Pillar Architecture

```
                        ┌──────────────────┐
                        │  HIGHVELD-GTS    │
                        │  GTM WORKFLOW    │
                        └────────┬─────────┘
               ┌─────────────────┼─────────────────┐
               ▼                 ▼                 ▼
        ┌──────────┐      ┌──────────┐      ┌──────────┐
        │ CLIENTS  │      │ PARTNERS │      │EXPERIENCES│
        │ Pipeline │      │ Pipeline │      │ Pipeline  │
        └────┬─────┘      └────┬─────┘      └────┬─────┘
             │                 │                  │
    ┌────┬───┼───┬────┐  (same structure)   (same structure)
    ▼    ▼   ▼   ▼    │
  Disc  Rank Res Out  │
```

Build the **Clients** pipeline first. Once it is stable, replicate the architecture for Partners and Experiences — changing search parameters, scoring criteria, and outreach tone, but keeping the structure, schemas, and verification logic identical.

---

## Phase 0 — PRD: Define the Problem

**Duration:** 2–3 hours (covers all three pillars)
**Deliverable:** `PRD.md` — Product Requirements Document
**Exit criteria:** Team agrees on: what each pipeline does, what it does not do, and what "good output" looks like for each pillar

### Why this phase exists

LLM-orchestrated pipelines are easy to over-scope. Highveld-GTS faces an additional scoping risk: three pillars that could each spiral into dozens of sub-categories. The PRD forces a concrete agreement on scope before any code or instructions are written.

### What to define

**1. The business problem**

Write a 2–3 sentence statement of the specific GTM problem. Avoid vague language.

*Worked example — Highveld-GTS:*
> "Highveld-GTS is a ground transportation company expanding into Authentic Cultural Experiences for business visitors to Johannesburg. The team has deep local knowledge but no established network of paying clients, referral partners, or experience providers. We need to systematically discover, evaluate, and approach organisations and individuals across all three pillars — clients who will book experiences, partners who will refer guests, and experience providers who will deliver the cultural content — using an agentic workflow that a small, non-technical team can operate weekly."

**2. The pipeline stages (per pillar)**

Name each stage and describe its input, transformation, and output in one sentence each.

*Worked example — Highveld-GTS (Clients pillar):*
| Stage | Input | Transformation | Output |
|-------|-------|---------------|--------|
| Discovery | Web + event calendars + hotel directories | Search and filter for organisations hosting or receiving international visitors in Gauteng | List of 30–50 potential client organisations |
| Ranking | Discovery list | Score and sort by booking potential and accessibility | Top 20 prioritised prospects |
| Research | Top 20 | Deep research on each organisation's visitor patterns, decision-makers, and entertainment needs | Client dossiers |
| Outreach | Dossiers | Generate personalised partnership proposals and introduction scripts | Multi-channel outreach packs |

*Worked example — Highveld-GTS (Partners pillar):*
| Stage | Input | Transformation | Output |
|-------|-------|---------------|--------|
| Discovery | Hotel listings + DMC directories + tourism bodies | Search for accommodation providers, event organisers, and travel trade who interact with business visitors | List of 30–50 potential referral partners |
| Ranking | Discovery list | Score by referral volume potential and alignment | Top 20 prioritised partners |
| Research | Top 20 | Research each partner's guest profile, commission structures, and decision-makers | Partner dossiers |
| Outreach | Dossiers | Generate commission proposals and partnership pitches | Multi-channel outreach packs |

*Worked example — Highveld-GTS (Experiences pillar):*
| Stage | Input | Transformation | Output |
|-------|-------|---------------|--------|
| Discovery | Cultural directories + local guides + venue listings | Search for venues, artists, chefs, guides, and community hosts across 13 experience categories | List of 30–50 potential experience providers |
| Ranking | Discovery list | Score by guest appeal, reliability, and logistical fit | Top 20 prioritised providers |
| Research | Top 20 | Research each provider's offering, availability, pricing, and quality indicators | Experience dossiers |
| Outreach | Dossiers | Generate collaboration proposals tailored to each provider type | Multi-channel outreach packs |

**3. Quality criteria**

Define what "good enough" looks like for each stage. These become your test criteria.

*Worked example — Highveld-GTS (Clients pillar):*
- Discovery: Minimum 20 prospects per run; at least 4 client sub-categories represented (corporates, events, government/institutional, individual travellers)
- Ranking: Score breakdown auditable and explainable; top 5 prospects obvious to the team
- Research: Each dossier identifies at least 1 named decision-maker; visitor profile is specific (not generic)
- Outreach: Each proposal opens with a reference to the organisation's specific visitor context; no generic tourism brochure language

**4. What the pipeline does NOT do**

Equally important. Define the boundaries.

*Worked example — Highveld-GTS:*
- Does not send emails or messages (that remains a human decision)
- Does not book venues or make reservations
- Does not set pricing (that is a management decision informed by the cost structure)
- Does not access private CRM or booking system data
- Does not research outside Gauteng province
- Does not replace the team's local knowledge — it supplements it

**5. The sender personas**

Highveld-GTS has different team members suited to different outreach contexts. Define a persona for each pillar.

*Worked example — Highveld-GTS:*

**Clients pillar — Joanne Clarke:**
```
Sender: Joanne Clarke
Title: Business Development Manager, Highveld-GTS
Email: joanne@highveld-gts.co.za
Tone: Professional, warm, grounded in real local knowledge
Authority: Speaks as someone who has managed corporate relationships for 5 years
Prohibited: "unique experiences"; "hidden gems"; "off the beaten track"
Required: Reference the organisation's specific visitor context; mention the existing transport relationship if applicable
```

**Partners pillar — Joanne Clarke:**
```
Sender: Joanne Clarke
Title: Partnerships Manager, Highveld-GTS
Tone: Peer-to-peer with hospitality professionals; commercially direct
Prohibited: Generic tourism pitch language; "synergy"; "mutually beneficial"
Required: Reference the partner's specific guest profile; state the commission/referral model plainly
```

**Experiences pillar — Thandi (Cultural Coordinator):**
```
Sender: Thandi [surname]
Title: Cultural Experience Coordinator, Highveld-GTS
Tone: Respectful, enthusiastic about the provider's work, community-minded
Authority: Speaks as a cultural anthropology student with family roots in Soweto
Prohibited: Transactional language; treating cultural experiences as commodities
Required: Reference the provider's specific work or venue; explain how their offering fits into the ACE programme
```

---

## Phase 1 — Architecture Design

**Duration:** 2–3 hours
**Deliverable:** Architecture Document + skeleton `CLAUDE.md` + JSON schema drafts
**Exit criteria:** Data flow is agreed; file naming is documented; schemas are drafted

### Why this phase exists

The most costly mistakes in agentic pipeline development are architecture mistakes discovered after agents are built. For Highveld-GTS, the three-pillar structure makes this doubly important: inconsistent naming or schema design across pillars creates a maintenance nightmare. Define the conventions once, before writing any agent.

### What to design

**1. File system layout**

Sketch the exact directory structure before creating any files. The three-pillar structure means a `pillar/` level in the hierarchy.

*Worked example — Highveld-GTS:*
```
highveld-gts-gtm/
├── agents/
│   ├── clients/
│   │   ├── agent-1-discovery.md
│   │   ├── agent-2-ranking.md
│   │   ├── agent-3-research.md
│   │   └── agent-4-outreach.md
│   ├── partners/
│   │   ├── agent-1-discovery.md
│   │   ├── agent-2-ranking.md
│   │   ├── agent-3-research.md
│   │   └── agent-4-outreach.md
│   └── experiences/
│       ├── agent-1-discovery.md
│       ├── agent-2-ranking.md
│       ├── agent-3-research.md
│       └── agent-4-outreach.md
├── context/
│   └── highveld-gts/
│       ├── 1-company-overview.md
│       ├── 2-ace-concept.md
│       ├── 3-experience-packages.md
│       ├── 4-team.md
│       ├── 5-target-markets.md
│       └── 6-competitive-landscape.md
├── outputs/
│   ├── clients/
│   │   ├── json/
│   │   │   ├── agent-1-discovery/
│   │   │   ├── agent-2-ranking/
│   │   │   ├── agent-3-research/
│   │   │   └── agent-4-outreach/
│   │   └── markdown/
│   │       ├── agent-1-discovery/
│   │       ├── agent-2-ranking/
│   │       ├── agent-3-research/
│   │       │   ├── archive/
│   │       │   └── prospects/       ← one subfolder per organisation
│   │       └── agent-4-outreach/
│   │           ├── archive/
│   │           └── prospects/       ← identical slugs to agent-3
│   ├── partners/
│   │   └── [same structure as clients/]
│   └── experiences/
│       └── [same structure as clients/]
├── scripts/
│   ├── verify_outputs.sh
│   └── test_suite.py
├── .claude/
│   ├── commands/
│   └── settings.json
└── CLAUDE.md
```

**2. Prospect naming convention**

Decide this once, put it in CLAUDE.md, never revisit it.

*Recommended convention:*
```
Prospect slugs:
- Lowercase
- Hyphens for word separation
- Remove special characters
- Examples: "Saxon Hotel" → saxon-hotel, "Sandton Convention Centre" → sandton-convention-centre
- SAME slug must be used in agent-3-research/prospects/ and agent-4-outreach/prospects/
- Slugs are unique WITHIN a pillar (a hotel can appear as both a partner and a client with different dossiers)
```

**3. JSON schemas**

Draft the input and output schema for each agent. These don't need to be complete — the key fields and their types are sufficient at this stage.

*Worked example — Agent 2 output schema fragment (Highveld-GTS, Clients pillar):*
```json
{
  "ranking_summary": {
    "pillar": "clients",
    "generated_date": "YYYY-MM-DD",
    "top_20_prospects": [
      {
        "rank": 1,
        "organisation_name": "string",
        "organisation_slug": "string",
        "sub_category": "corporate | event | government | individual",
        "total_score": 0.0,
        "score_breakdown": { ... },
        "recommendation": "high_priority | medium_priority | low_priority"
      }
    ]
  }
}
```

*Key design rule:* The output schema of Agent N must contain every field that Agent N+1 requires as input. Check this explicitly before building the agents.

**4. CLAUDE.md skeleton**

Create the skeleton `CLAUDE.md` before writing any agent files. Populate it with the conventions agreed in this phase:

```markdown
# CLAUDE.md — Highveld-GTS Go-to-Market Pipeline

## Project Overview
Agentic GTM workflow for Highveld-GTS's Authentic Cultural Experiences.
Three pillars: Clients, Partners, Experiences.
Each pillar runs the same 4-stage pipeline: Discovery → Ranking → Research → Outreach.

## Conventions
### File Naming
- Output files: YYYY-MM-DD_descriptor.json / .md
- Prospect slugs: [lowercase, hyphens, no special chars]

### Pillar Codes
- clients, partners, experiences (used in folder paths and JSON fields)

## Data Flow (per pillar)
Agent 1 → outputs/[pillar]/json/agent-1-discovery/YYYY-MM-DD_discovery-report.json
Agent 2 → outputs/[pillar]/json/agent-2-ranking/YYYY-MM-DD_ranking-summary.json
Agent 3 → outputs/[pillar]/json/agent-3-research/YYYY-MM-DD_prospect-dossiers.json
         + prospects/[slug]/YYYY-MM-DD_dossier.md
Agent 4 → outputs/[pillar]/markdown/agent-4-outreach/prospects/[slug]/YYYY-MM-DD_*.md

## Sender Personas
[Joanne for Clients & Partners; Thandi for Experiences — details from PRD]

## Output Expectations (per pillar)
- Agent 1: 2 files (JSON + Markdown)
- Agent 2: 2 files (JSON + Markdown)
- Agent 3: N+2 files (JSON + summary + N per-prospect dossiers)
- Agent 4: N+2 files (JSON + summary + N per-prospect outreach packs)

## Geographic Scope
Gauteng province only (Johannesburg, Sandton, Soweto, Pretoria, surrounds)
```

---

## Phase 2 — Implementation

**Duration:** 6–8 hours (for the first pillar; 2–3 hours for each subsequent pillar)
**Deliverable:** 4 agent files per pillar, slash commands/skills, verification script
**Exit criteria:** All agents can be invoked independently and produce valid output files

### Principle: Build one pillar at a time, one agent at a time

Build the **Clients** pipeline first. Within that pipeline, build Agent 1, run it, review its output, confirm it meets quality criteria, then build Agent 2. Only after the Clients pipeline is stable should you replicate the architecture for Partners and Experiences.

### Step 2.1: Create company context files

Before writing any agent, capture Highveld-GTS's context in a form that can be loaded by all agents. Write 6 markdown files:

1. **Company overview**: Ground transportation company in Johannesburg, premium fleet, executive transport, Uber Black operations
2. **ACE concept**: What Authentic Cultural Experiences are, who they are for, the gap in the market between generic Soweto tours and bespoke business visitor experiences
3. **Experience packages**: The three signature experiences (Mandela Legacy, Johannesburg After Dark, The Spice Route), pricing, capacity, cost structure
4. **Team credentials**: Joanne (admin, BCom, 5 years), Chris (BCom student, GenAI enthusiast), Peter (engineering student, programmer), Thandi (anthropology student, cultural connections), Praveen (retired teacher, Fordsburg historian), Boitumelo (photographer, visual storytelling)
5. **Target markets**: Primary (international business visitors, government delegates, conference attendees) and secondary (corporate entertainment, incentive travel, expat community)
6. **Competitive landscape**: City Sightseeing, MoAfrika Tours, African Eagle, hotel concierge gaps; Highveld-GTS differentiator (premium, flexible, authentic, business-visitor-focused)

*Worked example — Highveld-GTS context structure:*

`context/highveld-gts/1-company-overview.md`:
> Highveld GTS is a ground transportation company in Johannesburg offering premium executive transport, airport transfers, and Uber Black services. The business operates a fleet of premium vehicles with professional drivers and has existing corporate accounts. The company is expanding into Authentic Cultural Experiences (ACEs) — curated cultural excursions for time-poor business visitors. Founded and owned by [The Boss], with Joanne Clarke managing HR, admin, and now spearheading the ACE initiative...

These files become the grounding context loaded by all agents at the start of execution.

### Step 2.2: Build Agent 1 (Discovery) — Clients Pillar

**Structure your agent file with these sections:**

1. **Purpose** — 1 paragraph, plain English
2. **Step 1: Load context** — file paths to load from `context/`
3. **Step 2: Load previous period data** — for deduplication
4. **Step 3: Define search parameters** — keywords, sources, geography
5. **Step 4: Execute research** — source list with REQUIRED tags, minimum count
6. **Step 5: Smart threshold management** — when to stop
7. **Step 6: Extract prospect data** — what fields to extract per organisation
8. **Step 7: Assess ACE fit** — how to score relevance to the ACE offering
9. **Step 8: Deduplication** — how to handle re-appearing organisations
10. **Step 9: Generate output** — exact file paths, JSON schema, Markdown templates
11. **Step 10: Execution checklist** — list of checks to pass before completing

*Worked example — Highveld-GTS Agent 1 (Clients) search parameters:*
```
Primary keywords:
- "international conference Johannesburg 2026"
- "business summit Sandton Convention Centre"
- "corporate events Johannesburg"
- "embassy Pretoria cultural programme"
- "international visitors Gauteng"
- "G20 summit Johannesburg delegates"

Sub-category-specific searches:
- Corporates: "multinational company Sandton office" + "corporate entertainment Johannesburg"
- Events: "conference Johannesburg 2026" + "expo Sandton" + "product launch Gauteng"
- Government/Institutional: "embassy Pretoria" + "UN agencies Johannesburg" + "World Bank South Africa"
- Individual: "executive travel Johannesburg" + "travel management company South Africa"

REQUIRED sources (all must be attempted):
- Google News (Johannesburg business events)
- Sandton Convention Centre events calendar
- DIRCO (Dept of International Relations) — embassy listings
- South African Tourism corporate events listings
- LinkedIn (corporate hospitality roles in Gauteng)
- Conference alert sites (AllConferences, 10times.com)
- Hotel event pages (Saxon, Four Seasons Westcliff, Sandton Sun)

Minimum 10 distinct sources
Threshold: 20 qualified prospects OR sources exhausted
Geographic filter: Gauteng province only
```

**Critical instruction to include:**

```markdown
### Output File Generation

CRITICAL REQUIREMENT: Generate one JSON file and one Markdown summary.
No individual per-prospect files are required at this stage.
The JSON file MUST contain ALL prospects found — not a sample.
```

### Step 2.3: Build Agent 2 (Ranking) — Clients Pillar

Agent 2's structure is the most mathematical. The scoring model should be:

1. **Defined explicitly** — name each criterion, its weight, and how it is measured
2. **Deterministic** — given the same input, always produce the same ranking
3. **Auditable** — the score breakdown for each organisation must appear in the output

*Worked example — Highveld-GTS (Clients) scoring model:*

| Criterion | Weight | Measurement |
|-----------|--------|-------------|
| Volume of international visitors | 25% | Estimated annual visitors: 0–10 scale |
| Named decision-maker identified | 20% | Boolean |
| Regularity (recurring vs. one-off) | 20% | Recurring = 10, Annual = 7, One-off = 3 |
| Budget indicators (expense accounts, VIP hosting) | 15% | 0–10 scale based on evidence |
| Accessibility (how easy to approach) | 10% | 0–10 scale |
| Time sensitivity (upcoming event/visit) | 10% | 0–10 scale |

The weights must sum to 100%. This is verifiable and forces a deliberate trade-off conversation with the team.

**Critical output:** Ensure Agent 2 produces two files:
- `YYYY-MM-DD_ranked-prospects.json` — all ranked prospects
- `YYYY-MM-DD_ranking-summary.json` — top-20 only (this is what Agent 3 reads)

This two-file pattern prevents Agent 3 from needing to parse and filter a large file.

### Step 2.4: Build Agent 3 (Research) — Clients Pillar

Agent 3 has the most complex output structure. The key design decisions are:

1. **Per-prospect subfolders**: Each prospect gets its own subfolder (`prospects/[slug]/`)
2. **Dossier completeness**: The dossier template must specify every required section
3. **Explicit file count enforcement**: The most important instruction in the entire file

*Dossier template for Clients pillar:*
```markdown
# [Organisation Name] — Client Dossier

## Organisation Profile
- Type: [corporate | event | government | individual]
- Location: [specific area within Gauteng]
- Website: [URL]
- International visitor context: [why they receive/host international visitors]

## Visitor Profile
- Estimated annual international visitors: [number/range]
- Visitor origin countries: [primary countries]
- Typical visit duration: [days]
- Entertainment/leisure gaps: [when visitors have free time]
- Interests and preferences: [based on visitor profile]

## Decision-Makers
- Primary contact: [name, title, email/LinkedIn]
- Secondary contact: [name, title]
- How decisions are made: [procurement, PA, concierge, direct]

## ACE Fit Assessment
- Recommended experience packages: [which of the 3 signature + custom]
- Estimated bookings per year: [conservative estimate]
- Revenue potential: [based on pricing and volume]
- Approach strategy: [how to introduce the ACE concept]

## Key Facts for Outreach
- [Specific, verifiable fact 1]
- [Specific, verifiable fact 2]
- [Connection to existing Highveld-GTS transport relationship, if any]
```

*The file count instruction (do not soften this):*
```markdown
### File Generation — MANDATORY

You MUST create an individual markdown dossier file for EVERY SINGLE prospect
in the top 20 list (or all prospects if fewer than 20).

DO NOT:
- Create only samples
- Create only the "most interesting" prospects
- Create representative examples
- Skip any prospect for any reason

VERIFICATION (run this before finishing):
find outputs/clients/markdown/agent-3-research/prospects/ -name "YYYY-MM-DD_dossier.md" | wc -l
This count MUST equal the number of prospects you processed.
```

### Step 2.5: Build Agent 4 (Outreach) — Clients Pillar

Agent 4 is the most personalisation-sensitive. For Highveld-GTS, the outreach challenge is specific: positioning a transport company as a cultural experience provider. The tone must convey credibility and local knowledge, not tourism cliches.

**Required tone specification sections:**
1. `PROHIBITED phrases` — list the cliches that must never appear
2. `Opening pattern` — describe (with examples) how to open every proposal
3. `Authority level` — describe the sender's standing relative to the recipient
4. `Specificity requirement` — every script must reference a concrete fact about the organisation

*Worked example — Highveld-GTS (Clients) tone specification:*
```
Sender: Joanne Clarke, Business Development Manager

PROHIBITED:
- "unique experiences"
- "hidden gems"
- "off the beaten track"
- "I hope this email finds you well"
- "vibrant city"
- "rainbow nation"
- "world-class"

Required opening pattern:
Lead with a specific, verifiable fact about the organisation's visitor activity.
Good: "The African Mining Indaba brings 7,000+ international delegates to
       Sandton every February — we help their hosts turn free evenings into
       memorable cultural experiences."
Bad: "I wanted to introduce you to our unique cultural experience offerings
      in vibrant Johannesburg..."

Joanne writes as a business services professional who already manages
corporate transport relationships — not as a tour operator seeking attention.
Her proposals are structured as business cases: problem (guests with free time),
solution (curated ACEs), logistics (handled end-to-end), pricing (transparent).
Maximum 4 paragraphs.
```

**Multi-channel outreach for Clients pillar:**

Each prospect outreach pack should contain:
1. **Email proposal** — the primary outreach document
2. **LinkedIn connection note** — for the decision-maker (max 300 characters)
3. **Preparation brief** — internal document for Joanne with talking points, objection responses, and the specific ACE packages to recommend

### Step 2.6: Create orchestration commands/skills

Create the main pipeline skill and individual agent skills:

**Main pipeline (`run-clients-pipeline.md`):**
- Explicit sequential execution with verification gates
- Archiving step at the start of each agent (move old files before creating new ones)
- `VERIFY` block after each agent that checks file existence and count
- `CRITICAL: Do not proceed to the next agent if verification fails`

**Individual agent skills (`run-clients-agent-1.md` through `run-clients-agent-4.md`):**
- Used for testing, re-running failed agents, and debugging
- Each includes its own `## Archiving (CRITICAL)` section

**Pillar-level skills:**
- `run-partners-pipeline.md` and `run-experiences-pipeline.md` — identical structure, different parameters
- These are created after the Clients pipeline is stable

### Step 2.7: Create the verification script

`scripts/verify_outputs.sh` is not optional. Write it before the first run.

```bash
#!/bin/bash
PILLAR=$1
DATE=$2
EXPECTED_COUNT=$3

# Agent 1: JSON + Markdown
[ -f "outputs/${PILLAR}/json/agent-1-discovery/${DATE}_discovery-report.json" ] || exit 1
[ -f "outputs/${PILLAR}/markdown/agent-1-discovery/${DATE}_discovery-report.md" ] || exit 1

# Agent 2: JSON + Markdown + summary
[ -f "outputs/${PILLAR}/json/agent-2-ranking/${DATE}_ranked-prospects.json" ] || exit 1
[ -f "outputs/${PILLAR}/json/agent-2-ranking/${DATE}_ranking-summary.json" ] || exit 1

# Agent 3: JSON + per-prospect dossiers
ACTUAL=$(find outputs/${PILLAR}/markdown/agent-3-research/prospects/ -name "${DATE}_dossier.md" | wc -l)
[ "$ACTUAL" -eq "$EXPECTED_COUNT" ] || { echo "Agent 3: Expected $EXPECTED_COUNT, got $ACTUAL"; exit 1; }

# Agent 4: outreach packs per prospect
ACTUAL=$(find outputs/${PILLAR}/markdown/agent-4-outreach/prospects/ -name "${DATE}_email-proposal.md" | wc -l)
[ "$ACTUAL" -eq "$EXPECTED_COUNT" ] || { echo "Agent 4: Expected $EXPECTED_COUNT, got $ACTUAL"; exit 1; }

echo "All verifications passed for ${PILLAR} pillar."
```

Usage: `./scripts/verify_outputs.sh clients 2026-04-01 20`

---

## Phase 3 — Testing

**Duration:** 2–4 hours (per pillar, per iteration)
**Deliverable:** First successful pipeline run + test results documentation
**Exit criteria:** Full pipeline runs without correction phases; output counts match expectations; quality review passed

### The first run

Run Agent 1 alone before running the full pipeline:
```
/run-clients-agent-1
```

Review the output carefully:
- How many prospects were found?
- Are all four client sub-categories represented (corporates, events, government, individuals)?
- Does the ACE fit reasoning make sense? Would this organisation actually book a cultural experience?
- Are there obvious duplicates or Gauteng-irrelevant entries?
- Are the sources cited real and verifiable?

Refine Agent 1's instructions based on this review before proceeding to Agent 2.

### Quality review checklist (per agent)

**Agent 1 review:**
- [ ] Minimum 20 prospects found
- [ ] At least 4 client sub-categories represented
- [ ] ACE fit reasoning is specific to each organisation (not generic)
- [ ] No duplicate organisations
- [ ] All prospects are within Gauteng

**Agent 2 review:**
- [ ] Score breakdown is auditable for top 10
- [ ] Top 5 agree with the team's intuition ("would Joanne call these first?")
- [ ] `ranking-summary.json` exists and contains top-20 array
- [ ] ranking-summary.json is what Agent 3 will read

**Agent 3 review:**
- [ ] File count matches prospect count
- [ ] Each dossier names at least 1 decision-maker
- [ ] Organisation descriptions are accurate (spot-check 3–5 against their websites)
- [ ] ACE fit assessment recommends specific experience packages
- [ ] Key facts for outreach are verifiable

**Agent 4 review:**
- [ ] No scripts use prohibited phrases
- [ ] Every email opens with an organisation-specific reference
- [ ] File count matches prospect count
- [ ] Preparation brief includes actionable talking points for Joanne
- [ ] LinkedIn notes are under 300 characters
- [ ] Tone is business services professional, not tour operator

### Team review session

Highveld-GTS's strength is local knowledge. After the first run, hold a team review:

- **Joanne** reviews the Client outreach packs — would she send these?
- **Thandi** reviews any cultural references — are they accurate and respectful?
- **Praveen** reviews historical references — are the facts correct?
- **Peter** reviews the technical output — are JSON schemas valid, file counts correct?
- **Chris** reviews the overall flow — is the pipeline producing what the PRD specified?
- **Boitumelo** reviews from a visual/storytelling angle — do the descriptions paint a compelling picture?

### Documenting issues

Every issue found in Phase 3 should be documented. The documentation serves two purposes:
1. It drives the fix in Phase 4
2. It builds the troubleshooting guide for ongoing operations

Create `docs/YYYY-MM-DD_first-run-issues.md` with:
- What happened
- Root cause analysis
- Fix applied
- How to prevent recurrence

---

## Phase 4 — Iteration

**Duration:** Ongoing (typically 2–4 cycles before stable)
**Deliverable:** Updated agent files + documentation of changes
**Exit criteria:** Two consecutive pipeline runs with zero correction phases

### Common iteration patterns

**Pattern 1: Too few prospects (Agent 1)**

Diagnosis: Check which sources were queried and how many results each returned.

Fixes:
- Add missing source categories (event calendars and hotel concierge pages are high-value for the Clients pillar)
- Expand search to include Pretoria (many embassies and government agencies)
- Lower the threshold quality bar temporarily to understand the available universe
- For the Experiences pillar specifically: check Joburg's cultural directories (Johannesburg In Your Pocket, What's On in Joburg)

**Pattern 2: Rankings don't match team intuition (Agent 2)**

Diagnosis: Show the top-5 to Joanne and ask: would you approach these first?

Fixes:
- Adjust scoring weights (the team may value "existing transport relationship" more heavily)
- Add a new criterion that the team cares about (e.g., "proximity to existing routes" or "known personal connection")
- Review whether the volume estimates are being assessed correctly from the source data

**Pattern 3: Generic outreach (Agent 4)**

Diagnosis: Read 3–5 proposals without looking at which organisation they're for. If they're interchangeable, they're too generic.

Fixes:
- Strengthen the specificity requirement in the tone specification
- Verify that Agent 3 dossiers contain enough organisation-specific detail for Agent 4 to work with
- Add an explicit instruction: "The first sentence of every email must contain the organisation name and a specific fact about their visitor activity that appears nowhere else in the email"
- Check that prohibited phrases haven't crept back in

**Pattern 4: Missing files (Agents 3 and 4)**

Diagnosis: Verification script fails.

Fixes (in order):
1. Strengthen the "MANDATORY — NO EXCEPTIONS" language in the agent file
2. Move the verification requirement to the _middle_ of the agent's execution, not the end ("After creating each file, confirm it was saved before moving to the next prospect")
3. Add a completion checklist that the agent must work through before finishing

**Pattern 5: Cultural insensitivity (Highveld-GTS-specific)**

Diagnosis: Thandi or Praveen flag content that misrepresents communities, oversimplifies history, or commodifies culture.

Fixes:
- Add a `## Cultural Sensitivity` section to CLAUDE.md with explicit guidelines
- Include specific prohibitions: no apartheid tourism framing, no poverty tourism, no reduction of communities to stereotypes
- Require that all community-based experience descriptions reference the community's own narrative, not an outsider's

### Replicating to Partners and Experiences pillars

Once the Clients pipeline is stable (two clean runs), replicate:

1. **Copy the agent files** from `agents/clients/` to `agents/partners/` and `agents/experiences/`
2. **Change the search parameters** in Agent 1 (different sources, keywords, sub-categories)
3. **Change the scoring model** in Agent 2 (different criteria and weights for each pillar)
4. **Change the dossier template** in Agent 3 (Partners need commission structures; Experiences need availability and logistics)
5. **Change the sender persona** in Agent 4 (Thandi for Experiences, Joanne for Partners)
6. **Create new orchestration skills** (`run-partners-pipeline.md`, `run-experiences-pipeline.md`)
7. **Update the verification script** to accept the pillar as a parameter (already designed for this)

Do NOT build all three pillars simultaneously. Build Partners next, test it, stabilise it. Then Experiences.

---

## Phase 5 — Extension

**Duration:** As needed
**Deliverable:** MCP integrations, parallel execution, additional capabilities

### Extension 1: Gmail integration

Once the pipeline is stable, extend Agent 4 to create Gmail drafts:

```markdown
### Step [N]: Create Gmail Drafts

After generating the email proposal for each prospect, use the Gmail MCP to create
a draft in Joanne's account:
- Subject: [from email proposal]
- To: [primary decision-maker email from dossier]
- Body: [email proposal body]
- Label: "highveld-gtm-[pillar]-[YYYY-MM-DD]"

Confirm each draft was created before moving to the next prospect.
```

### Extension 2: Parallel research in Agent 3

Once you are confident in the system's reliability, allow Agent 3 to research multiple prospects in parallel:

```markdown
### Parallel Research

Research prospects in batches of 5 using parallel sub-agents:
- Launch 5 sub-agents simultaneously (one per prospect)
- Each sub-agent receives: prospect details from Agent 2, company context
- Each sub-agent MUST return a complete dossier JSON object
- Merge all returned objects, then write individual markdown files

This reduces Agent 3 execution from ~25 minutes to ~5 minutes.
```

### Extension 3: Cross-pillar intelligence

Once all three pillar pipelines are running, create a cross-pillar analysis agent:

```markdown
### Cross-Pillar Linker

After all three pipelines complete, run a cross-pillar analysis:
- Identify organisations that appear in multiple pillars (e.g., a hotel is both
  a Partner and a venue for an Experience)
- Flag synergies: "Saxon Hotel (Partner) hosts guests who match the Mandela Legacy
  experience (Experiences) — coordinate outreach"
- Generate a weekly GTM summary that combines the top prospects across all pillars
  into a single prioritised action list for the team meeting
```

### Extension 4: Booking and capacity management

Extend the system to track which experiences have been pitched, booked, and delivered:

```markdown
### Capacity Tracker

Maintain a running log:
- inputs/bookings/YYYY-MM-DD_bookings.json
- Track: prospect slug, experience type, date, guests, status (pitched/confirmed/delivered)
- Agent 1 reads this log to exclude organisations that have already been contacted
- Weekly summary: conversion rates by pillar, popular experiences, revenue pipeline
```

### Extension 5: Visual content generation

Leverage Boitumelo's photography skills:

```markdown
### Experience Visual Briefs

For each experience provider dossier (Experiences pillar), generate:
- A photography shot list for Boitumelo (specific locations, times of day, subjects)
- Social media content templates that pair her photos with experience descriptions
- Partnership proposal attachments that include visual storytelling elements
```

---

## Key Principles for Participants

### 1. Build sequentially, not in parallel

Both the pipeline execution AND the build process should be sequential. Build Agent 1, test it, validate it. Then Agent 2. Build the Clients pillar first, stabilise it, then Partners. Never build all three pillars simultaneously — you won't know where a problem originates.

### 2. Explicit beats implicit, always

Anything that is critical must be stated explicitly and visibly. Instructions buried in step 12 of an 800-line document will be ignored. Critical requirements belong:
- In CLAUDE.md
- At the top of the orchestration command
- In a `## Critical` section at the top of the agent file
- In the verification script (automated enforcement)

### 3. Verification is not optional

Every agent must have automated output verification. A test that passes when you run it manually is not the same as a test that automatically blocks pipeline progression when it fails.

### 4. The orchestration layer is where reliability lives

The agent files contain business logic. The slash command / skill contains reliability logic. Archiving, verification, sequential enforcement, and error handling all belong in the orchestration layer — not buried in the agents.

### 5. CLAUDE.md is the project's constitution

Anything that must be true across all agents and all pillars goes in CLAUDE.md, nowhere else. Naming conventions, sender personas, geographic scope, cultural sensitivity guidelines, file structure — defined once, referenced by all.

### 6. Markdown-as-logic is a feature, not a compromise

The markdown instruction format is not a limitation of Claude Code — it is the key to making these pipelines maintainable by the Highveld-GTS team. Joanne can read, understand, and modify an agent instruction file. She cannot modify a Python orchestrator. This is a genuine advantage for a small team with limited technical resources.

### 7. Local knowledge is your unfair advantage

The pipeline automates discovery and research, but the team's local knowledge — Thandi's cultural connections, Praveen's historical expertise, Boitumelo's visual eye, Joanne's corporate relationships — is what makes the output authentic. Build the pipeline to amplify this knowledge, not replace it. Always include a team review step before any outreach is sent.

---

## Team Roles in the Pipeline

| Team Member | Pipeline Role | Specific Responsibilities |
|-------------|--------------|--------------------------|
| **Chris** | Pipeline operator | Runs the pipeline, monitors output, manages files |
| **Peter** | Technical support | Writes verification scripts, debugs JSON schemas, maintains CLAUDE.md |
| **Joanne** | Clients & Partners reviewer | Reviews and approves all outreach before sending; provides corporate context |
| **Thandi** | Experiences reviewer & cultural advisor | Reviews experience provider dossiers; ensures cultural accuracy and sensitivity |
| **Praveen** | Historical accuracy reviewer | Fact-checks heritage and historical references in dossiers and outreach |
| **Boitumelo** | Visual content coordinator | Creates photography briefs from dossiers; reviews experience descriptions for visual storytelling potential |

---

## Deliverables Summary

| Phase | Key Deliverables |
|-------|-----------------|
| 0 — PRD | `PRD.md` with problem statement, 3 pillar scopes, quality criteria, sender personas |
| 1 — Architecture | Architecture doc, `CLAUDE.md` skeleton, JSON schema drafts, 3-pillar file system layout |
| 2 — Implementation | 4 agent files (Clients first), orchestration skills, verification script, company context |
| 3 — Testing | First pipeline run results, quality review, team review session, issues documentation |
| 4 — Iteration | Updated agent files, troubleshooting guide, stable second run, replication to Partners & Experiences |
| 5 — Extension | Gmail drafts, parallel agents, cross-pillar analysis, booking tracker, visual briefs |

---

## Estimated Effort

| Phase | Effort (hours) | Notes |
|-------|---------------|-------|
| PRD (all 3 pillars) | 3 | Longer than single-pillar because 3 scopes to define |
| Architecture | 3 | Three-pillar structure adds design complexity |
| Implementation — Clients | 6 | First pillar, full build |
| Implementation — Partners | 3 | Replicate and adapt from Clients |
| Implementation — Experiences | 3 | Replicate and adapt from Clients |
| Testing (first run, per pillar) | 2 each (6 total) | Includes team review session |
| Iteration (2–3 cycles, all pillars) | 6 | Cross-pillar issues emerge here |
| **Total** | **~30 hours** | |

This assumes the team has:
- Clarity on Highveld-GTS's business, ACE concept, and target markets (context writing is included in implementation)
- Access to Claude Code
- Basic familiarity with markdown and JSON (Peter and Chris handle technical tasks; Joanne, Thandi, and Praveen focus on content review)
- Time allocated across the team for review sessions (not all hours fall on one person)

### Suggested team allocation:
- **Chris + Peter:** ~20 hours (build, test, iterate)
- **Joanne:** ~5 hours (PRD input, outreach review, content approval)
- **Thandi + Praveen:** ~3 hours (cultural and historical review)
- **Boitumelo:** ~2 hours (visual content review, photography brief input)

---

*End of Training Blueprint — Highveld-GTS Workflow Development & Deployment*
