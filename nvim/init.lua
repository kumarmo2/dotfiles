local cmd = vim.cmd
local v = vim
local M = {}
require("impatient")
require("plugins")
require("user.greeters.alpha")
-- require("user.colorschemes.night_fox")
-- require("user.colorschemes.catppuccin")
-- require("user.colorschemes.tokyonight")
-- require("user.colorschemes.gruvbox")
v.cmd("colorscheme oxocarbon")
require("settings")

require("user.lsp")
require("user.lsp.formatting.null-ls")
require("user.nvim-cmp")
require("user.treesitter")
require("user.autopairs")
require("user.nerd-commenter")
require("gitsigns-setup")
require("user.nvim-tree")
require("user.toggleterm")
require("lualine").setup()
require("keymappings")
require("user.git_integrations.diffview")
require("user.telescope")
require("user.custom.neovide")
require("user.custom.case-transformation")

return M
