---
name: pr-description
description: Draft a PR description for the coxit-skills repo — change summary, why, and refinement-status signal.
---

# PR Description (coxit-skills)

Drafts a PR description suited to this repo's one-skill-per-PR workflow. Canonical rules: `CONTRIBUTING.md`.

## Template

Fill in `.github/pull_request_template.md`. GitHub prepopulates the PR body from it — keep the section headings and delete the HTML comments as you write. Sections, in order:

1. **Summary** — 2–4 sentences: what this PR changes and why. Don't restate the skill's contents; the `SKILL.md` is the source of truth, the description explains the *change*.
2. **Notes for reviewers** — optional: out-of-scope items, dependencies on other PRs, external context not in the diff.
3. **Linked issue** — `Closes #N` only when the PR resolves an existing issue. Per `CONTRIBUTING.md`, most PRs land without one.
4. **Testing** — tick the boxes that apply. *Manually tested* means you invoked the skill and confirmed the output matches expectations.

## Title

Imperative, under ~70 characters. Name the affected skill or doc.

Examples:
- `Add sales/discovery-call skill`
- `Refine engineering/code-review with real conventions`
- `Fix broken link in CONTRIBUTING.md`

## Rules

- **Always open as a draft first.** Use `gh pr create --draft` (or the "Create draft pull request" option in the UI). Mark it ready for review only after self-review and a green `validate-skills` run.
- **One skill per PR.** If the diff touches multiple skills, either split or justify it in the summary.
- **CI must pass** (`validate-skills` workflow). Before pushing, check the frontmatter starts with `---` and has both `name:` and `description:`.
- **Code owner auto-request.** Reviewers come from `.github/CODEOWNERS` based on which directory you changed.
