# Restyling an existing app into COXIT design

Typical ask: "here's Victor's demo, make it COXIT." The goal is a new skin plus a UX/copy cleanup, **without breaking behavior**. Work in this order; each step is a separate commit so it can be reviewed and reverted.

## 1. Inventory (read-only)

- Stack: framework, styling approach (Tailwind v3/v4, shadcn, CSS modules, styled-components, inline styles), component library.
- Where colors, fonts, radii live: `tailwind.config`, `globals.css`, theme files, and hardcoded values. Grep for `#[0-9a-fA-F]{3,6}`, `rgb(`, `font-family`, `rounded-`, `shadow-`, `bg-gradient`, `purple`, `indigo`, `violet`.
- List the screens and, for each, its primary action.
- Screenshot every screen before changing anything (Playwright, 1440px). These are your "before".

## 2. Install tokens (commit 1)

- Copy the right asset files from the skill into the project (see the table in SKILL.md).
- shadcn: replace the theme blocks in `globals.css` with `shadcn-theme.css`. Most of the app re-skins immediately.
- Tailwind: add the theme/preset, load fonts.
- Set `<html data-theme="light">` (or the dark variant if the product is dark).
- App should still work. Screenshot.

## 3. Replace hardcoded values (commit 2)

- Swap hardcoded colors for tokens. Map by role, not by hue: whatever was the brand color becomes `--accent`, grays become `--text-2/3` and borders, page background becomes `--bg`, cards become `--surface`.
- Remove gradients, glows, glass effects, and heavy shadows outright rather than mapping them.
- Normalize radii to the scale (8/12/16/24/pill) and buttons to pills.
- Primary button → flame gradient + white 600 text; other colored buttons → secondary / ink / ghost.
- Add the brand weight the old UI lacks: nav into the dark pill, a hero band with the key numbers on the main screen, mono codes and headers in tables. A restyle that only swaps colors will look plain.
- Replace emoji icons with one stroke icon set.

## 4. Structure and UX (commit 3)

Go screen by screen against `ux.md`:
- One primary action per view; demote the rest.
- Result-first layout; move config out of the main area.
- Add missing loading / empty / error states.
- Remove nested cards and decorative sections (hero, feature grids, fake stats) from app screens.
- Tables: right-align numbers, mono, units in headers.
- Don't change data flow, API calls, or state logic. If a UX fix needs a logic change, note it and ask.

## 5. Copy (commit 4)

Apply `copy.md` to every string. Expect to delete 30–60% of the UI text in an AI-generated app. That's normal and good.

## 6. Verify

- Screenshot every screen again at 1440 and 390. Compare with "before".
- Run the app's tests/lint if they exist.
- Go through `review.md`.
- Write a short summary for the reviewer: what changed visually, what changed in UX, what you deliberately left alone, anything that needs a decision.
