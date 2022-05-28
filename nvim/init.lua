local cmd = vim.cmd

require('plugins')
require('settings')

-- TODO: migrate all vim files to lua

require('user/lsp')
require('user/nvim-cmp')
require('treesitter')
require('nerd-commenter')
require('gitsigns-setup')
require('nvim-tree-setup')
require('user.toggleterm')
require('lualine').setup()
require('user.neoformat')
require('keymappings')
require('user.telescope')

cmd('source ~/.config/nvim/vimfiles/omnisharp.vim')
