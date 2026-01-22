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

local tmux = vim.env.TMUX


require('user.float_focus')
if tmux == nil then
  require('user.terminal') -- use tmux floating terminal instead if available,
end
require('user.find_in_project')
require('user.split-resize')
require('user.lsp.lsp')
require('user.load_plugin')
require('user.build')
