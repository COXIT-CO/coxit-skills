---
name: coxit-design
description: COXIT's design system and UI/UX standard for anything with a screen — demos, PoCs, internal tools, client prototypes, dashboards, landing pages, HTML reports. Use it whenever you build or change a UI for COXIT or a COXIT client, and whenever someone asks to "restyle this in COXIT design", "make it look like coxit", "переведи в наш дизайн", "зроби дизайн як у нас", "make the demo look good", "polish the UI", "fix the UX", or "make it look less like AI". Also use it when reviewing a UI for quality, and when starting any new React / Next.js / Vite / plain-HTML front end in a COXIT repo, even if design is not mentioned. Covers tokens (CSS, Tailwind v3/v4, shadcn), components, UX rules for B2B and AI products, and a strict anti-AI-slop copy standard.
---

# COXIT design

Two jobs, in this order:

1. **Make it usable.** The person in front of this screen is an estimator, a shop owner, a PM, an analyst. They have a job to finish. Good UX is the screen getting out of their way.
2. **Make it look like COXIT.** Warm, calm, engineered. Beige canvas, near-black type, one orange thing per view.

If the two ever conflict, usability wins.

## What COXIT looks like

Source: coxit.co (home, service pages, CaseVBench) and client decks. The site looks premium for concrete reasons, and the full breakdown is in `references/brand.md`. Short version:

- **Two materials.** Warm beige canvas `#EEE8E5` + near-black ink `#0D0D0D`. Every screen gets at least one ink element (the nav pill, a hero band, a tool pill). An all-beige screen looks flat and cheap. That's the most common failure.
- **One light source.** The eclipse: black with an orange/red corona. In UI it shows up as the **flame-gradient primary button** (white 600 text) and a **corona glow in the corner of one dark band**. Never flat orange fills.
- **Big type, weight 500.** Hero titles 48px, page titles 40px, card titles 24px, body 16px, numbers in stats 48px. Warm grey `#C2B7B0` for big titles on dark. Small, timid type is the second most common failure.
- **Mono as the engineering voice.** `//LABEL` eyebrows (14px uppercase), `[1]` orange indices, 13px mono table headers, mono codes and sheet numbers, mono form labels.
- **Translucent 24px cards, hairlines, no shadows.** Shadow only on floating things.
- **Signature pieces:** dark nav pill, hero band with big stats, CaseVBench table with magnitude bars, crop marks around drawings, dark floating tool pill, orange-bordered featured card. Use them; they're what make it read as COXIT.

## Workflow

### 1. Figure out what you're building

Before touching CSS, answer in one line each (in your head, not in the UI):
- Who uses this screen and what are they trying to finish?
- What is the one primary action?
- What does the user need to see first? (Usually: the result, not the controls.)
- Is this a **new screen**, a **restyle** of an existing one, or a **review**?

For a restyle, follow `references/restyle.md`. It has a step order that avoids breaking the app.

### 2. Install the tokens

Pick the matching file from `assets/`. Copy it into the project; don't link to the skill folder.

| Stack | Use |
|---|---|
| Plain HTML / vanilla | `tokens.css` + `components.css` |
| Tailwind v4 | `tokens.css` + `tailwind-v4.css` |
| Tailwind v3 | `tokens.css` + `tailwind-v3-preset.js` |
| shadcn/ui | `shadcn-theme.css` **instead of** `tokens.css` (variable names collide) |
| Logo | `logo-on-light.svg`, `logo-on-dark.svg` |

Load fonts per the comment at the top of `tokens.css`. Then never hardcode a hex, font, radius, or random px value in components. Everything goes through tokens. If a value you need doesn't exist, the design probably doesn't need it.

`assets/example.html` is a complete reference screen (takeoff results: nav pill, hero band with stats, table, drawing viewer). **Open it before building any new screen** and match its level of finish. `assets/example-upload.html` shows the lighter pattern for form/flow screens (label-column sections, drop zone, numbered rows). If your screen looks plainer than the examples, it's not done.

### 3. Build the screen with the UX rules

The full list is in `references/ux.md`. The ones that matter most:

- **Result first.** Show the output (the takeoff, the answer, the table) as the main content. Controls and settings go to the side or behind a button.
- **One primary (flame) button per view.** Everything else is secondary, ink, or ghost.
- **Every async thing has three states designed:** loading (with progress if > 2s), empty, error. Errors say what happened and what to do next.
- **AI output is checkable.** Show confidence where you have it, link each result back to its source (page, region, row), and let the user correct it inline.
- **Numbers:** right-aligned, tabular, mono, with units. Never "approximately" when you have the number.
- **Realistic data.** Use the client's domain: sheet numbers like `A-301`, real cabinet codes, real-looking quantities. Never "John Doe", "Lorem ipsum", "Item 1", "Acme".
- **Accessible by default:** 4.5:1 text contrast, visible focus, labels on every input, keyboard reachable, color never the only signal.

For component specs (shell, nav, tables, forms, upload, viewer, chat), see `references/components.md`.

### 4. Cut the copy

This is where AI-built UIs go wrong. Read `references/copy.md` before writing any UI text. The core rule:

> **Every string must earn its place. If deleting it loses nothing the user needs, delete it.**

Defaults:
- No subtitle under a heading unless it carries information the heading can't.
- No helper text that repeats the label. No placeholder that repeats the label.
- No "Welcome back", no taglines, no "AI-powered", no ✨, no emoji as icons, no exclamation marks.
- Buttons are verb + object: `Run takeoff`, `Export CSV`. Not `Submit`, not `Get started`, not `Let's go`.
- Empty states: one line saying what goes here, and the button to put it there.
- Use the user's words (takeoff, sheet, elevation, LF, count), not product-marketing words.

### 5. Review before you call it done

If you can run the app, screenshot it at 1440px and 390px wide (Playwright is fine) and look at the images. Don't review only from the code. Then go through `references/review.md`. It's short. Fix what fails, then screenshot again.

## Things that make it look like AI slop

Avoid all of these. If you notice one, remove it rather than restyling it.

- Purple/blue gradients, glassmorphism, glowing borders, gradient text, blurry blobs.
- Hero section + three icon feature cards on an internal tool or demo.
- A badge, an icon and a subtitle on every card.
- Centered everything. App screens are left-aligned.
- Shadows on every panel. Cards inside cards inside cards.
- Decorative charts, fake sparklines, made-up percentages ("98% accuracy") with no source.
- Two CTAs side by side with equal weight (`Get started` / `Learn more`).
- Tooltips and info icons explaining obvious things.
- Toasts for things the UI already shows.
- Title Case On Every Button And Label.
- `→` tacked onto every button and link. Meta lines built from `A · B · C · D` chains.
- Fade-and-slide-up on every section, hover-lift on every card. Motion only answers a user action.
- One radius and one shadow on everything regardless of hierarchy.
- Words: seamless, effortless, unlock, empower, leverage, supercharge, revolutionize, cutting-edge, robust, intelligent insights, "your one-stop".

## When the request is a document, not an app

Reports, audits, proposals, one-pagers in HTML: same tokens, but use `--reading-max` (720px) for prose, larger type (`--text-md` body), numbered sections `[1] [2]` like the client decks, and the metric/table components. No app shell.
