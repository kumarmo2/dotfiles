local wezterm = require("wezterm")
local actions = wezterm.action

local M = {}

-- NOTE: use `wezterm show-keys --lua` to get the assignments that can
-- be used in lua directly.
M.add_key_bindings = function(config)
	config.keys = {
		{
			key = "=",
			mods = "CTRL",
			action = actions.IncreaseFontSize,
		},
		{
			key = "-",
			mods = "CTRL",
			action = actions.DecreaseFontSize,
		},
		{
			key = "V",
			mods = "CTRL",
			action = actions.PasteFrom("Clipboard"),
		},
		{
			key = "C",
			mods = "CTRL",
			action = actions.CopyTo("Clipboard"),
		},
		{ key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
	}
end

return M
