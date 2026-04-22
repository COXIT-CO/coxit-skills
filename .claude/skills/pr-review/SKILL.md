---
name: pr-review
description: Review a PR on the coxit-skills repo for skill validity, scope, and refinement-appropriate judgment.
---

# PR Review (coxit-skills)

Reviews PRs against the conventions in `CONTRIBUTING.md` and `README.md`. Intended primarily for code owners listed in `.github/CODEOWNERS`.

## Before commenting

1. **Check CI status.** Don't approve on a red `validate-skills` build.
2. **Check refinement status** — run `./scripts/skill-status.sh` or look at the Actions step summary to see whether the affected skill is *starter* or *refined*. This changes how strictly to judge the content.

## Judge by refinement status

- **Starter** (`AI-GENERATED STARTER SKILL` marker present): review for structural correctness — folder name kebab-case, frontmatter valid, content focused on one task, examples where useful. Don't block on team-specificity; that's what refinement is for.
- **Refined** (marker removed): review for fidelity to real team practice. Any content that doesn't match how the team actually works is a blocker. If the marker was removed but the content still reads as generic AI filler, ask the author to restore the marker or do the refinement.

## Structural checks

- One skill per PR, or clearly justified multi-skill scope.
- New skill lives in the correct department folder (`company-wide/`, `c-level/`, `hr/`, `recruitment/`, `engineering/`, `sales/`).
- Folder name is kebab-case.
- `SKILL.md` present and starts with `---` frontmatter containing both `name:` and `description:`.
- `name:` matches the folder name.
- `description:` is a single line, specific, and sets clear expectations for when the skill applies.

## Content checks

- SKILL.md is focused — if it sprawls past ~150 lines or covers unrelated ground, request a split.
- Instructions are concrete, not vague ("use a checklist" should *be* the checklist).
- Examples exist where they aid understanding.
- No broken internal links.

## Hygiene

- Branch name follows `<type>/<kebab-description>` (see `branch-naming` skill).
- PR title names the affected skill or doc.
- Description explains the *change*, not the skill's contents.
- Linked issue referenced if one exists.

## Approval rules

- At least one approval from a code owner of the affected directory (see `.github/CODEOWNERS`).
- Company-wide changes (README, CONTRIBUTING, shared tooling) need approval from a repository maintainer.
- Squash-merge preferred; the branch is deleted after merge.

## How to leave feedback

- Group comments by severity: blockers, suggestions, nits — label them so the author knows what must change vs. what's optional.
- Quote the specific line when commenting so the author doesn't have to hunt.
- If requesting changes, show what good looks like — link to another skill or doc where possible.
