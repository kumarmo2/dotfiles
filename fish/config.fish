source /usr/share/cachyos-fish-config/cachyos-config.fish

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8


# Set up fzf key bindings
fzf --fish | source
alias fzv='vim (fzf)'
source "$HOME/.cargo/env.fish"
source "$HOME/dotfiles/fish/functions/tmux-window.fish"
source "$HOME/dotfiles/fish/functions/fzcd.fish"
source "$HOME/dotfiles/fish/functions/fzn.fish"
source "$HOME/dotfiles/fish/functions/git.fish"


set -u fish_user_paths $fish_user_paths $HOME/.local/share/nvim/mason/bin
set -u fish_user_paths $fish_user_paths $HOME/Downloads/zig-linux-x86_64-0.15.0-dev.621+a63f7875f
set -u fish_user_paths $fish_user_paths $HOME/.local/bin

set -Ux EDITOR nvim
set -Ux VISUAL nvim
zoxide init fish | source
