source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8


# Set up fzf key bindings
fzf --fish | source
alias fzcd='pushd (fd --max-depth 4 -t d . "$HOME" | fzf --preview "ls {}")'
alias fzn='nvim (fzf)'
alias fzv='vim (fzf)'
source "$HOME/.cargo/env.fish"

set -u fish_user_paths $fish_user_paths $HOME/.local/share/nvim/mason/bin

