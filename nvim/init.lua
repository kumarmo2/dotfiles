
local cmd = vim.cmd

require('settings')
require('plugins')

-- sdfsdf
-- TODO: migrate all vim files to lua
cmd('source ~/.config/nvim/vimfiles/coc.vim')
cmd('source ~/.config/nvim/vimfiles/lightline.vim')
require('coc/init');
require('keymappings')
require('treesitter')
require('nerd-commenter')
-- require('night_fox')
require('gitsigns-setup')
require('fzf')
require('nvim-tree-setup')
require('toggleterm-setup')

cmd('source ~/.config/nvim/vimfiles/omnisharp.vim')

