---
name: pr-description
description: Draft a pull request description with summary, context, checklist, and demo sections.
---


# PR Description

Produces a pull request description that lets a reviewer answer *what changed* and *what to verify* without opening the diff. Works for Python, JavaScript/TypeScript, and React projects.

## When to use

- Any new PR on a Coxit repo.
- When updating a PR description after substantive changes (new scope, new caveat, added screenshots).

## Output structure

Produce the description as Markdown with these sections, in order. Use the headings verbatim.

### What does it do?

One short paragraph (2–5 sentences). State the user-visible change first, then the implementation approach. Write so someone who hasn't read the diff can understand the intent.

- Lead with the outcome, not the mechanism (*"Uploads to S3 now retry on transient 5xx"* beats *"Added a retry decorator to `upload`"*).
- Reference the linked issue if one exists (`Closes #123`).

### What else do you need to know?

Anything that isn't obvious from the code: trade-offs considered, migrations required, feature flags, follow-up work, known gaps. Omit this section entirely if there's genuinely nothing — don't pad it.

### Checklist

Include the checklist and tick the boxes the PR satisfies. Keep only the lines that apply to the project's stack; drop the rest.

- [ ] Base branch is set to `main`
- [ ] Opened as a draft PR first; converted to ready-for-review only after self-review and green CI
- [ ] Pull request is prepared: assignee added, reviewers added, linked to issue
- [ ] Version is bumped if the project uses versioning
  - Python: `uvx bump-my-version bump patch/minor/major`
  - JS/TS: `npm version patch/minor/major` (or `pnpm version`, `yarn version`)
- [ ] PR is not very big (about 200–400 lines of change ideally)
- [ ] Adds or updates tests (`pytest`, `vitest`, `jest`, etc.)
- [ ] Tested manually (include steps in *What else do you need to know?* if non-obvious)
- [ ] Type check passes
  - Python: `uv run mypy`
  - TypeScript: `tsc --noEmit` or the project's `typecheck` script
- [ ] Linter / formatter passes
  - Python: `ruff check` / `ruff format`
  - JS/TS/React: `eslint` / `prettier`
- [ ] Any required documentation updates done (`README.md`, `CLAUDE.md`, `docs/`)
- [ ] Follows the project's style guide (Python: [pyguide](https://google.github.io/styleguide/pyguide.html); JS/TS: project ESLint config or team convention)
- [ ] New environment variables added to deployment config (Railway, Vercel, etc.) and `.env.example` (if any introduced)
- [ ] For React / UI changes: verified in a browser across the primary breakpoints the component targets

### Demo screenshots or video/animation, if any

- Include for any user-visible change (UI, output format, new CLI behavior). **Required** for React/UI PRs.
- Omit the section entirely if the change has no visible surface (pure refactor, internal API).

## Guidance

- **Always open as a draft first.** Create the PR with `gh pr create --draft` (or the "Create draft pull request" option in the UI). Self-review the diff, wait for CI, then mark it ready. This avoids pinging reviewers on a PR that's still cooking.
- **Be honest on the checklist.** Don't tick *Tested manually* if you haven't. An unchecked box is a signal to the reviewer, not a failure.
- **Size flag.** If the PR is over ~400 lines of real change, either split it or explicitly justify the size in *What else do you need to know?*
- **Adapt to the stack.** Don't leave Python-specific items in a JS PR (or vice versa) — drop lines that don't apply to keep the checklist meaningful.

## Checklist before posting

- Title summarizes the change in under ~70 characters.
- *What does it do?* stands alone without the diff.
- Linked issue is referenced (`Closes #N`) when one exists.
- Screenshots included for any UI change.
- Checklist items left in the description all apply to this PR's stack.
