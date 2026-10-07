# Components

`assets/components.css` implements all of these as `.cx-*` classes. In React/shadcn, rebuild them to these specs. `assets/example.html` shows them assembled; open it before building a new screen.

## Contents
Shell · Hero band · Sections · Buttons · Cards · Tables · Metrics · Inputs · Badges & status · Tabs & segmented · Viewer · Tool pill · Numbered rows · Chat · Upload · Progress · Empty/error · Modals · Icons

---

**Shell.** Light header 72px: logo left (18px), **dark nav pill centered** (`.cx-navpill`: 46px, ink background, items `#C2B7B0` 16px, active item on `#181818` with an orange dot), avatar or one action right. Page max 1360px, 24px side padding. For apps with 6+ sections, use the dark sidebar variant (`.cx-app` + `.cx-sidebar`). Under 960px the pill hides and a `Menu` ink button appears.

**Hero band** (`.cx-hero`). The top of most screens: an ink card, radius 24, padding 40, with the corona glow in the bottom-right corner. Inside: orange `//EYEBROW` (status, e.g. `Takeoff complete`), a 48px warm-grey title (the project / client name), one meta line, actions on the right, then a row of 3–4 big stats (`.cx-stats`, 48px white numbers, mono labels, hairline dividers). Use one per screen. Skip it on dense utility screens (settings, admin lists).

**Sections** (`.cx-section`). For documents, settings and long pages: a 16rem left column with `//LABEL`, content on the right, hairline between sections, 48px vertical padding.

**Buttons.** Pill, 44px (32px small). Primary: flame gradient, white, 600. Secondary: transparent, 1px border (on dark, white text with 12% white border). Ink: dark pill, white text, used for strong secondary actions on light (`Edit item`). Ghost: text only. One primary per view.

**Cards** (`.cx-card`). Translucent white on beige, 1px border, radius 24. Padding 32 for content cards; tables and viewers run edge to edge with their own internal padding. `.cx-card--featured` = 3px orange border for the recommended option.

**Tables** (`.cx-table`, from CaseVBench). Headers 13px mono, `--text-2`, no uppercase. Rows 56px, text 16px/500, hairline dividers, first and last cell padding 32. Codes and sheet numbers in mono, sheet numbers muted. Numbers right-aligned, tabular. Magnitude bar (`.cx-bar`, 96×6) next to the key number: near-black, with orange only on the selected/leading row. Selected row: orange tint + 3px orange inset on the left. Status as quiet dot + text (`.cx-status`). Footer with count and a link. Cells don't wrap (the table scrolls); add `.wrap` to a long-text column.

**Metrics.** On dark use `.cx-stats` in the hero. On light use `.cx-metrics`: top hairline, tiles split by hairlines, mono label, 40px value. No floating KPI cards.

**Inputs.** 44px, radius 12, white, 1px border, focus = orange border + tint ring. Labels are 13px mono uppercase (like the site's form). Search gets the built-in icon (`.cx-search`). Placeholders show examples (`B24, sink, A-302`).

**Badges & status.** In tables prefer `.cx-status` (dot + word, color only on warn/bad). Pills (`.cx-badge`) for standalone status. `New` = outlined orange pill.

**Tabs & segmented.** Tabs: text with orange 2px underline. Segmented: tinted track with an **ink** active segment (not white) for 2–4 view modes.

**Viewer** (drawings, PDFs). The hero of most demos. Inside a card: header with mono sheet number + meta, a tinted stage (radius 16) holding the white sheet with **crop marks**, detections as 1px black outlines, the selected item 2px orange with tint, flagged items dashed amber. Mono labels on the drawing. A **dark tool pill** floats over the bottom edge of the stage (page `‹ 4 / 37 ›`, zoom). Below the stage, the selected item's detail: eyebrow, 24px name, 3 mono-labelled values, ink + ghost actions. List and drawing stay in sync both ways.

**Tool pill** (`.cx-toolpill`). Ink, 40px, mono readouts, separators. For viewer controls and bulk actions (`3 selected · Accept · Reject`).

**Numbered rows** (`.cx-rows`, from the PoC page). `[1]` orange mono, a 24px title, a grey explanation in a second column, and hairlines between rows. For findings, risks and steps in reports and audit screens.

**Chat.** Column ≤ 720px on the canvas. User message: tinted bubble, radius 16. Assistant: plain text, no bubble, no avatar; citations as small mono chips (`A-301 p.4`) that open the source in the viewer. Composer: white, radius 16, flame send button. Max 3 suggested questions on an empty chat.

**Upload.** `.cx-dropzone`: dashed border, radius 24, generous padding. One line + Browse button + constraints. Drag-over turns orange. Files then show as table rows with progress.

**Progress.** `.cx-progress` 4px with flame fill + step text with counts (`Measuring, sheet 14 of 37`). Long jobs: a list of stages with done/running/waiting dots.

**Empty / error.** Empty: 24px title + one line + one button, left-aligned, inside the card where the content would be. Error: `.cx-callout--bad` with a specific message and the fix.

**Modals & menus.** White, radius 24 (modal) / 16 (menu), `--shadow-pop`. Footer actions right-aligned, primary rightmost. Prefer a side drawer for long forms.

**Icons.** One stroke set (Lucide), 16px, 1.5px stroke, colored like adjacent text. No emoji, no colored icon tiles.
