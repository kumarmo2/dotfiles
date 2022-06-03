-- set function ref to make it easier
local vim = vim
local setKeyMap = vim.api.nvim_set_keymap

-- set leader key to ','
vim.g.mapleader = ' '

local opts = { noremap = true, silent = true };

-- create closing parentheses/brackets etc starts.

setKeyMap('i', '(', '()<Esc>i', opts)
setKeyMap('i', '{', '{}<Esc>i', opts)
setKeyMap('i', '[', '[]<Esc>i', opts)
setKeyMap('i', '<', '<><Esc>i', opts)
setKeyMap('i', "'", "''<Esc>i", opts)
setKeyMap('i', "\"", "\"\"<Esc>i", opts)

-- create closing parentheses/brackets etc starts.

setKeyMap('n', '\\', ':noh<CR>', opts)

setKeyMap('n', '<Leader>ww', ':w<CR>', opts)
setKeyMap('n', '<Leader>wq', ':wq<CR>', opts)
setKeyMap('n', '<Leader>qq', ':q!<CR>', opts)


-- prev buffer
setKeyMap('n', '<leader><leader>', '<C-^>', { noremap = true })


-- better window movement
setKeyMap('n', '<C-h>', '<C-w>h', opts)
setKeyMap('n', '<C-j>', '<C-w>j', opts)
setKeyMap('n', '<C-k>', '<C-w>k', opts)
setKeyMap('n', '<C-l>', '<C-w>l', opts)

-- buffers
-- delete current buffer.
setKeyMap('n', '<leader>dd', ':Bdelete<CR>', opts)

-- better visual indenting
setKeyMap('v', '<', '<gv', opts)
setKeyMap('v', '>', '>gv', opts)



setKeyMap('n', '<leader>ss', ':so %<CR>', { noremap = true })
setKeyMap('n', '<leader>th', ':Telescope help_tags<CR>', { noremap = true })


