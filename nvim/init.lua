local cmd = vim.cmd

require('plugins')
require('settings')

-- TODO: migrate all vim files to lua

require('user/lsp')
require('user/nvim-cmp')
require('treesitter')
require('nerd-commenter')
require('gitsigns-setup')
require('fzf')
require('nvim-tree-setup')
require('toggleterm-setup')
require('lualine').setup()
require('user.neoformat')
require('keymappings')

cmd('source ~/.config/nvim/vimfiles/omnisharp.vim')
