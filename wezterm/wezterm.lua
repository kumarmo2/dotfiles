local bindings = require("key_bindings")

local config = {}
bindings.add_key_bindings(config)

config.color_scheme = 'Gruvbox dark, hard (base16)'

config.hide_tab_bar_if_only_one_tab = true
config.disable_default_key_bindings = true
config.window_background_opacity = 1;

-- Spawn a bash shell in non-login shell

config.default_prog = { "/bin/bash" }

return config
