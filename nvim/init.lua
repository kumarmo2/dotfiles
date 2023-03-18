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
require("user.colorschemes.onedarkpro")
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
require("user.lualine")
require("keymappings")
require("user.git_integrations.diffview")
require("user.telescope")
require("user.custom.case-transformation")
require("user.session-persistence")

return M
