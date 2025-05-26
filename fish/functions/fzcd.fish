function fzcd --description 'change directory'
    # cd (fd --max-depth 4 -t d . $HOME | fzf --preview "ls {}")
    set -l dir (fd --max-depth 4 -t d . $HOME | fzf --preview "ls {}")
    if test -n "$dir"
        z "$dir"
        commandline -f repaint
    end
end


bind \cf fzcd

