# IDE ASSIGNMENT

## Stage 1 - Project Parameters

A structured markdown document that extracts all project management parameters from the Highveld-GTS BMC Report needed to populate a Kanban board for the launch phase. At minimum, identify:

- Key activities / work packages with category and estimated effort
- Roles & responsibilities with source (internal/external)
- Key milestones as a checklist
- Project risks with impact and mitigation strategy

## Stage 2 - Kanban Board

A standalone interactive Kanban Board web application (HTML/CSS/JS) pre-populated with the tasks and roles from the Project Parameters document. Key features:

- Five standard columns: Backlog, To Do, In Progress, Review, Done
- Drag-and-drop cards between columns with client-side persistence via localStorage
- Card detail modal for editing title, description, role, category, effort, priority, and due date
- Add, export (.json), import, and reset board functionality
- Cards colour-coded by category with column card counts

## Stage 3 - Project Dashboard

A standalone HTML analytics dashboard that imports the Kanban board's exported .json file and visualises:

- Task distribution by category (pie/donut chart)
- Progress across columns (stacked bar)
- Effort breakdown by role
- Risk heat map from the risk log
- Milestone timeline