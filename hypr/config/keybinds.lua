-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Keybinds                            ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

require("config.defaults")

-- https://wiki.hypr.land/Configuring/Basics/Binds/

-- ======= Core =======
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal), { description = "Opens your preferred terminal emulator ($terminal)" })
hl.bind(mainMod .. " + o", hl.dsp.exec_cmd("obsidian"), { description = "Opens Obsidian" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(filemanager), { description = "Opens your preferred filemanager ($filemanager)" })
hl.bind(mainMod .. " + w", hl.dsp.window.close(), { description = "Closes (not kill) current window" })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd([[loginctl terminate-user ""]]), { description = "Exits Hyprland by terminating the user sessions" })
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { description = "Switches current window between floating and tiling mode" })
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(applauncher), { description = "Runs your application launcher" })
hl.bind(mainMod .. " + e", hl.dsp.exec_cmd("~/.config/rofi/emoji/types-6/launch.sh"), { description = "Emoji picket" })
hl.bind(mainMod .. " + SHIFT + b", hl.dsp.exec_cmd("~/dotfiles/hypr/scripts/bruno-fork.sh"), { description = "Custom Bruno Launcher" })
hl.bind(mainMod .. " + r", hl.dsp.exec_cmd("~/dotfiles/bin/screenrecording_toggle.sh"), { description = "Toggle Screen Recorder" })
hl.bind(mainMod .. " + s", hl.dsp.exec_cmd(shutdownlauncher), { description = "Runs your shutdown launcher" })
hl.bind(mainMod .. " + m", hl.dsp.window.fullscreen(), { description = "Toggles current window fullscreen mode" })
hl.bind(mainMod .. " + Y", hl.dsp.window.pin(), { description = "Pin current window (shows on all workspaces)" })

-- ======= Application shortcuts  =======
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd("zen"), { description = "browser" })

-- ======= Grouping Windows =======
hl.bind(mainMod .. " + Tab", hl.dsp.group.next(), { description = "Switches to the next window in the group" })

-- ======= Toggle Gaps =======
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd([[hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"]]), { description = "Set CachyOS default gaps" })
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd([[hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0"]]), { description = "Remove gaps between window" })

-- ======= Volume Control =======
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd([[pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{if($1>100) system("pactl set-sink-volume @DEFAULT_SINK@ 100%")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd([[pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{if($1>100) system("pactl set-sink-volume @DEFAULT_SINK@ 100%")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd([[amixer sset Master toggle | sed -En '/\[on\]/ s/.*\[([0-9]+)%\].*/\1/ p; /\[off\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]), { locked = true, repeating = true })

-- ======= Playback Control =======
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Toggles play/pause" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { description = "Next track" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { description = "Previous track" })
hl.bind("Print", hl.dsp.exec_cmd("~/dotfiles/bin/screenshot.sh"), { description = "Take Screenshot" })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("~/dotfiles/bin/screenshot.sh"), { description = "Screen capture selection" })

-- ======= Screen Brightness =======
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("gnome-calculator"), { description = "Runs the calculator application" })
hl.bind("CTRL + SHIFT + L", hl.dsp.exec_cmd("swaylock-fancy -e -K -p 10 -f Hack-Regular"), { description = "Lock the screen" })
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"), { description = "Reload/restarts Waybar" })

-- ======= Window Actions =======
-- Move window with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move the window towards a direction" })

-- Move window towards a direction
hl.bind(mainMod .. " + left", hl.dsp.window.move({ direction = "l" }), { description = "Move active window to the left" })
hl.bind(mainMod .. " + right", hl.dsp.window.move({ direction = "r" }), { description = "Move active window to the right" })
hl.bind(mainMod .. " + up", hl.dsp.window.move({ direction = "u" }), { description = "Move active window upwards" })
hl.bind(mainMod .. " + down", hl.dsp.window.move({ direction = "d" }), { description = "Move active window downwards" })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }), { description = "Move focus to the left" })
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }), { description = "Move focus to the right" })
hl.bind(mainMod .. " + u", hl.dsp.focus({ direction = "u" }), { description = "Move focus upwards" })
hl.bind(mainMod .. " + n", hl.dsp.focus({ direction = "d" }), { description = "Move focus downwards" })

-- Resizing windows
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { description = "Resize to the right (resizing mode)" })
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { description = "Resize to the left (resizing mode)" })
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { description = "Resize upwards (resizing mode)" })
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { description = "Resize downwards (resizing mode)" })

-- Resize window with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- Move active window to a workspace
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = "1", follow = true }), { description = "Move window and switch to workspace 1" })
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = "2", follow = true }), { description = "Move window and switch to workspace 2" })
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = "3", follow = true }), { description = "Move window and switch to workspace 3" })
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = "4", follow = true }), { description = "Move window and switch to workspace 4" })
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = "5", follow = true }), { description = "Move window and switch to workspace 5" })
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = "6", follow = true }), { description = "Move window and switch to workspace 6" })
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = "7", follow = true }), { description = "Move window and switch to workspace 7" })
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = "8", follow = true }), { description = "Move window and switch to workspace 8" })
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = "9", follow = true }), { description = "Move window and switch to workspace 9" })
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10", follow = true }), { description = "Move window and switch to workspace 10" })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ workspace = "-1", follow = true }), { description = "Move window and switch to the next workspace" })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ workspace = "+1", follow = true }), { description = "Move window and switch to the previous workspace" })

-- Same as above, but doesn't switch to the workspace
hl.bind(mainMod .. " + CTRL + 1", hl.dsp.window.move({ workspace = "1", follow = false }), { description = "Move window silently to workspace 1" })
hl.bind(mainMod .. " + CTRL + 2", hl.dsp.window.move({ workspace = "2", follow = false }), { description = "Move window silently to workspace 2" })
hl.bind(mainMod .. " + CTRL + 3", hl.dsp.window.move({ workspace = "3", follow = false }), { description = "Move window silently to workspace 3" })
hl.bind(mainMod .. " + CTRL + 4", hl.dsp.window.move({ workspace = "4", follow = false }), { description = "Move window silently to workspace 4" })
hl.bind(mainMod .. " + CTRL + 5", hl.dsp.window.move({ workspace = "5", follow = false }), { description = "Move window silently to workspace 5" })
hl.bind(mainMod .. " + CTRL + 6", hl.dsp.window.move({ workspace = "6", follow = false }), { description = "Move window silently to workspace 6" })
hl.bind(mainMod .. " + CTRL + 7", hl.dsp.window.move({ workspace = "7", follow = false }), { description = "Move window silently to workspace 7" })
hl.bind(mainMod .. " + CTRL + 8", hl.dsp.window.move({ workspace = "8", follow = false }), { description = "Move window silently to workspace 8" })
hl.bind(mainMod .. " + CTRL + 9", hl.dsp.window.move({ workspace = "9", follow = false }), { description = "Move window silently to workspace 9" })
hl.bind(mainMod .. " + CTRL + 0", hl.dsp.window.move({ workspace = "10", follow = false }), { description = "Move window silently to workspace 10" })

-- ======= Workspace Actions =======
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = "1" }), { description = "Switch to workspace 1" })
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = "2" }), { description = "Switch to workspace 2" })
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = "3" }), { description = "Switch to workspace 3" })
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = "4" }), { description = "Switch to workspace 4" })
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = "5" }), { description = "Switch to workspace 5" })
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = "6" }), { description = "Switch to workspace 6" })
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = "7" }), { description = "Switch to workspace 7" })
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = "8" }), { description = "Switch to workspace 8" })
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = "9" }), { description = "Switch to workspace 9" })
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }), { description = "Switch to workspace 10" })

-- Scroll through existing workspaces
hl.bind(mainMod .. " + k", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll through workspaces incrementally" })
hl.bind(mainMod .. " + j", hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll through workspaces decrementally" })
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll through workspaces incrementally" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll through workspaces decrementally" })
hl.bind(mainMod .. " + slash", hl.dsp.focus({ workspace = "previous" }), { description = "Switch to the previous workspace" })

-- Special workspaces (scratchpads)
hl.bind(mainMod .. " + minus", hl.dsp.window.move({ workspace = "special", follow = true }), { description = "Move active window to Special workspace" })
hl.bind(mainMod .. " + equal", hl.dsp.workspace.toggle_special("special"), { description = "Toggles the Special workspace" })
hl.bind(mainMod .. " + F1", hl.dsp.workspace.toggle_special("scratchpad"), { description = "Call special workspace scratchpad" })
hl.bind(mainMod .. " + ALT + SHIFT + F1", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }), { description = "Move active window to special workspace scratchpad" })

-- ======= Additional Settings =======
-- https://wiki.hyprland.org/Configuring/Binds
hl.config({
    binds = {
        allow_workspace_cycles = 1,
        workspace_back_and_forth = 1,
        workspace_center_on = 1,
        movefocus_cycles_fullscreen = true,
        window_direction_monitor_fallback = true,
    },
})
