local cmd = vim.cmd
local v = vim
local M = {}
require("plugins")
require("user.colorschemes.night_fox")
-- require("user.colorschemes.catppuccin")
-- require("user.colorschemes.tokyonight")
-- require("user.colorschemes.gruvbox")
require("settings")

require("user.lsp")
require("user.lsp.null-ls")
require("user.nvim-cmp")
require("user.treesitter")
require("user.nerd-commenter")
require("gitsigns-setup")
require("user.nvim-tree")
require("user.toggleterm")
require("lualine").setup()
-- require('user.neoformat')
require("keymappings")
require("user.telescope")
require("user.custom.neovide")
require("user.custom.case-transformation")
require("user.custom.commands")

-- PrintX = function ()
-- print("hello")
-- end

return M
