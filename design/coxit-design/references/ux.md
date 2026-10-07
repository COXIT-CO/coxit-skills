# UX rules

Written for COXIT's actual work: B2B tools for estimators, manufacturers, analysts, often with an AI model in the middle, often shown as a demo to a buyer. Users are experts in their domain and in a hurry. They are not impressed by UI; they're impressed when the tool does their job.

## Contents
1. Structure and hierarchy
2. Actions
3. States
4. Forms
5. Tables and data
6. AI-specific UX
7. Demos specifically
8. Accessibility
9. Responsive

---

## 1. Structure and hierarchy

- **Start from the task, not the layout.** Write down the 3–5 steps the user takes. Screens follow the steps. Don't invent a dashboard nobody asked for.
- **Result-first.** The main area shows the thing the user came for (the takeoff, the report, the answer). Inputs and config go in a side panel, a header bar, or a previous step.
- **Three levels of hierarchy, max, per view:** page title → section/panel titles → content. If you need a fourth, split the page.
- **Left-aligned.** App UIs read from the top-left. Center only empty states on very large areas, and modals.
- **Navigation:** ≤ 5 top-level items, use a sidebar for apps with sections and a top bar for single-flow tools. Mark the current location clearly.
- **Progressive disclosure:** advanced settings, raw JSON, debug info, and model parameters stay collapsed or in a drawer. A demo for a buyer should never show a temperature slider.
- **Consistent placement:** primary action is always in the same spot (top-right of the page header, or bottom-right of a form/modal).

## 2. Actions

- **One primary action per view.** Orange. Everything else is secondary (outlined) or ghost.
- **Label = verb + object.** `Upload drawings`, `Run takeoff`, `Export to Excel`, `Approve 12 items`. The label says what will happen.
- **Destructive actions** are secondary/ghost styled in `--bad` text, ask for confirmation only if the action is irreversible, and say what will be lost (`Delete 3 projects and their takeoffs?`). Prefer undo over confirm.
- **Disabled buttons** need a reason nearby, unless it's obvious (e.g. empty required field next to it).
- **Feedback within 100ms** for every click: pressed state, spinner in the button, or optimistic update.

## 3. States

Design all of these for every view that loads data. AI-built UIs usually skip them, and that's what makes a demo feel fake.

- **Loading.** < 1s: nothing or a subtle spinner in place. 1–3s: skeletons in the shape of the real content. > 3s: real progress (step names or "page 4 of 37"), and let the user leave and come back. Long AI jobs: show stages (`Reading sheets → Detecting cabinets → Measuring`).
- **Empty (first use).** One line on what goes here, and the action that fills it. Optionally a sample-data link for demos.
- **Empty (no results).** Say what was searched/filtered and offer to clear it.
- **Error.** What happened, in plain words, and what to do: `Couldn't read A-301.pdf: the file is password-protected. Upload an unlocked copy.` Keep the user's input. Never show raw stack traces to buyers; put details behind "Show details".
- **Partial.** Some items succeeded, some failed: show both, and let the user retry only the failed ones.
- **Success.** Usually no toast needed: the new state of the UI *is* the confirmation. Toast only for background or off-screen results.

## 4. Forms

- Label above the input, always visible. Placeholder only for format examples (`e.g. 2026-10-07`), never as the label.
- Ask for the minimum. Every field costs. Prefill what you can infer.
- Group related fields. Single column for most forms.
- Validate on blur or submit, not on every keystroke. Error message under the field, specific (`Enter a scale like 1/4" = 1'-0"`).
- Input sizes match content (a ZIP field isn't full width).
- Keyboard: Enter submits, Esc closes, Tab order follows the visual order.

## 5. Tables and data

- Numbers right-aligned, tabular figures, mono, with units in the header (`Area, ft²`) rather than in every cell.
- Text left-aligned. Don't center columns.
- Sticky header on long tables. Horizontal scroll inside the table container, never the page.
- Row height: 40–48px default, 32px compact option for power users.
- Sort on the columns people actually sort by. Show the sort direction.
- Zebra stripes are not needed; subtle row dividers and hover highlight are enough.
- Show totals where people would otherwise sum in their head.
- Long tables: search/filter above, count of results (`142 items`), pagination or virtual scroll.
- **Magnitude at a glance:** a thin bar next to a key number (benchmark style) beats a separate chart.
- Bulk actions appear only when rows are selected.

## 6. AI-specific UX

This is where COXIT demos win or lose. Buyers have been burned by AI that looks confident and is wrong.

- **Show where every answer came from.** Each detected item links to its sheet and highlights the region. Each chat answer cites the page/section. Click → jump to source.
- **Show confidence honestly, where it means something.** Use a three-band label (High / Check / Low) or flag low-confidence rows for review, rather than raw 0.8734 probabilities. Never show a confidence number you don't actually compute.
- **Make correction cheap.** Inline edit, accept/reject per item, bulk accept for high-confidence. Corrections should feel like the main workflow, not an error path.
- **Separate "AI did" from "human confirmed".** A status column or subtle marker (`Detected` vs `Reviewed`).
- **Stream long outputs** (chat answers, reports) so something appears in < 1s.
- **Name what's happening during long jobs,** step by step, with counts.
- **Don't anthropomorphize.** No "I'm thinking…", no avatars with personalities, no "Our AI loves your drawings". Neutral: `Analyzing 37 sheets`.
- **Honest limits up front.** If the model doesn't handle hand-drawn sheets, say so where the user uploads, not after it fails.
- **Chat UIs:** messages left-aligned at a readable width (≤ 720px), user messages subtly distinguished (surface-sunken bubble), assistant messages plain text with citations as small mono chips. Suggested prompts only on an empty chat, max 3, written as real domain questions.

## 7. Demos specifically

- The demo tells one story: **upload → result → verify → export**. Cut every screen that isn't on that path.
- Seed with realistic data from the client's world (their drawing types, their item codes, plausible quantities). Fake-but-realistic is fine; generic is not.
- The "wow" moment is the result appearing on their own kind of document, with the source highlighted. Make that screen the best one.
- Make it work at 1440×900 (typical screen share) without scrolling for the key screen.
- No dead buttons. If something isn't built, don't show it, or show it disabled with `Coming in v2`.
- Load fast. A demo that spins for 20s needs a progress story or pre-computed results.

## 8. Accessibility (non-negotiable)

- Text contrast ≥ 4.5:1 (≥ 3:1 for 18px+). The tokens satisfy this; `--text-disabled` intentionally doesn't, so use it only for disabled. One brand exception: the flame primary button (white 600 on gradient, ~3.2:1), matching coxit.co. If the client needs strict AA, use the ink button for primary.
- Visible focus on every interactive element (`--focus-ring`).
- Every input has a label element; icon-only buttons have `aria-label`.
- Never color alone: status badges carry a word, error fields carry a message.
- Hit targets ≥ 32px on desktop, ≥ 44px on touch.
- Respect `prefers-reduced-motion`.
- Semantic HTML first (`button`, `nav`, `table`, `th scope`), ARIA only to fill gaps.

## 9. Responsive

- Design for 1280–1440 first (that's where these tools are used), then make sure 390px doesn't break: sidebar collapses, tables scroll horizontally inside their container, page headers stack.
- Don't build a separate mobile layout for a desktop tool unless asked.
