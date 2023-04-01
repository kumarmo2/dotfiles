local cmd = vim.cmd
local vim = vim
local M = {}
-- install lazy plugin manager starts.
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
print(vim.inspect(vim.opt.rtp))

-- install lazy plugin manager ends.

local plugins = require('plugins.plugins')

-- print(vim.inspect(plugins))
require('lazy').setup(plugins, { defaults = { lazy = false } })

-- require('impatient')
-- require('plugins')
-- require('user.greeters.alpha')
-- require("user.colorschemes.night_fox")
-- require("user.colorschemes.catppuccin")
require('user.colorschemes.tokyonight')
-- require("user.colorschemes.gruvbox")
-- v.cmd("colorscheme oxocarbon")
-- require('user.colorschemes.onedarkpro')
require('settings')

require('user.lsp')
require('user.lsp.formatting.null-ls')
require('user.nvim-cmp')
require('user.treesitter')
require('user.autopairs')
require('user.nerd-commenter')
require('gitsigns-setup')
require('user.nvim-tree')
-- require("user.toggleterm")
require('user.lualine')
require('keymappings')
-- require('user.git_integrations.diffview')
require('user.telescope')
require('user.custom.case-transformation')
-- require('user.session-persistence')

return M
