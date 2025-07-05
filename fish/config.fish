starship init fish | source
set -x LANG en_US.UTF-8

# Set up fzf key bindings
fzf --fish | source
alias fzv='vim (fzf)'
alias rm='trash'
alias tx='tmuxifier'
source "$HOME/.cargo/env.fish"
source "$HOME/dotfiles/fish/functions/tmux.fish"
source "$HOME/dotfiles/fish/functions/fzcd.fish"
source "$HOME/dotfiles/fish/functions/fzn.fish"
source "$HOME/dotfiles/fish/functions/git.fish"
source "$HOME/dotfiles/fish/functions/dotnet.fish"
source "$HOME/dotfiles/fish/functions/zig.fish"
source "$HOME/dotfiles/fish/functions/eza.fish"
source "$HOME/dotfiles/fish/functions/homelab.fish"
source "$HOME/dotfiles/fish/conf.d/nvm.fish"


set -u fish_user_paths $fish_user_paths $HOME/.local/share/nvim/mason/bin
set -u fish_user_paths $fish_user_paths $HOME/.local/bin/zig
set -u fish_user_paths $fish_user_paths $HOME/.local/bin
set -u fish_user_paths $fish_user_paths /usr/local/go/bin
set -u fish_user_paths $fish_user_paths $HOME/.tmux/plugins/tmuxifier/bin
set --universal nvm_default_version v22.16.0
set -Ux TMUXIFIER_LAYOUT_PATH  $HOME/dotfiles/tmux/tmuxifier

set -Ux EDITOR nvim
set -Ux VISUAL nvim
zoxide init fish | source
eval (tmuxifier init - fish)
fastfetch
