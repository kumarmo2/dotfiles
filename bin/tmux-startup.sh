#!/bin/bash


SESSION_NAME="multi_host"
NOTES_SESSION_NAME="obsdian_notes"

# NOTE: Create this file first and enter the password in it.
pass=$(cat ~/dotfiles/scripts/bash/.ssh-pass)

# Create obsdian_notes session
tmux new-session -d -s $NOTES_SESSION_NAME -n notes -c $HOME/dev/test-vault/

tmux new-window -t "$NOTES_SESSION_NAME:" -n agent -c $HOME/dev/test-vault/

# Main session
tmux new-session -d -s $SESSION_NAME -n host # -d means detached


# Create additional windows
tmux new-window -t "$SESSION_NAME:" -n pi
tmux send-keys -t "$SESSION_NAME:pi" "sshpass -p '${pass}' ssh pi" C-m # C-m imitates enter press.

tmux swap-window -s "$SESSION_NAME:host" -t "$SESSION_NAME:pi"

