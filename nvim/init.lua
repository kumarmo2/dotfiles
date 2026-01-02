require('keymappings')
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
require('lazy').setup('plugins', { defaults = { lazy = true } })

vim.g.markdown_fenced_languages = {
  'ts=typescript',
}
require('settings')
require('user.filetype')
require('user.commands')
require('user.float_focus')
require('user.terminal')
require('user.find_in_project')
require('user.split-resize')
require('user.lsp.lsp')
require('user.load_plugin')
