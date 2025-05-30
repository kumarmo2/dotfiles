# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias lls='ls -alF --total-size'
alias la='ls -A'
alias l='ls -CF'
alias ls='eza'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/dotfiles/.aliases ]; then
    . ~/dotfiles/.aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
. "$HOME/.cargo/env"





# >>>> My custom configs starts from here.

# fzf and fd starts

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# extends the default features
export FZF_DEFAULT_OPS="--extended"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
--preview 'echo {}' --preview-window up:3:hidden:wrap
--bind 'ctrl-/:toggle-preview'
--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
--color header:italic
--header 'Press CTRL-Y to copy command into clipboard'"

# by default, fzf uses `find` internally
# we are overriding to use `fd` which covers
# majority of common use cases. eg: fd while searching
# takes gitignore into account.
export FZF_DEFAULT_COMMAND='fd --type f'

# For `ctrl-t` also, we are overriding to use `fd`
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# alias fd=fd

export TERM=xterm-256color

function open_tmux_session() {
  $HOME/dotfiles/scripts/bash/tmux_fzf.sh
}

function open_tmux_window() {
  $HOME/dotfiles/scripts/bash/tmux_fzf_same_session.sh
}

bind -x '"\C-p": open_tmux_session'
bind -x '"\C-o": open_tmux_window'


# export DOTNET_ROOT=$HOME/dotnet
# export PATH=$PATH:$HOME/dotnet
export PATH=$PATH:$HOME/dotnet-6
export PATH=$PATH:$HOME/.dotnet
export PATH=$PATH:$HOME/nvim-linux64/bin
export PATH=$PATH:$HOME/Downloads/logstash-7.15.1/bin
export PATH=$PATH:$HOME/go/bin
BUN_INSTALL="/home/manya/.bun"
PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LC_ALL="en_IN.UTF-8"

alias r=yazi


# starship prompt settings.
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init bash)"

#setxkbmap -option caps:swapescape
# setxkbmap -option caps:swapescape

# vim/nvim
export VISUAL=nvim
export EDITOR="$VISUAL"
# alias v=vim

export PATH=$PATH:/usr/local/go/bin

# git aliases
alias gd="git diff"
alias ga="git add"
alias gs="git status"
alias gc="git commit"
alias gp="git push origin"
alias gpl="git pull origin"
alias gch="git checkout"

# dotnet alias
alias dt=dotnet
alias dtv="dotnet --version"
alias dtc="dotnet clean"
alias dtb="dotnet build"
alias dtr="dotnet run"

# tmux aliases
alias ts="tmux new-session -s"

# golang related aliases
alias grm="go run main.go"
alias gb="go build"


export PATH=$PATH:$HOME/rust/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/softwares/prometheus-2.45.0.linux-amd64/
export PATH=$PATH:$HOME/softwares/bin/
export PATH=$PATH:$HOME/.config/emacs/bin/
#export OPENAI_API_KEY=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

# pass related envs start

export PASSWORD_STORE_CLIP_TIME=120 #num of seconds after which password will be automatically removed from clipboard

# pass related envs end


# misc aliases
alias cl=clear

alias lg=lazygit

alias sctl=systemctl


alias rm=trash-put
alias em="emacsclient -c -a 'nvim'"
alias code="flatpak run com.visualstudio.code "
alias gitco='git branch | fzf | xargs git checkout'
alias fzcd='z $(fd --max-depth 4 -t d . "$HOME" | fzf --preview "ls {}")'
alias fzn='nvim $(fzf)'
alias fzv='vim $(fzf)'


shopt -s autocd # auto cd into the path typed.
fastfetch

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
export PATH=$PATH:$HOME/.bun/bin/
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin/
export PATH=$PATH:$HOME/softwares/jdk-21.0.1/bin/
export PATH=$PATH:$HOME/softwares/azure-functions-cli/
export PATH=$PATH:/usr/sbin/
export PATH=$PATH:$HOME/dev/oss/ILSpy/ICSharpCode.ILSpyCmd/bin/Release/net8.0/publish
export PATH=$PATH:$HOME/.local/kitty/bin
export JAVA_HOME=$HOME/softwares/jdk-21.0.1

export AWS_PROFILE=personal


export  CUDA_HOME=/usr/local/cuda
export  PATH=${CUDA_HOME}/bin:${PATH}

# yazi helper function to help changing working
# directory on quitting.
function ya() {
    tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

export DOTNET_CLI_TELEMETRY_OPTOUT=1

shopt -s autocd # auto cd into the path typed.

source <(kubectl completion bash)
complete -o default -F __start_kubectl k
eval "$(zoxide init bash)"
