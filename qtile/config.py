from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import os
import subprocess
from libqtile import hook

mod = "mod4"
alt = "mod1"
terminal = "alacritty"
cs = 'one_dark' #colorscheme

colors = {
            'one_dark': {
                'soft_blue': '61AFEF',
                'light_slate_grey': '778899',
                'black': '282C34',
                'green': '98c379',
                'pink': 'C678DD',
                'red': 'E06C75',
                'yellow': 'E5C07B'

            },
            'gruvbox': {
                'bg': '282828',
                'fg0': 'fbf1c7',
                'fg': 'ebdbb2',
                'fg4': 'a89984',
                'red0': 'cc241d',
                'red1': 'fb4934',
                'green0': '98971a',
                'green1': 'b8bb26',
                'yellow0': 'd79921',
                'yellow1': 'fabd2f',
                'blue0': '458588',
                'blue1': '83a598',
                'purple0': 'b16286',
                'purple1': 'd3869b',
                'aqua0': '689d6a',
                'aqua1': '8ec07c',
                'grey0': 'a89984',
                'grey1': '928374'

            },
            'dark_grayish_blue': '979FAD',
         }
border_width = 2
gap = 10
right_widgets_padding = 10


keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Key bindings  specific to MonadTall layout starts
    Key([mod], "o", lazy.layout.grow()), # "o" for outwards
    Key([mod], "i", lazy.layout.shrink()), # 'i' for inwards
    # this will toggle between max and min 
    Key([mod], "m", lazy.layout.maximize()),
    # Key bindings  specific to MonadTall layout ends

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "r", lazy.restart(), desc="Restart the Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Volume binding starts
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q sset Master 5%-"), desc="decrease volume"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q sset Master 5%+"), desc="increase volume"),
    # Volume binding ends

    Key([mod], "space", lazy.spawn("rofi -show drun -show-icons"), desc="Spawn a command using a prompt widget"),
    Key([alt], "Tab", lazy.spawn("rofi -show window"), desc="Spawn a command using a prompt widget"),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            )
        ]
    )

layouts = [
    layout.MonadTall(border_focus = colors['gruvbox']['purple0'], border_normal = colors['gruvbox']['grey0'],
        border_width = border_width, max_ratio = 0.9, margin = gap)
        #  border_width = border_width, max_ratio = 0.9, margin = gap, single_margin = [50, 200, 50, 200]),
]

widget_defaults = dict(
    font="Caskaydia Cove Nerd Font",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


# BAR TODO: bold fonts, right widgets need to be underlined, rounded corners for bar.
screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(highlight_method = 'line'
                    , inactive = colors['gruvbox']['fg4'], highlight_color = [colors['gruvbox']['bg'],
                        colors['gruvbox']['bg']], borderwidth = 3),
                widget.Spacer(), 
                widget.Clock(format="%Y-%m-%d %a %H:%M", foreground=colors['gruvbox']['red0']),
                widget.Spacer(), 
                widget.CPU(format='{load_percent}%', foreground = colors['gruvbox']['green0'], 
                     #  border_color=colors['gruvbox']['green0']
                    ),
                widget.ThermalSensor(foreground=colors['gruvbox']['green0']),
                widget.Spacer(length=10),
                widget.Sep(foreground=colors['gruvbox']['green0']),
                widget.Spacer(length=10),
                widget.Memory(foreground=colors['gruvbox']['yellow1'], format = '{MemUsed:.0f}{mm}/{MemTotal:.0f}{mm}'),
                widget.Spacer(length=10),
                widget.Sep(foreground=colors['gruvbox']['yellow1']),
                widget.Systray(),
                widget.Spacer(length=10),
                widget.TextBox("Vol:", foreground=colors['gruvbox']['purple0']),
                widget.Volume(foreground=colors['gruvbox']['purple0']),
                widget.Spacer(length=5),
            ],
            24,
            margin = [0,700,5,700],
            background = colors['gruvbox']['bg'],
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/configs/autostart.sh')
    subprocess.run([home])


