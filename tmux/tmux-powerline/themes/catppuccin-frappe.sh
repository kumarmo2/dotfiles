# shellcheck shell=bash
# Catppuccin (Frappe) theme for tmux-powerline.
#
# Usage: Set TMUX_POWERLINE_THEME=catppuccin-frappe before sourcing config.sh,
#        or change the default in config.sh.

# Base colors
TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR='#303030'  # base
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR='#c6d0f5'  # text

# Window list styling
TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
	"#[fg=#303030,bg=#8caaee,bold]"
	"$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
	" #I#F "
	"$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN"
	" #W "
	"#[fg=#8caaee,bg=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR}]"
	"$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
)

TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
	"#[fg=#c6d0f5,bg=#626880]"
)

TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
	"#[fg=#c6d0f5,bg=#626880]"
	"  #I#{?window_flags,#F, } "
	"$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN"
	" #W "
)

# Status segments
TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
	"tmux_session_info #ca9ee6 #303030"  # mauve on base
	"vcs_branch #a6d189 #303030"        # green on base
)

TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
	"pwd #fabd2f #303030"                # peach on base
	"date_day #626880 #c6d0f5"           # surface0 w/ text
	"date #626880 #c6d0f5 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
	"time #626880 #c6d0f5 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
)
