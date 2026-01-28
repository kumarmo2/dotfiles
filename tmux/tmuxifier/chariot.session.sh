# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/work/chariot-fe/latest-work/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "chariot"; then

    # window_root "~/work/chariot-fe/latest-work/"

    # Create new window. If no argument is given, window name will be based on
    # layout file name.
    new_window 

    run_cmd "tmux rename-window fe"

    # Split window into panes.
    split_h 80
    #
    select_pane 1
    #
    split_h 15
    #
    select_pane 1
    #
    split_v 20

    select_pane 1



    new_window

    run_cmd "tmux rename-window be"

    run_cmd "cd ~/work/chariot-be/latest-work/"

    split_h 80

    run_cmd "cd ~/work/chariot-be/latest-work/"
 
    select_pane 1
    
    split_h 15

    run_cmd "cd ~/work/chariot-be/latest-work/"
    
    select_pane 1
    
    split_v 20

    run_cmd "cd ~/work/chariot-be/latest-work/"

    select_pane 1


  #new_window "misc"

  # Load a defined window layout.
  #load_window "example"

  # Select the default active window on session creation.
  #select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
