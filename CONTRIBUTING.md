# Contributing

Guide for proposing, reviewing, and merging skills in this repository.

## Proposing a new skill

You have two paths depending on where you are:

- **Skill already drafted?** Open a PR directly — no issue required. See "Opening a pull request" below.
- **Want to request a skill or start a discussion?** Open an issue using the `new-skill-request` template to describe the skill and its intended audience. A maintainer will label it and confirm the target directory.

Use issues when you want someone else to build the skill, or when the scope/audience isn't clear and needs discussion before anyone invests in a draft.

## Opening a pull request

- One skill per PR when possible.
- If the PR resolves an existing issue, reference it in the description. No issue is required for PRs that land a ready-to-review skill.
- Ensure the `SKILL.md` follows the expected format (name, description, usage, examples).
- CI must pass — see `.github/workflows/validate-skills.yml`.

## Review process

- Code owners defined in `.github/CODEOWNERS` are auto-requested for review.
- Each PR needs at least one approval from a code owner for the relevant directory.
- Wider company-wide changes (README, CONTRIBUTING, shared tooling) require approval from a repository maintainer.

## Skill refinement status

Every skill in this repo is seeded from an AI-generated first pass and carries an `AI-GENERATED STARTER SKILL` HTML comment between its frontmatter and first heading. When you refine a skill with real team conventions, **delete that comment** — its absence is how we tell a refined skill from an untouched starter.

To see the current status:

```bash
./scripts/skill-status.sh
```

The same report is posted to the Actions step summary on every PR and push to `main` via `.github/workflows/validate-skills.yml`.

## Merging

- Squash merges preferred — keep the commit message descriptive.
- Delete the branch after merge.
