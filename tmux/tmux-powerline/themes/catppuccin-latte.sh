# shellcheck shell=bash
# Catppuccin (Latte) theme for tmux-powerline.
#
# Usage: Set TMUX_POWERLINE_THEME=catppuccin-latte before sourcing config.sh,
#        or change the default in config.sh.

# Base colors
TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR='#eff1f5'  # base
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR='#4c4f69'  # text

# Window list styling
TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
	"#[fg=#eff1f5,bg=#1e66f5,bold]"
	"$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
	" #I#F "
	"$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN"
	" #W "
	"#[fg=#1e66f5,bg=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR}]"
	"$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
)

TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
	"#[fg=#4c4f69,bg=#9ca0b0]"
)

TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
	"#[fg=#4c4f69,bg=#9ca0b0]"
	"  #I#{?window_flags,#F, } "
	"$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN"
	" #W "
)

# Status segments
TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
	"tmux_session_info #8839ef #eff1f5"  # mauve on base
	"vcs_branch #40a02b #eff1f5"         # green on base
)

TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
	"pwd #fe640b #eff1f5"                 # peach on base
	"date_day #9ca0b0 #4c4f69"           # surface0 w/ text
	"date #9ca0b0 #4c4f69 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
	"time #9ca0b0 #4c4f69 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
)
