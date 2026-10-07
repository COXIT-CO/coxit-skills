// Tailwind v3: load tokens.css globally, then in tailwind.config.js:
//   presets: [require("./coxit-tailwind-preset.js")]
const v = (name) => `var(--${name})`;

module.exports = {
  darkMode: ["selector", '[data-theme="dark"]'],
  theme: {
    extend: {
      fontFamily: { sans: [v("font-sans")], mono: [v("font-mono")] },
      colors: {
        bg: v("bg"),
        surface: { DEFAULT: v("surface"), raised: v("surface-raised"), sunken: v("surface-sunken") },
        text: { DEFAULT: v("text"), 2: v("text-2"), 3: v("text-3"), disabled: v("text-disabled") },
        border: { DEFAULT: v("border"), subtle: v("border-subtle"), strong: v("border-strong") },
        accent: { DEFAULT: v("accent"), hover: v("accent-hover"), text: v("accent-text"), tint: v("accent-tint") },
        "on-accent": v("on-accent"),
        "on-flame": v("on-flame"),
        ink: { DEFAULT: v("ink"), surface: v("ink-surface"), text: v("ink-text"), "text-2": v("ink-text-2"), "text-3": v("ink-text-3"), border: v("ink-border") },
        good: { DEFAULT: v("good"), tint: v("good-tint") },
        warn: { DEFAULT: v("warn"), tint: v("warn-tint") },
        bad: { DEFAULT: v("bad"), tint: v("bad-tint") },
        info: { DEFAULT: v("info"), tint: v("info-tint") },
      },
      borderRadius: { sm: v("radius-sm"), md: v("radius-md"), lg: v("radius-lg"), xl: v("radius-xl") },
      boxShadow: { pop: v("shadow-pop") },
      backgroundImage: { flame: v("gradient-flame"), "flame-hover": v("gradient-flame-hover"), corona: v("gradient-corona") },
      fontSize: { "2xl": "2.5rem", "3xl": "3rem", "4xl": "4rem" },
    },
  },
};
