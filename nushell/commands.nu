export def gitco [] {
    git branch | fzf | str trim | git checkout $in
}

