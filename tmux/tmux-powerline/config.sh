# shellcheck shell=bash
# Tmux-powerline configuration - Catppuccin Mocha Theme
#
# This file is symlinked to: ~/.config/tmux-powerline/config.sh

# Use the catppuccin-mocha theme
export TMUX_POWERLINE_THEME='gruvbox-dark'

# Point to our custom themes directory
export TMUX_POWERLINE_DIR_USER_THEMES='${XDG_CONFIG_HOME:-${HOME}/.config}/tmux-powerline/themes'

# Use patched font symbols
export TMUX_POWERLINE_PATCHED_FONT_IN_USE='true'

# Debug mode - set to 'true' to see errors
export TMUX_POWERLINE_DEBUG_MODE_ENABLED='false'

# Status bar visibility
export TMUX_POWERLINE_STATUS_VISIBILITY='on'

# Status bar refresh interval
export TMUX_POWERLINE_STATUS_INTERVAL=1

# Status bar length
export TMUX_POWERLINE_STATUS_LEFT_LENGTH=60
export TMUX_POWERLINE_STATUS_RIGHT_LENGTH=90
