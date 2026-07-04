# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/uapi-discovery"
session_root "~/work/unified-api-discovery.git/worktrees/latest"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "uapi-discovery"; then

    new_window
    run_cmd "pi"
    run_cmd "tmux rename-window pi"

    new_window
    split_h 70
    run_cmd "nvim"

    run_cmd "tmux rename-window code"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
