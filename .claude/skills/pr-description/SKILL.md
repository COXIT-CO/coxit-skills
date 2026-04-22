---
name: pr-description
description: Draft a PR description for the coxit-skills repo — change summary, why, and refinement-status signal.
---

# PR Description (coxit-skills)

Drafts a PR description suited to this repo's one-skill-per-PR workflow. Canonical rules: `CONTRIBUTING.md`.

## Title

Imperative, under ~70 characters. Name the affected skill or doc.

Examples:
- `Add sales/discovery-call skill`
- `Refine engineering/code-review with real conventions`
- `Fix broken link in CONTRIBUTING.md`

## Body

### Summary (required)

2–4 sentences: what this PR changes and why. Don't restate the skill's contents — the `SKILL.md` is the source of truth; the description explains the *change*.

### Refinement status (if adding or modifying a `SKILL.md`)

State explicitly:
- **New skill, starter** — still carries the `AI-GENERATED STARTER SKILL` marker.
- **Refined** — marker removed; content reflects how the team actually works.

This tells reviewers how strictly to judge the content. If you removed the marker, call it out so the reviewer knows to apply the stricter bar.

### Notes for reviewers (optional)

Only when useful: deliberately out-of-scope items, dependencies on other PRs, external context that isn't in the diff.

### Linked issue (if any)

`Closes #N` — only when the PR resolves an existing issue. Per `CONTRIBUTING.md`, most PRs land without an issue.

## Rules

- **One skill per PR.** If the diff touches multiple skills, either split or justify it in the summary.
- **CI must pass** (`validate-skills` workflow). Before pushing, check the frontmatter starts with `---` and has both `name:` and `description:`.
- **Code owner auto-request.** Reviewers come from `.github/CODEOWNERS` based on which directory you changed.
