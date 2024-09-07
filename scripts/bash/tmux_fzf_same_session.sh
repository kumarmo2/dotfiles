#!/bin/bash

# Check if fd and fzf are installed
command -v fd >/dev/null 2>&1 || { echo >&2 "fd is required but not installed. Aborting."; exit 1; }
command -v fzf >/dev/null 2>&1 || { echo >&2 "fzf is required but not installed. Aborting."; exit 1; }

# Check if inside a tmux session
if [ -n "$TMUX" ]; then
    INSIDE_TMUX=true
else
    INSIDE_TMUX=false
fi


if [[ $INSIDE_TMUX == false ]]; then
    exit 1
fi

# # Find directories in the home directory using fd and pass them to fzf for selection
selected_dir=$(fd --max-depth 4 -t d . "$HOME" | fzf --preview "ls {}")
#
# # Check if a directory is selected
if [ -n "$selected_dir" ]; then
    # Get the base name of the selected directory
    dir_name=$(basename "$selected_dir")
    windows=$(tmux list-windows -F "#{window_name}" | grep "$dir_name" | wc -l)
    # TODO: duplicate window names is not handled for now.
    if [[ windows -gt 0 ]]; then
        tmux select-window -t "$dir_name"
    else
        tmux new-window -c "$selected_dir" -n "$dir_name"
    fi
fi
