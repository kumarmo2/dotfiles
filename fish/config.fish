starship init fish | source
set -x LANG en_US.UTF-8

# Set up fzf key bindings
fzf --fish | source
alias fzv='vim (fzf)'
alias rm='trash'
alias tx='tmuxifier'
alias lf='ls | fzf'
alias gg='zeditor'
alias pi-no-skills='pi --no-skills --no-prompt-templates'
alias sysuser='systemctl --user'

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
# set -u fish_user_paths /home/kumarmo2/Downloads/zig-x86_64-linux-0.15.2 $fish_user_paths
set -u fish_user_paths /home/kumarmo2/Downloads/zig-x86_64-linux-0.16.0 $fish_user_paths
# set -u fish_user_paths -m ~/dotfiles/fish/git.bash
set --universal nvm_default_version v22.16.0
set -Ux TMUXIFIER_LAYOUT_PATH  $HOME/dotfiles/tmux/tmuxifier

set -Ux AWS_ACCESS_KEY_ID GK03f1f6d18c9f7692078b297e #dev
set -Ux AWS_SECRET_ACCESS_KEY 23f5e199576e7ad5232c4de7f7add188addb03d0ea61387a70fb7bff4e4a9c8b
set -Ux AWS_ENDPOINT_URL http://localhost:8083
set -Ux AWS_DEFAULT_REGION garage
# Pretty man pages with syntax highlighting
set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux MANROFFOPT -c



# set -Ux AWS_ACCESS_KEY_ID GK79544d9beb2d57b7876a2bd1 # stage
# set -Ux AWS_SECRET_ACCESS_KEY e0d913cac79905e155de5cfa2ab9e6a755e51e352f8e15073b21d626e271dc61
# set -Ux AWS_ENDPOINT_URL http://192.168.29.81:9083


set -u  fish_user_paths $fish_user_paths $HOME/.config/herd-lite/bin
# export PHP_INI_SCAN_DIR="/home/kumarmo2/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
set -Ux PHP_INI_SCAN_DIR $HOME/.config/herd-lite/bin



set -Ux EDITOR nvim
set -Ux VISUAL nvim
zoxide init fish | source
eval (tmuxifier init - fish)
fastfetch

# opencode
fish_add_path /home/kumarmo2/.opencode/bin
fish_add_path ~/dotfiles/fish/bin

set -Ux OPENAI_API_key ""
