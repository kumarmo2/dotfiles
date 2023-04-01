local cmd = vim.cmd
local vim = vim
local M = {}
require('keymappings')
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

require('lazy').setup('plugins', { defaults = { lazy = false } })
-- install lazy plugin manager ends.

-- require("user.colorschemes.night_fox")
-- require("user.colorschemes.catppuccin")
-- require('user.colorschemes.tokyonight')
-- require("user.colorschemes.gruvbox")
-- vim.cmd('colorscheme oxocarbon')
require('user.colorschemes.onedarkpro')
require('settings')

require('user.lsp')
require('user.lsp.formatting.null-ls')
require('user.nvim-cmp')
require('user.treesitter')
require('user.autopairs')
require('user.nerd-commenter')
require('gitsigns-setup')
require('user.nvim-tree')
require('user.lualine')
require('user.telescope')
require('user.custom.case-transformation')
-- require('user.session-persistence')

return M
