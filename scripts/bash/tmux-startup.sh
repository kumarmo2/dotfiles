#!/bin/bash


SESSION_NAME="multi_host"

# NOTE: Create this file first and enter the password in it.
pass=$(cat ~/dotfiles/scripts/bash/.ssh-pass)

tmux new-session -d -s $SESSION_NAME -n host

# Create additional windows
tmux new-window -t "$SESSION_NAME:" -n pi
tmux send-keys -t "$SESSION_NAME:pi" "sshpass -p '${pass}' ssh pi" C-m # C-m imitates enter press.

tmux new-window -t "$SESSION_NAME:" -n hp
tmux send-keys -t "$SESSION_NAME:hp" "sshpass -p '${pass}' ssh hp" C-m


tmux swap-window -s "$SESSION_NAME:host" -t "$SESSION_NAME:hp"

