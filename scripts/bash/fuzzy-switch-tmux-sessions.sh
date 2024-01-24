#!/bin/bash

SESSION_NAME=$(tmux list-session | fzf | cut --delimiter=":" --fields=1)

if [ -n "$TMUX" ]; then
    tmux switch-client -t "$SESSION_NAME"
else
    tmux attach-session -t "$SESSION_NAME"
fi

