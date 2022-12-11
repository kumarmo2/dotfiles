local M = {}
local vim = vim
local default_lualine_theme = "auto" -- default value for "theme" for lualine

local get_theme_value = function()
	local curr_colorscheme = vim.g.colors_name

	if curr_colorscheme == nil then
		return default_lualine_theme
	end

	local matched = string.match(curr_colorscheme, "^onedark%a*$")
	if matched == nil then
		return default_lualine_theme
	end

	-- found onedark theme.
	-- get the onedark theme from lualine and customize it to your liking.
	local custom_onedark = require("lualine.themes.onedark")

	local found_onedarkpro, onedark = pcall(require, "onedarkpro.themes.onedark")
	if not found_onedarkpro then
		return custom_onedark
	end
	local palette = onedark.palette
	-- for some reason, lualines's default colorscheme doesn't give proper color in Normal Mode when used with 'onedarkpro'.
	-- that's why setting setting the color manually from 'onedarkpro' palette.
	custom_onedark.normal.a.bg = palette.purple

	return custom_onedark
end

M.get_theme_value = get_theme_value
return M
