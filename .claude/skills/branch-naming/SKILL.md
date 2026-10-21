---
name: branch-naming
description: Pick a branch name for the coxit-skills repo following the `<type>/<kebab-description>` convention.
---

# Branch Naming (coxit-skills)

Names branches in `coxit-skills` so the type of change is obvious from the branch alone. The canonical rules live in `README.md` under *Branch naming rules*.

## Format

`<type>/<short-description>`

## Types

- `add/` — new skill
- `update/` — refining or improving an existing skill
- `fix/` — typo, broken link, or error
- `docs/` — README, CONTRIBUTING, or other docs

## Short description

- kebab-case (lowercase, dash-separated)
- under ~40 characters
- names the specific target — prefer the skill folder name when touching one skill

## Examples

- `add/sales-discovery-call`
- `update/code-review`
- `fix/onboarding-typo`
- `docs/contributing-clarify-review`

## Rules

- Always branch from `main`. Never commit directly to `main`.
- One type prefix — don't combine (`add-and-fix/...`).
- If the PR ends up touching multiple skills, revisit whether it should be split (see the `pr-description` skill).
