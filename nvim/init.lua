
local cmd = vim.cmd

require('settings')
require('plugins')
-- TODO: migrate all vim files to lua
cmd('source ~/.config/nvim/vimfiles/coc.vim')
cmd('source ~/.config/nvim/vimfiles/lightline.vim')
cmd('source ~/.config/nvim/vimfiles/preview-markdown.vim')
require('coc/init');
require('keymappings')
require('treesitter')
require('nerd-commenter')
require('night_fox')

cmd('source ~/.config/nvim/vimfiles/omnisharp.vim')

