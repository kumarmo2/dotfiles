local cmd = vim.cmd

require('plugins')
require('settings')

-- TODO: migrate all vim files to lua
cmd('source ~/.config/nvim/vimfiles/coc.vim')
cmd('source ~/.config/nvim/vimfiles/coc-prettier.vim')

require('coc/init');
require('keymappings')
require('treesitter')
require('nerd-commenter')
require('gitsigns-setup')
require('fzf')
require('nvim-tree-setup')
require('toggleterm-setup')
require('onedark-setup')
require('lualine').setup()


 cmd('source ~/.config/nvim/vimfiles/omnisharp.vim')

