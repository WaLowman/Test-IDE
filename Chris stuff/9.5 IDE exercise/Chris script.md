
# Exercise setup

**File structure**

* `README.md` (created by users)
* `source_manual.pdf` (provided by trainer)
* `summary.md` (created by users)
* `faq.md` (created by users)

**Assumption**

The folder is already open in VS Code, Git is installed, and the repo has already been published to GitHub earlier in the course. VS Code’s Source Control view supports staging, commits, diffs, branch management, and sync. The **Timeline** view appears at the bottom of the Explorer when a file is selected, and shows Git commit history plus local file save history. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/overview?utm_source=chatgpt.com "Source Control in VS Code"))

---

## 1. Build visible history

**Lesson to be learned**
Small, clear commits create a reliable history you can inspect, trust, and return to later. VS Code is designed to help you review file changes and create focused commits, including staged commits when only some changes are ready. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/staging-commits?utm_source=chatgpt.com "Staging and committing changes - Visual Studio Code"))

**Detailed instructions**

1. In the left Activity Bar, click  **Explorer** .
2. In the folder root, create `README.md`, `summary.md`, and `faq.md` if they do not already exist.
3. Confirm the folder now contains:
   * `README.md`
   * `source_manual.pdf`
   * `summary.md`
   * `faq.md`
4. Click the **Source Control** icon in the Activity Bar. It looks like a branching graph.
5. If prompted to initialize Git, do so. If Git is already active, you will see pending changes listed there. VS Code’s Source Control view is the main place to inspect, stage, and commit changes. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/quickstart?utm_source=chatgpt.com "Quickstart: use source control in VS Code"))

Now make  **six commits** , one at a time:

### Commit 1: create `README.md`

* Add a title and 3 to 5 lines describing the folder and its purpose.
* Save the file.
* Go to  **Source Control** .
* Hover over `README.md` and click the **Open Changes** icon to view the diff.
* In the commit message box, enter: `Create README`
* Click  **Commit** .

### Commit 2: create `summary.md`

* Use your AI tool in VS Code to read `source_manual.pdf` and draft a clean summary into `summary.md`.
* Save it.
* In  **Source Control** , open the diff for `summary.md`.
* Commit with: `Add manual summary`

### Commit 3: improve `summary.md`

* Ask the AI to improve structure only: headings, bullets, spacing.
* Save.
* Review the diff again.
* Commit with: `Improve summary formatting`

### Commit 4: create `faq.md`

* Ask the AI to draft 5 FAQs based on the PDF.
* Save.
* Review the diff.
* Commit with: `Create FAQ`

### Commit 5: revise `faq.md`

* Ask the AI to improve clarity and shorten the answers.
* Save.
* Review the diff.
* Commit with: `Refine FAQ`

### Commit 6: update `README.md`

* Add a short note describing the two generated outputs:
  * `summary.md`
  * `faq.md`
* Save.
* Review the diff.
* Commit with: `Update README with outputs`

After each commit, click **Sync Changes** if it appears in the blue status bar at the bottom left, or in Source Control. VS Code’s sync workflow handles pull and push together when the repo has a remote. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/repos-remotes?utm_source=chatgpt.com "Working with repositories and remotes - Visual Studio Code"))

---

## 2. See history clearly before changing anything

**Lesson to be learned**
Git becomes trustworthy when users can actually see history. In VS Code, that means using the commit history and the file Timeline, not guessing. The Source Control Graph shows commit history and branch relationships, while the Timeline shows history for an individual file. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/repos-remotes?utm_source=chatgpt.com "Working with repositories and remotes - Visual Studio Code"))

**Detailed instructions**

### To find the Timeline for a file

1. Click **Explorer** in the Activity Bar.
2. Single-click one file, for example `faq.md`.
3. Look at the  **bottom of the Explorer panel** .
4. Find the section called  **Timeline** .
5. If you do not see it:
   * click the **...** menu at the top right of the Explorer panel
   * make sure **Timeline** is enabled or visible
   * then select the file again
     The VS Code UI docs state that the Timeline view is accessible at the bottom of File Explorer and shows file history events such as Git commits and local saves. ([Visual Studio Code](https://code.visualstudio.com/docs/getstarted/userinterface?utm_source=chatgpt.com "User interface - Visual Studio Code"))

### What to do in Timeline

1. Expand the entries under Timeline.
2. Click different history items for the selected file.
3. Open older versions to compare how the file looked at different points.
4. Note that the Timeline can show both:
   * Git commit history for that file
   * local file save history
     This is the closest built-in VS Code equivalent to the “slider” feeling you described from Replit, except it is click-based rather than a draggable bar. ([Visual Studio Code](https://code.visualstudio.com/docs/getstarted/userinterface?utm_source=chatgpt.com "User interface - Visual Studio Code"))

---

## 3. Roll the whole project back by two steps

**Lesson to be learned**
You can safely return the entire project to an earlier good state. This is the “Git has my back” moment at project level. VS Code exposes history and branch state visually, including commit history and sync status. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/repos-remotes?utm_source=chatgpt.com "Working with repositories and remotes - Visual Studio Code"))

**Detailed instructions**

1. Open  **Source Control** .
2. Open the **Source Control Graph** if it is visible in your Source Control area. This graph shows commit history and branch relationships. If it is collapsed, expand it. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/repos-remotes?utm_source=chatgpt.com "Working with repositories and remotes - Visual Studio Code"))
3. Identify the commit list and locate the point after  **Commit 4** , which in this exercise is `Create FAQ`.
4. Tell the AI in plain English something like:
   `Move the repository back to the state of the Create FAQ commit, keeping history understandable.`
5. Let the AI guide or perform the needed Git action.
6. After the rollback, inspect the files:
   * `faq.md` should still exist
   * later changes from commits 5 and 6 should no longer be present
7. Open **Source Control** and confirm the working tree is clean or shows the expected state.
8. Sync only if you want the remote to match this training state.

For training purposes, the important thing is not the exact Git command, but that users learn to identify the target point in history and move the project back calmly and deliberately. VS Code is built to support reviewing history and diffs before and after such changes. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/repos-remotes?utm_source=chatgpt.com "Working with repositories and remotes - Visual Studio Code"))

---

## 4. Roll back one file only by three steps

**Lesson to be learned**
Recovery is not all-or-nothing. You can restore a single file without disturbing the rest of the repo. The Timeline view is the key business-user feature here because it makes file history visible and restorable. ([Visual Studio Code](https://code.visualstudio.com/docs/getstarted/userinterface?utm_source=chatgpt.com "User interface - Visual Studio Code"))

**Detailed instructions**

Goal: move **only** `faq.md` back by three commits.

1. In  **Explorer** , click `faq.md`.
2. In the **Timeline** section at the bottom of Explorer, review the history entries for `faq.md`.
3. Click older entries one by one and compare them until you find the version from roughly three commits earlier.
4. Open that older entry and compare it with the current file.
5. When you are sure it is the right version, restore it, or ask the AI in plain English:
   `Restore faq.md only to the version from three commits ago. Do not change any other file.`
6. Save if needed.
7. Go to  **Source Control** .
8. Confirm that only `faq.md` appears as changed.
9. Open the diff and make sure the content has moved back as intended.
10. Commit with: `Restore FAQ to earlier version`

This section is especially valuable because it proves that a document can be rewound independently. That makes Git feel much safer and more practical for business content, not just code. VS Code’s Timeline is explicitly designed to show history for the selected file. ([Visual Studio Code](https://code.visualstudio.com/docs/getstarted/userinterface?utm_source=chatgpt.com "User interface - Visual Studio Code"))

---

## 5. Create a safe side path with a branch

**Lesson to be learned**
A branch is a safe alternate draft. For business users, it is best understood as a protected side route for trying a rewrite without disturbing the main version. VS Code shows the current branch in the status bar and supports creating and switching branches directly in the UI. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/branches-worktrees?utm_source=chatgpt.com "Git Branches and Worktrees in VS Code"))

**Detailed instructions**

1. Look at the **bottom left status bar** in VS Code.
2. Find the current branch name, often `main` or `master`.
3. Click the branch name.
4. Choose  **Create new branch** .
5. Name it: `alt-faq-draft`
6. Confirm that VS Code switches you onto that branch. The status bar branch name should now show `alt-faq-draft`. VS Code documents branch switching and creation through the status bar and Source Control interfaces. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/branches-worktrees?utm_source=chatgpt.com "Git Branches and Worktrees in VS Code"))

Now do a risky experiment:

7. Ask the AI to rewrite `faq.md` in a much more executive or concise tone.
8. Save the file.
9. Review the diff in  **Source Control** .
10. Commit with: `Try alternate FAQ draft`

Now compare the mindset:

* `main` is the trusted version
* `alt-faq-draft` is a safe experiment

11. Click the branch name in the status bar again.
12. Switch back to `main`.
13. Confirm the original `faq.md` returns.

This is the business-friendly meaning of branching: explore without risking the official working version. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/branches-worktrees?utm_source=chatgpt.com "Git Branches and Worktrees in VS Code"))

---

## 6. Experience a sync failure and recover in the IDE

**Lesson to be learned**
Sync problems look intimidating, but they are manageable. VS Code provides visual conflict tools, including conflict indicators and a 3-way Merge Editor, so users do not need to decode raw Git output alone. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/merge-conflicts?utm_source=chatgpt.com "Resolve merge conflicts in VS Code"))

**Detailed instructions**

This section works best if the trainer creates the remote conflict.

### Trainer setup

* While learners are on `main`, the trainer updates `README.md` on GitHub directly, or from another clone, and pushes that change.
* Learners then also change `README.md` locally and commit it.

### Learner steps

1. On `main`, edit `README.md`.
2. Add one line, for example:
   `This repository contains AI-generated summary and FAQ outputs.`
3. Save and commit with: `Add README note`
4. Click  **Sync Changes** .

Because the remote also changed, the sync may fail or pull in a merge conflict. VS Code’s remotes workflow includes incoming and outgoing commits, and its merge tools are designed for this exact situation. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/repos-remotes?utm_source=chatgpt.com "Working with repositories and remotes - Visual Studio Code"))

### What to do when conflict appears

1. Open  **Source Control** .
2. Look for a section showing **Merge Changes** or conflicted files.
3. Click the conflicted file, likely `README.md`.
4. VS Code may open:
   * inline conflict markers in the editor, or
   * the  **Merge Editor** , which is the preferred 3-way interface
     VS Code supports both inline conflict resolution and a dedicated 3-way Merge Editor. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/merge-conflicts?utm_source=chatgpt.com "Resolve merge conflicts in VS Code"))

### If Merge Editor opens

You will typically see:

* one side for your local changes
* one side for incoming changes
* one result pane for the merged file

Now tell the AI in plain English something like:

* `Keep both changes, but make the wording concise and clean.`
* `Merge these two README edits into one final paragraph.`
* `Preserve the remote change and add my local sentence underneath.`

Then:

5. Review the merged result carefully.
6. Save the merged file.
7. Return to  **Source Control** .
8. Stage the resolved file if required.
9. Commit the merge if VS Code requests it.
10. Click **Sync Changes** again.

The point here is not to memorize merge mechanics. It is to prove that even ugly-looking sync failures can be resolved calmly inside VS Code, with AI help and visual tools. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/merge-conflicts?utm_source=chatgpt.com "Resolve merge conflicts in VS Code"))

---

## 7. Add one selective commit

**Lesson to be learned**
Not every AI change should go in together. Users should feel comfortable committing only the approved part of a larger change. VS Code supports granular staging so users can create focused commits. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/staging-commits?utm_source=chatgpt.com "Staging and committing changes - Visual Studio Code"))

**Detailed instructions**

1. Ask the AI to update both `summary.md` and `faq.md`.
2. Save both files.
3. Open  **Source Control** .
4. Review both diffs separately.
5. Decide that only `summary.md` is ready.
6. Hover over `summary.md` and click the **+** icon to stage it.
7. Leave `faq.md` unstaged.
8. Enter commit message: `Update summary only`
9. Commit.

This teaches a very practical control habit: AI can produce multiple edits, but the user chooses what becomes official. VS Code’s staging model is built exactly for this. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/staging-commits?utm_source=chatgpt.com "Staging and committing changes - Visual Studio Code"))

---

## 8. End-state message for the learners

**Lesson to be learned**
Git is not just for developers. In VS Code, it gives business users a visible history, a way back from mistakes, safe experimentation, controlled syncing, and confidence that AI-assisted file work is checkable and durable over time. The key UI elements are Source Control, the Source Control Graph, the status bar branch picker, diff views, the Timeline, and the Merge Editor. ([Visual Studio Code](https://code.visualstudio.com/docs/sourcecontrol/overview?utm_source=chatgpt.com "Source Control in VS Code"))

## Very short trainer summary

* **6 commits** : build trust in history
* **roll back 2 commits** : recover the whole repo
* **roll back 1 file by 3 steps** : recover precisely
* **branch** : try a risky rewrite safely
* **sync failure** : survive conflict calmly
* **selective commit** : approve only what is ready
