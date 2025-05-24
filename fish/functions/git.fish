function gplc --description "git pull current branch"
    git pull origin (git branch --show-current)
end

function gphc --description "git push current branch"
    git push origin (git branch --show-current)
end
