export alias tmux = tmux -u # -u is for unicode support. 

export alias ll = ls -al
export alias lg = lazygit

# git aliases
export alias gd = git diff
export alias ga = git add
export alias gs = git status
export alias gc = git commit
export alias gp = git push origin
export alias gpl = git pull origin
export alias gch = git checkout

# dotnet alias
export alias dt = dotnet
export alias dtv = dotnet --version
export alias dtc = dotnet clean
export alias dtb = dotnet build
export alias dtr = dotnet run


export alias rm = trash-put
export alias code = flatpak run com.visualstudio.code
export alias fzcd = cd (fd --max-depth 4 -t d . $env.HOME | fzf --preview "ls {}")
export alias fzn = nvim (fzf)
export alias fzv = vim (fzf)


