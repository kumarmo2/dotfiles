# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/dev/kumarmo2/finance-manager.git/master"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "finance-manager"

# Split window into panes.
#split_v 20
split_h 80

split_v 20

split_h 80

split_h 20

run_cmd "envoy -c infra/envoy.yaml"


select_pane 3


run_cmd "cd backend/go-api/"

run_cmd "go build && ./finance-manager"

select_pane 2

run_cmd "cd frontend/webapp/"

run_cmd "npm run dev"

select_pane 0

run_cmd "codex"

select_pane 1

run_cmd "nvim"
