function fzf_tmux_dir --description 'Fuzzy-find a directory and attach/create tmux session'
    # ── 1) Dependencies
    if not type -q fd
        echo "fd is required but not installed. Aborting." >&2
        return 1
    end
    if not type -q fzf
        echo "fzf is required but not installed. Aborting." >&2
        return 1
    end

    # ── 3) Pick a directory
    set -l selected_dir (fd --max-depth 4 -t d . $HOME | fzf --preview 'ls {}')
    if test -z "$selected_dir"
        return 0
    end

    set -l dir_name (basename $selected_dir)

    # ── 5) Attach or create
    if set -q TMUX
         tmux new-window -c $selected_dir -n $dir_name
    else
        tmux new-session -c $selected_dir -s $dir_name
    end
end

bind \cp fzf_tmux_dir

