#!/bin/bash

# Check if fd and fzf are installed
command -v fdfind >/dev/null 2>&1 || { echo >&2 "fd is required but not installed. Aborting."; exit 1; }
command -v fzf >/dev/null 2>&1 || { echo >&2 "fzf is required but not installed. Aborting."; exit 1; }

# Check if inside a tmux session
if [ -n "$TMUX" ]; then
  INSIDE_TMUX=true
else
  INSIDE_TMUX=false
fi


# Find directories in the home directory using fd and pass them to fzf for selection
selected_dir=$(fdfind -t d . "$HOME" | fzf --preview "ls {}")

# Check if a directory is selected
if [ -n "$selected_dir" ]; then
  # Get the base name of the selected directory
  dir_name=$(basename "$selected_dir")

  
  # If already inside tmux, unset $TMUX and create a new session in the selected directory
  if [ -n "$TMUX" ]; then
    unset TMUX
    tmux new-session -d -s "$dir_name" -c "$selected_dir"
    tmux switch-client -t "$dir_name"
  else
    # If not inside tmux, start a new tmux session and detach
    tmux new-session -c "$selected_dir" -s "$dir_name"
  fi
fi

