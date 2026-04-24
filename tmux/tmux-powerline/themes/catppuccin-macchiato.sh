# shellcheck shell=bash
# Catppuccin (Macchiato) theme for tmux-powerline.
#
# Usage: Set TMUX_POWERLINE_THEME=catppuccin-macchiato before sourcing config.sh,
#        or change the default in config.sh.

# Base colors
TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR='#232136'  # base
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR='#e0def4'  # text

# Window list styling
TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
	"#[fg=#232136,bg=#7aa2f7,bold]"
	"$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
	" #I#F "
	"$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN"
	" #W "
	"#[fg=#7aa2f7,bg=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR}]"
	"$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
)

TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
	"#[fg=#e0def4,bg=#6e6a86]"
)

TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
	"#[fg=#e0def4,bg=#6e6a86]"
	"  #I#{?window_flags,#F, } "
	"$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN"
	" #W "
)

# Status segments
TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
	"tmux_session_info #c4a7e7 #232136"  # mauve on base
	"vcs_branch #9ece6a #232136"         # green on base
)

TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
	"pwd #f9e2af #232136"                # peach on base
	"date_day #6e6a86 #e0def4"           # surface0 w/ text
	"date #6e6a86 #e0def4 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
	"time #6e6a86 #e0def4 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
)
