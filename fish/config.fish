starship init fish | source
set -x LANG en_US.UTF-8

# Set up fzf key bindings
fzf --fish | source
alias fzv='vim (fzf)'
source "$HOME/.cargo/env.fish"
source "$HOME/dotfiles/fish/functions/tmux-window.fish"
source "$HOME/dotfiles/fish/functions/fzcd.fish"
source "$HOME/dotfiles/fish/functions/fzn.fish"
source "$HOME/dotfiles/fish/functions/git.fish"
source "$HOME/dotfiles/fish/functions/dotnet.fish"
source "$HOME/dotfiles/fish/functions/zig.fish"


set -u fish_user_paths $fish_user_paths $HOME/.local/share/nvim/mason/bin
set -u fish_user_paths $fish_user_paths $HOME/.local/bin/zig
set -u fish_user_paths $fish_user_paths $HOME/.local/bin

set -Ux EDITOR nvim
set -Ux VISUAL nvim
zoxide init fish | source
