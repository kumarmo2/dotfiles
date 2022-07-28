local cmd = vim.cmd
local M = {}
require('plugins')
require('user.night_fox')
require('settings')

-- TODO: migrate all vim files to lua

require('user/lsp')
require('user/nvim-cmp')
require('user.treesitter')
require('user/nerd-commenter')
require('gitsigns-setup')
require('user.nvim-tree')
require('user.toggleterm')
require('lualine').setup()
require('user.neoformat')
require('keymappings')
require('user.telescope')
require('user.dap')
require('user.custom.commands')

PrintX = function ()
    print("hello")
end

cmd('source ~/.config/nvim/vimfiles/omnisharp.vim')

return M
