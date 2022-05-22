-- set function ref to make it easier
local vim = vim
local setKeyMap = vim.api.nvim_set_keymap

-- set leader key to ','
vim.g.mapleader = ' '

-- create closing parentheses/brackets etc starts.

setKeyMap('i', '(', '()<Esc>i', { noremap = true, silent = true })
setKeyMap('i', '{', '{}<Esc>i', { noremap = true, silent = true })
setKeyMap('i', '[', '[]<Esc>i', { noremap = true, silent = true })
setKeyMap('i', '<', '<><Esc>i', { noremap = true, silent = true })
setKeyMap('i', "'", "''<Esc>i", { noremap = true, silent = true })
setKeyMap('i', "\"", "\"\"<Esc>i", { noremap = true, silent = true })

-- create closing parentheses/brackets etc starts.

setKeyMap('n', '\\', ':noh<CR>', { noremap = true, silent = true })

setKeyMap('n', '<Leader>ww', ':w<CR>', { noremap = true, silent = true })
setKeyMap('n', '<Leader>wq', ':wq<CR>', { noremap = true, silent = true })
setKeyMap('n', '<Leader>qq', ':q!<CR>', { noremap = true, silent = true })


-- prev buffer
setKeyMap('n', '<leader><leader>', '<C-^>', { noremap = true })


-- better window movement
setKeyMap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
setKeyMap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
setKeyMap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
setKeyMap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- buffers
-- delete current buffer.
setKeyMap('n', '<leader>dd', ':Bdelete<CR>', { noremap = true, silent = true })

-- better visual indenting
setKeyMap('v', '<', '<gv', { noremap = true, silent = true })
setKeyMap('v', '>', '>gv', { noremap = true, silent = true })


-- fzf bindings

setKeyMap('n', '<C-p>', ':Files<CR>', { noremap = true })
setKeyMap('n', '<leader>;', ':Buffers<CR>', { noremap = true })
setKeyMap('n', '<leader>f', ':Rg<CR>', { noremap = true })

