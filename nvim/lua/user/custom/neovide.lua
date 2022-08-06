local M = {}

local is_neovide = vim.g.neovide or false
local v = vim
local api = v.api
local fn = v.fn

local setup_transparency_options = function ()
    vim.g.neovide_transparency = 0.4
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
end

local setup_options = function ()
    setup_transparency_options()
    vim.g.neovide_cursor_trail_length = 0.4
    vim.g.neovide_cursor_animation_length = 0.1
end

set_opaque = function()
    vim.g.neovide_transparency = 0
    vim.g.neovide_floating_blur_amount_x = 0
    vim.g.neovide_floating_blur_amount_y = 0
end

set_transparent = function()
    setup_transparency_options()
end

local create_user_commands = function()
    vim.api.nvim_create_user_command("Opaque", 'lua set_opaque()', {})
    vim.api.nvim_create_user_command("Transparent", 'lua set_transparent()', {})
end

local setup = function ()
    print("hi from neovide")
    setup_options()
    create_user_commands()
    -- vim.g.neovim_scroll_animation_length = 0.3
    -- vim.g.neovide_profiler = true
    -- vim.g.neovide_no_idle = true
end


if is_neovide then
    setup()
end

M.setup = setup
M.is_neovide = is_neovide

toLower = function ()
    print(" will lower the cases.")
    local vsend = fn.getpos("'<")
    local vend = fn.getpos("'>")

    local line_start = vsend[2]
    local line_end = vend[2]



    print(v.inspect(vsend))
end

api.nvim_create_user_command("Tolower", 'lua toLower()', {})

return M


