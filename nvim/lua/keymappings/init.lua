-- set function ref to make it easier

local setKeyMap = vim.api.nvim_set_keymap

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
setKeyMap('n', '<C-h>', '<C-w>h', opts)
setKeyMap('n', '<C-j>', '<C-w>j', opts)
setKeyMap('n', '<C-k>', '<C-w>k', opts)
setKeyMap('n', '<C-l>', '<C-w>l', opts)

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
setKeyMap('n', '<leader>bd', ':bdelete<CR>', opts)

-- quickfix list starts
setKeyMap('n', '<leader>cc', ':copen<CR>', opts)
setKeyMap('n', '<leader>co', ':colder<CR>:copen<CR>', opts)
setKeyMap('n', '<leader>cn', ':cnewer<CR>:copen<CR>', opts)

-- quickfix list ends

-- better visual indenting
setKeyMap('v', '<', '<gv', opts) --gv reselects last visual selection
setKeyMap('v', '>', '>gv', opts)

setKeyMap('v', 'J', ':m \'>+1<CR>gv=gv', opts) -- gv reselects last visual selection
setKeyMap('v', 'K', ':m \'<-2<CR>gv=gv', opts)

-- select current line visually while in normal mode
setKeyMap('n', 'vv', 'zzV', opts)
-- setKeyMap('n', 'vx', ':lua require("stackmap").select()<CR>', { noremap = true });

setKeyMap('n', '<leader>ss', ':so %<CR>', opts)

-- copy pasta bindings
setKeyMap('v', 'Y', '"+y', opts)
setKeyMap('n', '<leader>p', '""p', opts)  -- paste from unnamed register
setKeyMap('n', '<leader>P', '""P', opts)  -- paste from unnamed register
setKeyMap('n', 'p', '"0p', opts)          -- paste from 0 register(this is the most recent yank)
setKeyMap('n', 'P', '"0P', opts)          -- paste from 0 register(this is the most recent yank)
setKeyMap('n', '<leader>gp', '"+p', opts) -- paste from + register(this is paste from system clipboard)
setKeyMap('n', '<leader>gP', '"+P', opts) -- paste from + register(this is paste from system clipboard)


-- terminal binding
setKeyMap("t", "<esc><esc>", "<C-\\><C-n>", opts)
