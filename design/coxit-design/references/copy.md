# UI copy: no slop

The fastest way to spot an AI-generated UI is the text. Too much of it, too vague, too excited. Users scan, and every extra line hides the line that matters.

## The test

For every string on screen, ask: **if I delete this, does the user lose something they need?** If not, delete it. Then do the pass again; the second pass always finds more.

## Rules

1. **Headings name the thing.** `Takeoff results`, `Sheets`, `Export`. Not `Your AI-Powered Takeoff Results Are Ready!`
2. **No subtitles by default.** A subtitle must carry real information (`37 sheets · uploaded 7 Oct by Ihor`). Never a restatement of the heading or a marketing line.
3. **Labels are nouns, buttons are verb + object.** `Project name` / `Create project`.
4. **No helper text that repeats the label.** `Email` + "Enter your email address" → just `Email`. Helper text is for constraints the user can't guess (`PDF or DWG, up to 200 MB`).
5. **Placeholders show format, not instructions.** `A-301` not `Enter sheet number here…`
6. **Numbers over adjectives.** `142 cabinets on 12 sheets` beats `Comprehensive cabinet detection`.
7. **Specific errors.** What happened + what to do. No "Oops!", no "Something went wrong".
8. **Sentence case.** `Run takeoff`, not `Run Takeoff`.
9. **No exclamation marks, no emoji, no ✨, no "magic".**
10. **Use the user's vocabulary.** Estimators say takeoff, sheet, elevation, plan, LF, SF, count, scope. Analysts say coverage, rating, price target. Use their words, not ours (no "inference", "pipeline", "embeddings" in client-facing UI).
11. **Don't talk about the AI.** The user cares about the result. `Detected 142 cabinets`, not `Our advanced AI model has intelligently detected…`
12. **Don't explain the obvious.** No tooltip on "Download". No info icon next to "Name".
13. **Confirmations name the object and the consequence.** `Delete "Stevens Lot 4"? Its 3 takeoffs will be deleted too.` Buttons: `Delete project` / `Cancel`.
14. **Empty states: one line + one button.** `No drawings yet.` [Upload drawings]

## Banned words and phrases

seamless(ly), effortless(ly), unlock, empower, leverage, supercharge, revolutionize, transform your workflow, cutting-edge, state-of-the-art, next-generation, robust, powerful, intelligent insights, actionable insights, smart (as marketing), magic, AI-powered (inside the product), one-stop, all-in-one, at your fingertips, take it to the next level, game-changer, harness, elevate, streamline (usually), dive in, let's get started, welcome back, you're all set, oops, uh-oh, hang tight, sit back and relax.

## Before → after

| Slop | Fixed |
|---|---|
| **Welcome to TakeoffAI ✨** / Your intelligent partner for effortless estimating | **Projects** |
| Upload Your Drawings / Drag and drop your architectural drawings here or click to browse your files. We support a wide variety of formats! | **Drop PDFs here** or [Browse] · PDF up to 200 MB |
| 🚀 Get Started | Upload drawings |
| AI Analysis in Progress… Our advanced model is carefully analyzing your drawings. This may take a few moments! | Detecting cabinets · sheet 14 of 37 |
| Oops! Something went wrong. Please try again later. | Couldn't read A-301.pdf (password-protected). Upload an unlocked copy. |
| Powerful Insights at Your Fingertips / Explore comprehensive analytics about your takeoff results | (delete the section, or just show the table) |
| Confidence Score: 0.87342 | High · or a "Check" flag on rows that need review |
| Are you sure? This action cannot be undone. | Delete "Lot 4"? Its 3 takeoffs will be deleted too. |
| Item Name / Enter the name of the item | Item |
| You have no projects yet! Create your first project to get started on your estimating journey. | No projects yet. [New project] |

## Length guide

- Page title: 1–3 words.
- Button: 1–3 words.
- Error: 1 sentence, 2 max.
- Empty state: 1 line.
- Tooltip: only if needed; < 10 words.
- Section intro paragraph: only in documents/reports, never in app screens.
