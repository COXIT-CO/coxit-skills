#!/usr/bin/env bash
# Standard repo setup: squash-only merges, auto-delete merged branches, default `dev` branch,
# identical protection on main/dev, and a required `require-dev-source` check on main.
set -euo pipefail

REPO="${1:-$(gh repo view --json nameWithOwner --jq .nameWithOwner)}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "==> $REPO"

echo "--> auto-delete head branches on merge"
gh api -X PATCH "repos/$REPO" -F delete_branch_on_merge=true --jq '"delete_branch_on_merge=\(.delete_branch_on_merge)"'

echo "--> squash and merge only"
gh api -X PATCH "repos/$REPO" -F allow_squash_merge=true -F allow_merge_commit=false -F allow_rebase_merge=false \
  -f squash_merge_commit_title=PR_TITLE -f squash_merge_commit_message=PR_BODY \
  --jq '"squash=\(.allow_squash_merge) merge_commit=\(.allow_merge_commit) rebase=\(.allow_rebase_merge)"'

echo "--> dev branch"
if gh api "repos/$REPO/branches/dev" >/dev/null 2>&1; then
  echo "dev already exists"
else
  MAIN_SHA="$(gh api "repos/$REPO/git/ref/heads/main" --jq .object.sha)"
  gh api -X POST "repos/$REPO/git/refs" -f ref=refs/heads/dev -f sha="$MAIN_SHA" --jq '"created dev at \(.object.sha[0:7])"'
fi

echo "--> default branch"
gh api -X PATCH "repos/$REPO" -f default_branch=dev --jq '"default_branch=\(.default_branch)"'

cat > "$TMP/base.json" <<'JSON'
{
  "required_status_checks": null,
  "enforce_admins": false,
  "required_pull_request_reviews": {
    "dismiss_stale_reviews": true,
    "require_code_owner_reviews": false,
    "require_last_push_approval": true,
    "required_approving_review_count": 1
  },
  "restrictions": null,
  "required_linear_history": true,
  "allow_force_pushes": false,
  "allow_deletions": false,
  "block_creations": false,
  "required_conversation_resolution": true,
  "lock_branch": false,
  "allow_fork_syncing": false
}
JSON

# main also requires the source-branch check (app_id 15368 = GitHub Actions)
jq '.required_status_checks = {"strict": false, "checks": [{"context": "require-dev-source", "app_id": 15368}]}' \
  "$TMP/base.json" > "$TMP/main.json"

SUMMARY='{checks: [.required_status_checks.checks[]?.context], reviews: .required_pull_request_reviews.required_approving_review_count, dismiss_stale: .required_pull_request_reviews.dismiss_stale_reviews, last_push_approval: .required_pull_request_reviews.require_last_push_approval, linear: .required_linear_history.enabled, conversations: .required_conversation_resolution.enabled, force_push: .allow_force_pushes.enabled, deletions: .allow_deletions.enabled}'

echo "--> protect dev"
gh api -X PUT "repos/$REPO/branches/dev/protection" --input "$TMP/base.json" --jq "$SUMMARY"

echo "--> protect main"
gh api -X PUT "repos/$REPO/branches/main/protection" --input "$TMP/main.json" --jq "$SUMMARY"

echo "--> open PRs into main (now need to come from dev)"
gh pr list --repo "$REPO" --base main --state open --json number,headRefName --jq '.[] | "#\(.number) \(.headRefName)"'
