
window_root "~/dev/kumarmo2/samay"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "samay"

split_h 70
split_v 20
split_h 50

select_pane 0

split_v 50

select_pane 0
run_cmd "cd backend/Scheduler.Api"
run_cmd "dtr"

select_pane 4

run_cmd "envoy -c infra/envoy.yml"

select_pane 3

run_cmd "cd frontend/scheduler-ui"
run_cmd "npm run dev"

select_pane 2
run_cmd "nvim"
