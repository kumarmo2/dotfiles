#!/bin/bash


SESSION_NAME="multi_host"
NOTES_SESSION_NAME="obsdian_notes"
REDIS_ZIG_SESSION_NAME="redis_zig"
REDIS_ZIG_DIR="$HOME/dev/kumarmo2/redis-zig/"
# NOTE: Create this file first and enter the password in it.
pass=$(cat ~/dotfiles/scripts/bash/.ssh-pass)

# Create obsdian_notes session
tmux new-session -d -s $NOTES_SESSION_NAME -n notes -c $HOME/dev/test-vault/ nvim

tmux new-window -t "$NOTES_SESSION_NAME:" -n agent -c $HOME/dev/test-vault/ pi

tmux swap-window -s "$NOTES_SESSION_NAME:notes" -t "$NOTES_SESSION_NAME:agent"

# Main session
tmux new-session -d -s $SESSION_NAME -n host # -d means detached


# Create additional windows
tmux new-window -t "$SESSION_NAME:" -n pi
tmux send-keys -t "$SESSION_NAME:pi" "sshpass -p '${pass}' ssh pi" C-m # C-m imitates enter press.

tmux swap-window -s "$SESSION_NAME:host" -t "$SESSION_NAME:pi"

# redis-zig session start

tmux new-session -d -s $REDIS_ZIG_SESSION_NAME -n code -c $REDIS_ZIG_DIR nvim

tmux new-window -t "$REDIS_ZIG_SESSION_NAME:" -n agent -c $REDIS_ZIG_DIR pi

tmux swap-window -s "$REDIS_ZIG_SESSION_NAME:code" -t "$REDIS_ZIG_SESSION_NAME:agent"

tmux new-window -t "$REDIS_ZIG_SESSION_NAME:" -n build_test -c $REDIS_ZIG_DIR

tmux split-window -t "$REDIS_ZIG_SESSION_NAME:build_test"  -c $REDIS_ZIG_DIR

tmux select-window -t "$REDIS_ZIG_SESSION_NAME:code"

# redis-zig session end

# tmux attach-session -t $SESSION_NAME
