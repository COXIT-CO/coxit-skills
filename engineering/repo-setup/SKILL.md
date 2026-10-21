---
name: repo-setup
description: Set up a GitHub repo with the standard branch workflow — squash and merge only, auto-delete merged branches, a protected `dev` branch as default, and `main` that only accepts PRs from `dev`. Use when the user asks to set up a new repo, configure branch protection, add a dev branch, or "apply our repo rules" to a repository.
---

# Repo setup

Applies Coxit's standard GitHub branch workflow to a repository:

1. **Squash and merge only** (merge commits and rebase disabled), so it is the default
   for PRs into `dev` and `main`; the squash commit uses the PR title and description.
   GitHub merge methods are repo-wide and there is no "default" setting — allowing
   only squash is how to make it the default.
2. **Auto-delete head branches** after a PR is merged.
3. **`dev` branch** created from `main` and made the **default branch**.
4. **Same branch protection on `main` and `dev`**:
   - PR required, 1 approving review
   - stale approvals dismissed on new commits
   - approval required after the last push
   - all conversations resolved before merge
   - linear history
   - no force pushes, no deletions
   - admins not enforced (they can bypass)
5. **`main` only accepts PRs from `dev`** — via the `require-dev-source` CI check
   (`main-source-branch.yml`) set as a required status check on `main`.
   GitHub has no native "allowed source branch" setting, so a check is the way.

## Usage

Requires the `gh` CLI authenticated with admin rights on the target repo, and `jq`.

Paths below (`scripts/`, `templates/`) are relative to this skill's folder.

### 1. Confirm the target

Confirm the repo with the user first (`gh repo view --json nameWithOwner`) — these
are outward-facing changes to repo settings.

### 2. Repo settings, `dev` branch, protection

Run the script from inside the repo (or pass `owner/repo`):

```bash
bash scripts/setup.sh [owner/repo]
```

It is idempotent: it skips creating `dev` if it already exists and re-applies
protection with PUT. It prints the resulting protection for both branches and lists
open PRs into `main`.

### 3. Add the source-branch check workflow

The required check only runs once its workflow file is on `main`. Until then,
**no PR can merge into `main`** (the required check never reports). So:

1. Create a branch from `origin/dev`, e.g. `chore/main-only-from-dev`.
2. Copy `templates/main-source-branch.yml` to `.github/workflows/main-source-branch.yml`.
3. Commit, push, and open a PR into `dev`.
4. Tell the user: after merging it into `dev`, open a `dev` → `main` PR to bring the
   workflow to `main`. That PR runs the check itself and passes.

If the repo already has a `main-source-branch.yml`, skip this step.

### 4. Report

Tell the user what was applied, and point out:
- open PRs targeting `main` from other branches are now blocked — offer to retarget
  them to `dev` (`gh pr edit <n> --base dev`).
- admins can still bypass protection; offer `enforce_admins` if they want it strict.
- local cleanup: `git fetch --prune` (or `git config --global fetch.prune true`).

## Examples

- *"Set up this repo with our branch rules"* → run all steps on the current repo.
- *"Add a dev branch and make it default"* → run the script; it also applies protection
  and the `main` source check, so say so before running.
- *"Apply the same protection from main to dev"* → the script sets both to the standard
  above; if the repo's `main` has custom rules, read them first
  (`gh api repos/<owner>/<repo>/branches/main/protection`) and confirm with the user
  before overwriting.

## Gotchas

- `PATCH .../protection/required_status_checks` returns 404 "Required status checks
  not enabled" when the branch has none yet — the script uses `PUT .../protection`
  with the full body instead.
- `app_id: 15368` is GitHub Actions; pinning it stops other apps from spoofing the check.
- Branch protection on **private** repos requires a paid plan (Pro/Team/Enterprise);
  on the free plan the API returns 403 — tell the user rather than retrying.
- Changing the default branch doesn't retarget existing PRs.
- Squash-only means `dev` → `main` PRs are squashed too, so `main` gets one commit per
  release and the merge base of `dev` and `main` never moves: later `dev` → `main` PRs
  also list already-released commits and changes. Expected with this setup.
