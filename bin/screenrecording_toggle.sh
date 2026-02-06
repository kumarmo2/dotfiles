#!/bin/bash



#!/usr/bin/env bash

RECORD_DIR="$HOME/recordings"
PID_FILE="/tmp/wf-recorder.pid"

mkdir -p "$RECORD_DIR"

# If recorder is already running → stop it
if [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
    kill "$(cat "$PID_FILE")"
    rm -f "$PID_FILE"
    notify-send "Screen recording stopped" "Saved in $RECORD_DIR"
    exit 0
fi

# Start new recording
OUTPUT="$RECORD_DIR/recording_$(date +%Y%m%d_%H%M%S).mp4"

wf-recorder -g "$(slurp)" -f "$OUTPUT" &
echo $! > "$PID_FILE" #`$!` gives us the PID of the last background process.

notify-send "Screen recording started" "$OUTPUT"


#
#
#
#
# # Directory to store recordings
# RECORD_DIR="$HOME/recordings"
#
# # Create directory if it doesn't exist
# mkdir -p "$RECORD_DIR"
#
# # Output file with timestamp to avoid overwrite
# OUTPUT="$RECORD_DIR/recording_$(date +%Y%m%d_%H%M%S).mp4"
#
# # Start recording (select area)
# wf-recorder -g "$(slurp)" -f "$OUTPUT"
#
# # Notify when recording ends
# notify-send "Screen recording saved" "$OUTPUT"
