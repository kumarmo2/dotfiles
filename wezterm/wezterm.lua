local bindings = require("key_bindings")
local wezterm = require 'wezterm'

local config = {}
bindings.add_key_bindings(config)

-- config.color_scheme = 'Everforest Dark Hard (Gogh)'
-- config.color_scheme = 'Everforest Light (Gogh)'
config.color_scheme = 'Gruvbox dark, hard (base16)'
-- config.color_scheme = 'Everforest Dark Hard (Gogh)'

config.hide_tab_bar_if_only_one_tab = true
config.disable_default_key_bindings = true
config.window_background_opacity = 1;
config.font_size = 11
config.font =
    wezterm.font('JetBrains Mono')

-- Spawn a bash shell in non-login shell

-- config.default_prog = { "/bin/bash" }

config.window_decorations = "NONE"
return config
