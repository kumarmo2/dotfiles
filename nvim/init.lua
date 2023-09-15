local vim = vim
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

require('settings')
require('user.lsp')
require('user.lsp.formatting.null-ls')
require('user.nvim-cmp')
require('user.treesitter')
require('user.autopairs')
require('user.nerd-commenter')
require('user.nvim-tree')
require('user.telescope')
