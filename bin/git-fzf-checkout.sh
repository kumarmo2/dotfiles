#!/usr/bin/env bash
set -euo pipefail

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Error: $1 is required but not installed." >&2
    exit 1
  fi
}

require_cmd git
require_cmd fzf

# Ensure we are inside a git repository.
# git rev-parse --show-toplevel returns the absolute path of the repo root; it fails if run outside a repo.
repo_root=$(git rev-parse --show-toplevel 2>/dev/null || true)
if [[ -z "$repo_root" ]]; then
  echo "Error: not inside a git repository." >&2
  exit 1
fi

# Build local branch list using simple git branch output (no remotes).
# git branch --format lists only local branch names; piping into fzf presents a clean list.
# The preview uses `git log -1` on the selected branch name to show the latest commit summary/stat while browsing.
selection=$(git -C "$repo_root" branch --format='%(refname:short)' | \
  fzf --prompt='branch> ' \
      --header='Select a local branch' \
      --preview="git -C $repo_root log -1 --color=always --stat --decorate {1}" \
      --preview-window=up:60%)

if [[ -z "${selection:-}" ]]; then
  # No selection (cancelled) or no branches
  exit 0
fi

branch_name="${selection%%$'\t'*}"

# Switch to the chosen branch.
# git checkout updates HEAD and working tree to the selected local branch.
git -C "$repo_root" checkout "$branch_name"

# Fetch latest from upstream if configured
# upstream_ref=$(git -C "$repo_root" rev-parse --abbrev-ref --symbolic-full-name "${branch_name}@{u}" 2>/dev/null || true)
#   ^ resolves the configured upstream of the current branch (e.g., origin/main); empty if none.
# if [[ -n "$upstream_ref" ]]; then
#   upstream_remote=${upstream_ref%%/*}
#   upstream_branch=${upstream_ref#*/}
#   # git fetch <remote> <branch> updates only that upstream ref without touching others.
#   git -C "$repo_root" fetch "$upstream_remote" "$upstream_branch"
#   # git pull --ff-only fast-forwards the checked-out branch to upstream without creating merge commits.
#   git -C "$repo_root" pull --ff-only
# fi
