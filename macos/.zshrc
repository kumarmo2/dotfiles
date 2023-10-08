export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin/alacritty:$PATH
export PATH=/usr/local/bin:$PATH

# Homebrew paths.
export PATH=/opt/homebrew/bin/:$PATH
export PATH=/opt/homebrew/Cellar/lazygit/0.40.2/bin:$PATH
# Prompt
eval "$(starship init zsh)"

# bindkey -v # enable vi mode

setopt autocd

# alias starts

alias vim=nvim
alias lg=lazygit
alias fdfind=fd

# alias ends

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# YAZI helper function to help changing working
# directory on quitting.
function ya() {
    tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}


function open_tmux_session() {
  /Users/kumarmo2/dotfiles/scripts/bash/tmux_fzf.sh
}

zle -N open_tmux_session # without `zle`, the below bindkey doesn't work.
bindkey '^P' 'open_tmux_session'


