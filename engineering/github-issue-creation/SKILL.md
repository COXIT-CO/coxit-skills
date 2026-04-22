---
name: github-issue-creation
description: Draft and open well-scoped GitHub issues with a clear title, context, and acceptance criteria.
---

<!--
AI-GENERATED STARTER SKILL
This file was drafted by AI as a first pass. It is meant to be a starting point —
replace the placeholder sections with concrete, team- or project-specific
instructions once the real use cases and conventions are known, then delete
this comment.
-->

# GitHub Issue Creation

Turns a rough request into a GitHub issue that a teammate can pick up without follow-up questions.

## When to use an issue (vs. a PR)

- **Use an issue** when you want to request a skill someone else will build, kick off a discussion, or surface a bug/idea you don't plan to resolve yourself.
- **Skip the issue and open a PR** when you already have the skill drafted and ready for review — there's no need to file an issue just to link it back.

If the work is already done, prefer a PR. Issues exist to coordinate work that isn't yet in flight.

## Usage

Provide a short description of the problem or feature. The skill drafts the issue and opens it via `gh issue create` once the user approves the draft.

## Output

- **Title** — imperative, under 70 characters
- **Context** — what's happening today and why it matters
- **Proposed change** — what should be done (keep open to alternatives)
- **Acceptance criteria** — bulleted, verifiable
- **Labels / assignees** — suggested based on repo conventions

## Checklist before opening

- Title is specific (not "fix bug" or "update docs")
- Context explains the "why", not just the "what"
- Acceptance criteria are testable
- Links to related issues, PRs, or docs are included
- Correct repo and labels are selected
