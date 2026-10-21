# Review checklist

Run this on screenshots, not on code. Fix, re-screenshot, re-check.

**Purpose**
- [ ] I can say in one sentence what this screen is for, and the screen makes that obvious in 3 seconds.
- [ ] The main content is the result/data, not controls or decoration.
- [ ] Exactly one primary (orange) button visible.

**COXIT look**
- [ ] Side by side with `assets/example.html`, the screen looks just as finished. If it looks plainer, it isn't done.
- [ ] At least one ink (near-black) element gives the page weight: nav pill, hero band, or tool pill.
- [ ] Primary button is the flame gradient with white 600 text, and there's only one.
- [ ] Type is big enough: page/hero title ≥ 40px, card titles 24px, body 16px, key numbers ≥ 40px. Headings 500, not bold.
- [ ] Mona Sans actually loaded (not system fallback). Mono on labels, headers, codes, numbers in toolbars, and nowhere else.
- [ ] Orange count ≤ ~3. Orange text on light is `#B84A00`.
- [ ] Cards translucent with radius 24 and no shadows; nothing nested; shadows only on floating elements.
- [ ] At most one corona glow, only on a dark surface.
- [ ] No hardcoded hex in components (grep).

**Copy**
- [ ] Ran the delete test on every string. No subtitle that restates the title.
- [ ] No banned words, no emoji, no exclamation marks, sentence case.
- [ ] Buttons are verb + object.
- [ ] Domain vocabulary, realistic data. No lorem, John Doe, Acme, Item 1.

**States**
- [ ] Loading, empty, and error exist for every data view, and errors are specific.
- [ ] Long AI jobs show the current step and counts.

**AI output** (if any)
- [ ] Each result links to its source.
- [ ] Low-confidence items are flagged; nothing shows a fake precision number.
- [ ] User can correct results inline.

**Accessibility & layout**
- [ ] Focus ring visible when tabbing; everything reachable by keyboard.
- [ ] Inputs have labels; icon buttons have aria-labels.
- [ ] Status never relies on color alone.
- [ ] Works at 1440 (key screen fits without scrolling) and doesn't break at 390.
- [ ] Numbers right-aligned and tabular; tables scroll inside their container.
