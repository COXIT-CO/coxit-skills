# COXIT brand, for UI

## Why coxit.co looks expensive (and generic AI UIs don't)

Studied page by page (home, PoC, CaseVBench). It comes down to six things. Most AI-built UIs miss all six, so they end up "beige and correct but poor."

1. **Contrast of materials.** The site alternates near-black (`#0D0D0D`) and warm beige (`#EEE8E5`). The dark parts carry the drama, and the beige parts carry the reading. An all-beige app with thin borders looks flat. Give every product screen **one dark ink surface** (the nav pill, a hero/result band, a toolbar) so the page has weight.
2. **Light from one source.** The hero is an eclipse: a black disc with an orange/red/yellow corona. The footer repeats it as a glowing `COXIT` wordmark. This light shows up as the corona gradient in the corner of a dark band and as the flame gradient on the primary button. It's never spread as flat orange fills.
3. **Big type, medium weight.** Section titles 64px, hero 64px, card titles 24px, body 16px. Everything is weight 500, never bold, and big headings use tight leading (1.0–1.1) with slight negative tracking. On dark, headlines are warm grey `#C2B7B0`, not white. Small type everywhere looks cheap.
4. **Mono as the engineering voice.** `//SECTION` labels at 14–16px uppercase, `[1] [2]` in orange, table headers at 13px mono, codes and sheet numbers in mono. That's what reads "engineers built this."
5. **Layout with a label column.** Wide sections put a `//LABEL` in a narrow left column (~16–18rem) and the title and content on the right. Content gets space, while the eye gets an anchor.
6. **Soft, translucent cards, no shadows.** Cards are `rgba(255,255,255,.5)` on beige, 1px border at 16% black, radius 24, padding 32. The featured option gets a 3px orange border instead of a shadow or badge.

Plus small technical details: crop-mark corner brackets around badges and figures, the floating dark nav pill, the 6px orange dot.

## Signature elements (use these, they are the brand)

| Element | Where in product UI | Class |
|---|---|---|
| Dark nav pill, centered in a light header | App navigation | `.cx-navpill` |
| Flame gradient pill button, white 600 text | The one primary action | `.cx-btn--primary` |
| Ink band with corona glow, warm-grey big title, big white numbers | Result summary, project header, dashboard top | `.cx-hero` + `.cx-stats` |
| `//LABEL` mono eyebrow | Above section titles, max one per section | `.cx-eyebrow` |
| `[1] [2]` orange mono | Steps, numbered findings | `.cx-index`, `.cx-rows` |
| Translucent 24px card | Tables, viewers, option cards | `.cx-card` |
| CaseVBench table | Any list of results | `.cx-table` |
| Magnitude bar next to a number | Qty, score, cost columns | `.cx-bar` |
| Crop marks | Around a drawing, a key figure | `.cx-cropmarks` |
| Dark floating tool pill | Viewer controls, bulk actions | `.cx-toolpill` |
| Orange 3px border | The recommended/selected option card | `.cx-card--featured` |

A screen that uses none of these will look generic even if every token is right.

## Color

| Role | Light | Dark | Use |
|---|---|---|---|
| `--bg` | `#EEE8E5` | `#0D0D0D` | Page canvas |
| card | `rgba(255,255,255,.5)` | `#121212` | Cards on canvas |
| `--surface-raised` | `#FFFFFF` | `#181818` | Inputs, menus, modals |
| `--ink` / `--ink-surface` | `#0D0D0D` / `#181818` | same | Dark elements inside a light app |
| `--text` | `#0D0D0D` | `#FFFFFF` | Primary text |
| `--text-2` | `#4C4C4C` | `#C2B7B0` | Secondary text |
| `--text-3` | `#6B6762` | `#9A9590` | Meta. Lowest readable |
| `--ink-text-2` | `#C2B7B0` | | Big titles on dark |
| `--accent` | `#E66B01` | | Bars, selection, focus, dot |
| `--accent-text` | `#B84A00` | `#F08B21` | Orange as text |
| `--gradient-flame` | `#CC3C20 → #E66B01 → #F08B21` | | Primary button, progress bar |
| `--gradient-corona` | eclipse glow | | One dark band per screen |
| good / warn / bad | `#2B6B47 / #8A5A12 / #A13A2A` | `#6FB38A / #D9A54A / #E07A68` | Status, scores |

Rules:
- **Light canvas by default** for product UI, with ink elements for weight. Full dark mode for marketing pages or products the client wants dark.
- **Orange budget about 3 per screen**, counting the primary button, the corona, the selected row, and the warn number. Never as a large flat fill, never in headings.
- **Primary button = flame gradient + white text, 600 weight** (exactly like coxit.co). It's a deliberate brand choice at ~3.2:1 contrast on 16px semibold. If a client requires strict WCAG AA, switch that button to `--ink` with white text, not to dark-on-orange.
- Status color always comes with a word.
- **Charts:** series 1 orange, comparison near-black, the rest greys. No rainbow palettes.

## Type

- **Mona Sans** for everything, weights 400/500, with 600 only on the gradient button.
- Scale: 13 (mono headers) / 15 (dense UI) / 16 (body, labels) / 20 / 24 (card titles) / 40 (page titles) / 48 (hero) / 64 (marketing).
- Headings 500 with tight leading. Display sizes `-0.0125em`, body `+0.01em`.
- **Mono** (PP Neue Montreal Mono → DM Mono): eyebrows, table headers, codes, IDs, sheet numbers, `[n]`, toolbar readouts, form labels. Never paragraphs.
- Sentence case. Uppercase only in mono labels.
- No serif. DM Serif from the old system is retired.

## Shape

- Radii: 12 inputs, 16 inner stages, 24 cards and bands, pill for buttons, nav, badges, toggles and tool pills.
- 1px borders. Shadow only on floating things (tool pill, menus, modals).
- No nested cards. Inside a card, separate with spacing, a hairline, or a tinted stage.

## Logo

- `logo-on-light.svg` (black + orange dot), `logo-on-dark.svg` (white + orange dot). 18px tall in the header.
- Never recolor, add effects, or put it on orange.
- **Client demos:** the client's name leads (in the hero band), and the COXIT logo stays small top-left or in the footer. Internal tools, benchmarks and the SDK are fully COXIT-branded.

## Voice

Calm, specific, technical. Numbers first, no hype, honest about limits. See `copy.md`.
