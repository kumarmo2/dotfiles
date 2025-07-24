# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/dev/kumarmo2/chanakya/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "chanakya"

split_h 80
split_v 20
split_h 50

select_pane 0

split_v 50

select_pane 0

split_v 50

select_pane 5

run_cmd "envoy -c infra/envoy.yml"

select_pane 4

run_cmd "cd frontend/chanakya-ui"
run_cmd "npm run dev"

select_pane 0
run_cmd "cd backend/go-api"
run_cmd "go run *.go"

select_pane 3
run_cmd "nvim"
