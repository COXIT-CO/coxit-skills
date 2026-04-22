#!/usr/bin/env bash
# Report which SKILL.md files have been refined vs. are still AI-generated starters.
#
# Signal: every skill is drafted with an `AI-GENERATED STARTER SKILL` HTML comment
# between the frontmatter and the first heading. Removing that comment is how a
# maintainer marks a skill as refined.
#
# Usage:
#   scripts/skill-status.sh              # plain-text report
#   scripts/skill-status.sh --markdown   # GitHub-flavored Markdown (for CI summary)
#
# Run from the repo root.

set -euo pipefail

marker="AI-GENERATED STARTER SKILL"
format="text"
if [[ "${1-}" == "--markdown" ]]; then
  format="markdown"
fi

refined=()
starter=()

while IFS= read -r -d '' file; do
  if grep -q "$marker" "$file"; then
    starter+=("${file#./}")
  else
    refined+=("${file#./}")
  fi
done < <(find . -name SKILL.md -not -path "./.git/*" -not -path "./node_modules/*" -print0 | sort -z)

total=$(( ${#refined[@]} + ${#starter[@]} ))

if [[ "$format" == "markdown" ]]; then
  printf '## Skill refinement status\n\n'
  printf '**%d of %d skills refined.**\n\n' "${#refined[@]}" "$total"
  printf '| Status | Skill |\n| --- | --- |\n'
  if [ "${#refined[@]}" -gt 0 ]; then
    for f in "${refined[@]}"; do printf '| refined | `%s` |\n' "$f"; done
  fi
  if [ "${#starter[@]}" -gt 0 ]; then
    for f in "${starter[@]}"; do printf '| starter | `%s` |\n' "$f"; done
  fi
else
  printf 'Skill refinement status — %d of %d refined\n\n' "${#refined[@]}" "$total"
  if [ "${#refined[@]}" -gt 0 ]; then
    printf 'Refined:\n'
    for f in "${refined[@]}"; do printf '  [refined] %s\n' "$f"; done
    printf '\n'
  fi
  if [ "${#starter[@]}" -gt 0 ]; then
    printf 'Still AI-generated starter:\n'
    for f in "${starter[@]}"; do printf '  [starter] %s\n' "$f"; done
  fi
fi
