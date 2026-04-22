# Engineering skills

Skills aimed at engineers: code review, bug triage, architecture docs, client docs, GitHub issue creation, and more.

See the [repository README](../README.md) for the general "How to use a skill" guide covering Claude.ai and Claude Code.

## Two ways to adopt an engineering skill

Engineers have two Claude Code setups to choose from. Pick based on whether the skill is a **personal habit** or a **team standard**.

### Personal — `~/.claude/skills/`

Use this when the skill reflects your own preferences and you don't need teammates to share it.

```bash
git clone https://github.com/COXIT-CO/coxit-skills.git
ln -s "$(pwd)/coxit-skills/engineering/code-review" ~/.claude/skills/code-review
```

The skill is now available (as `/code-review`) in every Claude Code session you run, across every repo.

### Team standard — commit to your project's `.claude/skills/`

**This is the recommended path for anything that encodes how the team works** — the code review bar, the PR description template, the bug triage checklist, the architecture doc format. Put it in the repo where the work happens:

1. In your project repo, create `.claude/skills/<skill-name>/`.
2. Copy `SKILL.md` (and any supporting files) from this repo into it.
3. Commit and push it alongside the code it applies to.

Why this over the personal path:

- **Automatic adoption.** Every engineer who runs Claude Code in that repo gets the skill with zero personal setup.
- **Versioned with the code.** When the convention changes, the skill update ships in the same PR — no drift between "what the skill says" and "what the code expects."
- **Reviewable.** Changes to the team standard go through the same PR review as any other code change.

### When to use which

| Situation | Use |
|---|---|
| *"I always want Claude to pair-review my code this way"* | Personal (`~/.claude/skills/`) |
| *"Every PR in this repo should be reviewed against our checklist"* | Team (`<repo>/.claude/skills/`) |
| *"Our architecture docs all follow this structure"* | Team |
| *"I have a personal bug-triage style I like"* | Personal |

If in doubt, prefer the team path — it's easier to promote a personal skill to the team later than to retrofit one back into every engineer's setup.

## Refining skills

Most skills here are AI-generated starter drafts. If you copy one into a project repo and tailor it to real team conventions, please **also open a PR back to this repo** so the upstream version improves. Delete the `AI-GENERATED STARTER SKILL` comment once you've applied real conventions — see the [root CONTRIBUTING guide](../CONTRIBUTING.md).
