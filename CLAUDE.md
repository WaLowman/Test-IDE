# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is the **DM-GenAi-Masterclass-209-JHB-1.1** training repository by Imagineers.AI. It contains Module 8 educational content on agentic AI systems and four hands-on exercises, all grounded in a single case study: **Highveld GTS** launching "Authentic Cultural Experiences" (ACEs) — curated cultural excursions for international business visitors in Johannesburg.

## Case Study Context

Highveld GTS is a premium ground transportation company pivoting into curated cultural tourism. All exercises build on each other around this business concept. The BMC report at `IDE Exercise/260328-Highveld-GTS-BMC.md` is the authoritative source for business details (pricing, target market, partnerships, cost structure). When working on any exercise, reference this document and the company profile at `Highveld GTS/Highveld GTS ACE Profile.md`.

## Repository Structure

- **Module 8/** — Theoretical content on the shift from chatbots to agentic workspaces (workbenches, coding tools, editors, workflows, gateways)
- **Highveld GTS/** — Case study company profile
- **Cowork Exercise/** — Business Model Canvas development and financial modeling exercise (3-stage prompt chain using Claude Cowork)
- **IDE Exercise/** — Project management extraction, interactive Kanban board, and analytics dashboard (3-stage prompt chain using Claude Code)
- **Skill Creation Exercise/** — Building a reusable Photography Skill for AI image-generation prompts
- **Workflow Development/** — Go-To-Market agentic workflow design with deployment blueprint
- **Chris stuff/** — Supplementary training materials (IDE intro, CLI commands, Git commands)

## Exercise Architecture

Each exercise follows a **prompt chain** pattern where the output of one stage feeds into the next. The prompts are in each exercise's `Prompts/` subfolder, numbered sequentially. When executing an exercise, always read the assignment file first (e.g., `IDE Assignment.md`), then follow the prompt chain in order.

### IDE Exercise (primary code-generating exercise)

This is the exercise that produces code artifacts:

1. **Stage 1**: Extract project management parameters from the BMC into structured markdown
2. **Stage 2**: Generate a standalone HTML/CSS/JS Kanban board with drag-and-drop, localStorage persistence, and card modals
3. **Stage 3**: Generate a project dashboard that imports the Kanban JSON export and renders Chart.js visualizations

Completed outputs live in `IDE Exercise/Output/`. The Kanban board exports its state as JSON to `IDE Exercise/highveld-gts-kanban-export.json`, which the dashboard imports.

### Key Conventions for Generated HTML

- All HTML deliverables must be **standalone single-file** — inline all CSS and JS, no external dependencies except CDN links (e.g., Chart.js)
- Use **localStorage** for persistence in the Kanban board
- Support **JSON export/import** for data portability between artifacts
- Color-code by category using consistent color schemes across artifacts

## No Build System

This is a content/training repository with no package manager, build tools, or test framework. Deliverables are standalone HTML files opened directly in the browser.

## Viewing Output Files

Open HTML outputs in the default browser:
```bash
open "IDE Exercise/Output/kanban-board/BMC kanban test.html"
open "IDE Exercise/Output/project-dashboard/index.html"
```
