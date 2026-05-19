#!/usr/bin/env bash
set -euo pipefail

# macOS ships an ancient Bash (3.2) that lacks mapfile/readarray.
# We use POSIX head/sed here so this works on both Linux and macOS
# without requiring a newer Bash.

state_dir="${TMUX_SESSION_SWITCHER_STATE_DIR:-${XDG_STATE_HOME:-$HOME/.local/state}/tmux-session-switcher}"
state_file="$state_dir/history"
mkdir -p "$state_dir"

record_session() {
  local new_session="$1"
  [[ -z "$new_session" ]] && return 0

  local current=""
  if [[ -f "$state_file" ]]; then
    current=$(head -n 1 "$state_file")
  fi

  [[ "$current" == "$new_session" ]] && return 0

  printf '%s\n%s\n' "$new_session" "$current" > "$state_file"
}

swap_session() {
  if [[ ! -f "$state_file" ]]; then
    tmux display-message "session history is empty"
    return 1
  fi

  local previous
  previous=$(sed -n '2p' "$state_file")

  if [[ -z "$previous" ]]; then
    tmux display-message "no previous session to toggle"
    return 1
  fi

  tmux switch-client -t "$previous"
}

case "${1:-}" in
  record)
    record_session "${2:-}"
    ;;
  swap)
    swap_session
    ;;
  *)
    cat <<'EOF' >&2
Usage:
  tmux-session-switcher.sh record <session-name>
  tmux-session-switcher.sh swap
EOF
    exit 1
    ;;
esac
