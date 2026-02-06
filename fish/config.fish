starship init fish | source
set -x LANG en_US.UTF-8

# Set up fzf key bindings
fzf --fish | source
alias fzv='vim (fzf)'
alias rm='trash'
alias tx='tmuxifier'
alias lf='ls | fzf'
alias gg='zeditor'

# Git branch picker (fzf checkout)
function __git_fzf_checkout --description 'fzf checkout local branch'
    command git-fzf-checkout.sh
    commandline -f repaint
end
bind \cb '__git_fzf_checkout'

source "$HOME/.cargo/env.fish"
source "$HOME/dotfiles/fish/functions/tmux.fish"
source "$HOME/dotfiles/fish/functions/fzcd.fish"
source "$HOME/dotfiles/fish/functions/fzn.fish"
source "$HOME/dotfiles/fish/functions/git.fish"
source "$HOME/dotfiles/fish/functions/dotnet.fish"
source "$HOME/dotfiles/fish/functions/zig.fish"
source "$HOME/dotfiles/fish/functions/eza.fish"
source "$HOME/dotfiles/fish/functions/homelab.fish"
source "$HOME/dotfiles/fish/functions/tailscale.fish"
source "$HOME/dotfiles/fish/conf.d/nvm.fish"


set -u fish_user_paths $fish_user_paths $HOME/.local/share/nvim/mason/bin
set -u fish_user_paths $fish_user_paths $HOME/.local/bin/zig
set -u fish_user_paths $fish_user_paths $HOME/.local/bin
set -u fish_user_paths $fish_user_paths /usr/local/go/bin
set -u fish_user_paths $fish_user_paths $HOME/.tmux/plugins/tmuxifier/bin
set -u fish_user_paths $fish_user_paths $HOME/dotfiles/bin
set -u fish_user_paths $fish_user_paths (go env GOPATH)/bin
# set -u fish_user_paths -m ~/dotfiles/fish/git.bash
set --universal nvm_default_version v22.16.0
set -Ux TMUXIFIER_LAYOUT_PATH  $HOME/dotfiles/tmux/tmuxifier

# Pretty man pages with syntax highlighting
set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux MANROFFOPT -c
set -Ux EDITOR nvim
set -Ux VISUAL nvim
zoxide init fish | source
eval (tmuxifier init - fish)
fastfetch

# opencode
fish_add_path /home/kumarmo2/.opencode/bin
fish_add_path ~/dotfiles/fish/bin
