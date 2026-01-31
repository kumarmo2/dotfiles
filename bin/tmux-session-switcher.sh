#!/usr/bin/env bash
set -euo pipefail

state_dir="${TMUX_SESSION_SWITCHER_STATE_DIR:-${XDG_STATE_HOME:-$HOME/.local/state}/tmux-session-switcher}"
state_file="$state_dir/history"
mkdir -p "$state_dir"

record_session() {
  local new_session="$1"
  if [[ -z "$new_session" ]]; then
    return 0
  fi

  local current=""
  if [[ -f "$state_file" ]]; then
    mapfile -t lines < "$state_file"
    current="${lines[0]:-}"
  fi

  if [[ "$current" == "$new_session" ]]; then
    return 0
  fi

  printf '%s\n%s\n' "$new_session" "$current" > "$state_file"
}

swap_session() {
  if [[ ! -f "$state_file" ]]; then
    tmux display-message "session history is empty"
    return 1
  fi

  mapfile -t lines < "$state_file"
  local previous="${lines[1]:-}"
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
