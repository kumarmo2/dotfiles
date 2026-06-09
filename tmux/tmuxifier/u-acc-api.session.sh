
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
    run_cmd "nvim"
    run_cmd "tmux rename-window code"

fi

finalize_and_go_to_session

# window_root "~/work/unified-api-account.git/"
#
# # Create new window. If no argument is given, window name will be based on
# # layout file name.
# new_window "code"
#
# # split_h 80
# # split_v 20
# # split_h 50
# #
# # select_pane 0
# #
# # split_v 50
# #
# # select_pane 0
# # run_cmd "cd backend/Scheduler.Api"
# # run_cmd "dtr"
# #
# # select_pane 4
# #
# # run_cmd "envoy -c infra/envoy.yml"
# #
# # select_pane 3
# #
# # run_cmd "cd frontend/scheduler-ui"
# # run_cmd "npm run dev"
# #
# # select_pane 2
# # run_cmd "nvim"
