-- set function ref to make it easier
local vim = vim
local setKeyMap = vim.api.nvim_set_keymap
require('keymappings.toggle-cmdheight')

-- set leader key to ','
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local opts = { noremap = true, silent = true }

setKeyMap('n', '\\', ':noh<CR>', opts)

setKeyMap('n', '<Leader>w', ':w<CR>', opts)
setKeyMap('n', '<Leader><CR>', ':q<CR>', opts)

-- movements
setKeyMap('n', '<C-d>', '<C-d>zz', opts)
setKeyMap('n', '<C-u>', '<C-u>zz', opts)

-- buffers maps
setKeyMap('n', '<leader>bn', ':bnext<CR>', { noremap = true })
setKeyMap('n', '<leader>bp', ':bprevious<CR>', { noremap = true })
setKeyMap('n', '<leader><leader>', '<C-^>', { noremap = true })

-- better window movement
setKeyMap('n', '<Leader>h', '<C-w>h', opts)
setKeyMap('n', '<Leader>j', '<C-w>j', opts)
setKeyMap('n', '<Leader>k', '<C-w>k', opts)
setKeyMap('n', '<Leader>l', '<C-w>l', opts)

-- tabs management
setKeyMap('n', '<leader>tn', ':tabnext<CR>', opts)
setKeyMap('n', '<leader>tp', ':tabprevious<CR>', opts)
setKeyMap('n', '<leader>tc', ':tabclose<CR>', opts)
-- nnoremap <leader>l :tabnext<CR>

-- splits management starts
-- vertical splits resize
setKeyMap('n', '_', ':vertical resize -2<CR>', opts)
setKeyMap('n', '+', ':vertical resize +2<CR>', opts)

-- horizontal splits resize
setKeyMap('n', '-', ':resize -2<CR>', opts)
setKeyMap('n', '=', ':resize +2<CR>', opts)

-- splits management ends

-- buffers
-- delete current buffer.
setKeyMap('n', '<leader>dd', ':Bdelete<CR>', opts)

-- better visual indenting
setKeyMap('v', '<', '<gv', opts) --gv reselects last visual selection
setKeyMap('v', '>', '>gv', opts)

setKeyMap('v', 'J', ':m \'>+1<CR>gv=gv', opts) -- gv reselects last visual selection
setKeyMap('v', 'K', ':m \'<-2<CR>gv=gv', opts)

-- select current line visually while in normal mode
setKeyMap('n', 'vv', 'zzV', opts)
-- setKeyMap('n', 'vx', ':lua require("stackmap").select()<CR>', { noremap = true });

setKeyMap('n', '<leader>ss', ':so %<CR>', { noremap = true })
setKeyMap('n', '<leader>th', ':Telescope help_tags<CR>', { noremap = true })

-- toggle cmd height
setKeyMap('n', '<C-]>', ':lua toggle_cmd_height()<CR>', opts)

-- open nvim config folder in new tab
setKeyMap('n', '<leader>c', ':tabnew ~/configs/nvim/init.lua<CR>', opts)

-- neogit
