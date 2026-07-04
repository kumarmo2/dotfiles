
# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/work/unified-api-account.git/worktrees/latest"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
# if initialize_session "redis-zig"; then

if initialize_session "u-acc-api"; then
    new_window
    run_cmd "pi"
    run_cmd "tmux rename-window pi"

    new_window
    split_h 70
    run_cmd "nvim"
    run_cmd "tmux rename-window code"

fi

finalize_and_go_to_session

