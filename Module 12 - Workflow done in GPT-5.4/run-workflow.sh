#!/bin/zsh
set -euo pipefail

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
RUN_DATE="${1:-$(date +%F)}"
RUN_SLUG="${RUN_DATE}-jhb-gauteng-gtm"
RUN_DIR="${BASE_DIR}/runs/${RUN_SLUG}"

mkdir -p "${RUN_DIR}"

for pillar in clients partners experiences; do
  for stage in 01-discovery 02-ranking 03-research 04-outreach; do
    STAGE_DIR="${RUN_DIR}/${pillar}/${stage}"
    mkdir -p "${STAGE_DIR}"

    if [[ ! -f "${STAGE_DIR}/README.md" ]]; then
      /bin/cat > "${STAGE_DIR}/README.md" <<EOF
# ${pillar} ${stage}

- status: not started
- run-date: ${RUN_DATE}
- owner: unassigned
- upstream: fill in when work starts
- downstream: fill in when handing off

## Stage Goal

Fill this stage using the matching brief in \`agents/${pillar}/${stage}.md\`.
EOF
    fi

    if [[ ! -f "${STAGE_DIR}/working.md" ]]; then
      /bin/cat > "${STAGE_DIR}/working.md" <<EOF
# Working Notes

Use this file for notes, sources, assumptions, and decisions.
EOF
    fi
  done
done

for path in \
  "${RUN_DIR}/clients/01-discovery/candidates.md" \
  "${RUN_DIR}/partners/01-discovery/candidates.md" \
  "${RUN_DIR}/experiences/01-discovery/candidates.md"; do
  [[ -f "${path}" ]] || /bin/cat > "${path}" <<'EOF'
# Candidates

| name | slug | type | location | why-relevant | source | next-step |
|---|---|---|---|---|---|---|
EOF
done

for path in \
  "${RUN_DIR}/clients/02-ranking/priority-list.md" \
  "${RUN_DIR}/partners/02-ranking/priority-list.md" \
  "${RUN_DIR}/experiences/02-ranking/priority-list.md"; do
  [[ -f "${path}" ]] || /bin/cat > "${path}" <<'EOF'
# Priority List

| rank | name | slug | score | rationale | owner | next-stage |
|---|---|---|---|---|---|---|
EOF
done

for path in \
  "${RUN_DIR}/clients/03-research/dossiers.md" \
  "${RUN_DIR}/partners/03-research/dossiers.md" \
  "${RUN_DIR}/experiences/03-research/dossiers.md"; do
  [[ -f "${path}" ]] || /bin/cat > "${path}" <<'EOF'
# Dossiers

Add one dossier section per shortlisted target.
EOF
done

for path in \
  "${RUN_DIR}/clients/04-outreach/drafts.md" \
  "${RUN_DIR}/partners/04-outreach/drafts.md" \
  "${RUN_DIR}/experiences/04-outreach/drafts.md"; do
  [[ -f "${path}" ]] || /bin/cat > "${path}" <<'EOF'
# Drafts

Add tailored outreach drafts and prep notes here.
EOF
done

/bin/cat > "${RUN_DIR}/run-index.md" <<EOF
# ${RUN_SLUG}

## Workflow Order

### Clients

1. [ ] 01-discovery
2. [ ] 02-ranking
3. [ ] 03-research
4. [ ] 04-outreach

### Partners

1. [ ] 01-discovery
2. [ ] 02-ranking
3. [ ] 03-research
4. [ ] 04-outreach

### Experiences

1. [ ] 01-discovery
2. [ ] 02-ranking
3. [ ] 03-research
4. [ ] 04-outreach

## Shared References

- \`shared/BUSINESS-CONTEXT.md\`
- \`shared/WORKFLOW-STANDARDS.md\`
- \`shared/SCORING-MODEL.md\`
- \`shared/DOSSIER-TEMPLATE.md\`
- \`shared/OUTREACH-TEMPLATE.md\`

## Notes

- use the agent briefs in \`agents/\`
- keep outputs inside this run folder
- do not skip handoffs
EOF

echo "Created run: ${RUN_DIR}"
echo ""
echo "Execution order:"
echo "  clients -> discovery -> ranking -> research -> outreach"
echo "  partners -> discovery -> ranking -> research -> outreach"
echo "  experiences -> discovery -> ranking -> research -> outreach"
echo ""
echo "Open: ${RUN_DIR}/run-index.md"
