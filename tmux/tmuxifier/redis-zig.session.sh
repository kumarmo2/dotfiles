# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/dev/kumarmo2/redis-zig"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
# if initialize_session "redis-zig"; then

if initialize_session "redis-zig"; then

    new_window
    run_cmd "pi"
    run_cmd "tmux rename-window agent"

    new_window 
    run_cmd "nvim"
    run_cmd "tmux rename-window code"

    new_window 
    run_cmd  "tmux rename-window build"
    split_v 50

    select_window 1
fi

finalize_and_go_to_session

