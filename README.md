# coxit-skills

Collection of SKILL files we find helpful at Coxit for engineering, HR, recruitment, and other departments.

## Repository structure

- `company-wide/` — skills for the whole company
- `c-level/` — skills for leadership
- `hr/` — skills for HR
- `recruitment/` — skills for recruitment
- `engineering/` — skills for engineering
- `sales/` — skills for sales

## How to add or modify a skill

1. Pick the appropriate top-level directory for your skill's audience.
2. Create a new folder named after the skill (kebab-case).
3. Add a `SKILL.md` file describing the skill, its inputs, outputs, and usage.
4. Include any supporting files (templates, rubrics, reference docs) in the same folder.
5. Open a pull request — see [CONTRIBUTING.md](CONTRIBUTING.md) for the review process.

## New to GitHub? Step-by-step guide

If you've never opened a pull request before, don't worry — the whole process can be done in your browser, no terminal required.

### What is a pull request?

A **pull request** (PR) is how you propose changes to this repository. You don't edit files directly on `main` — instead, you make your changes on a separate copy called a **branch**, then ask teammates to review and merge it.

### Step 1 — Create a branch

A branch is a safe workspace for your changes. Always create a new branch before editing; never commit directly to `main`.

**In the GitHub website:**

1. Go to the [repository homepage](https://github.com/COXIT-CO/coxit-skills).
2. Click the branch dropdown near the top-left (it says `main`).
3. Type a new branch name (see naming rules below) and click **Create branch: `<your-name>` from `main`**.

**Branch naming rules:**

Use this format: `<type>/<short-description>`

- `type` is one of:
  - `add/` — adding a new skill
  - `update/` — improving or refining an existing skill
  - `fix/` — fixing a typo, broken link, or error
  - `docs/` — changes to README, CONTRIBUTING, or other docs
- `short-description` is kebab-case (lowercase words joined by dashes), under ~40 characters.

Examples:

- `add/sales-discovery-call` — you're adding a new sales skill
- `update/code-review` — you're refining the existing code-review skill
- `fix/onboarding-typo` — fixing a typo in onboarding
- `docs/contributing-clarify-review` — improving CONTRIBUTING.md

### Step 2 — Make your changes

On your new branch, use the GitHub web UI to:

- **Add a file:** click **Add file → Create new file**, type the path (e.g. `hr/new-skill/SKILL.md`), paste the content, scroll down and click **Commit changes**. A commit is a saved snapshot of your edit.
- **Edit a file:** open the file, click the pencil icon (✏️) in the top-right, make your edits, scroll down, and click **Commit changes**.

Write a short commit message describing what you changed (e.g. `Add discovery-call skill for sales team`).

### Step 3 — Open the pull request

1. Go to the **Pull requests** tab at the top of the repo.
2. Click **New pull request**.
3. Set **base: `main`** and **compare: `<your-branch>`**.
4. Click **Create pull request**.
5. Fill in a clear title and description — explain *what* the skill does and *why* you're adding it.
6. Click **Create pull request** to submit.

### Step 4 — Get it reviewed and merged

- GitHub automatically requests review from the code owners for the directory you changed (see [.github/CODEOWNERS](.github/CODEOWNERS)).
- Reviewers may leave comments asking for changes — reply to them, edit the files on your branch, and commit again. The PR updates automatically.
- Once you have at least one approval and CI is green (the checks at the bottom of the PR), a maintainer will merge it.
- After merging, delete your branch (GitHub shows a **Delete branch** button).

### Still stuck?

- GitHub's own walkthrough: [Creating a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)
- Ask in the team Slack — someone will happily pair with you on your first PR.

## Conventions

- Folder names: kebab-case (e.g. `meeting-notes`, `bug-report-triage`).
- Every skill folder must contain a `SKILL.md`.
- Keep skills focused — prefer a new skill over a 500-line SKILL.md.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for the full guide. Key rules:

- **One skill per PR** when possible.
- **Issue first, PR later** only when you want someone else to build the skill or the scope needs discussion — otherwise open a PR directly.
- **CI must pass** (`.github/workflows/validate-skills.yml`).
- **Review:** at least one approval from a code owner for the relevant directory (see [`.github/CODEOWNERS`](.github/CODEOWNERS)). Company-wide changes need a repository maintainer.
- **Refining a starter skill?** Delete the `AI-GENERATED STARTER SKILL` comment once you've applied real team conventions. Check status with `./scripts/skill-status.sh`.
- **Merging:** squash merges preferred; delete the branch after merge.
