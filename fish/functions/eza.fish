function ls
    eza --icons --group-directories-first $argv
end

function ll
    eza -lh --icons --group-directories-first $argv
end

function la
    eza -a --icons --group-directories-first $argv
end

function lla
    eza -lah --icons --group-directories-first $argv
end

function lt
    eza -T --icons $argv
end

function lf
    eza -F --icons --group-directories-first $argv
end
