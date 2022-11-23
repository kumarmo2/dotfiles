-- set function ref to make it easier
local vim = vim
local setKeyMap = vim.api.nvim_set_keymap

-- set leader key to ','
vim.g.mapleader = ' '

local opts = { noremap = true, silent = true };

setKeyMap('n', '\\', ':noh<CR>', opts)

setKeyMap('n', '<Leader>ww', ':w<CR>', opts)
setKeyMap('n', '<Leader>wq', ':wq<CR>', opts)
setKeyMap('n', '<Leader>qq', ':q!<CR>', opts)
setKeyMap('n', '<C-Q>', ':q!<CR>', opts)
setKeyMap('n', '<C-s>', ':w<CR>', opts)
setKeyMap('i', '<C-s>', '<Esc>:w<CR>i', opts)
setKeyMap('n', '<Leader>qa', ':qa<CR>', opts)


-- prev buffer
setKeyMap('n', '<leader><leader>', '<C-^>', { noremap = true })


-- better window movement
setKeyMap('n', '<C-h>', '<C-w>h', opts)
setKeyMap('n', '<C-j>', '<C-w>j', opts)
setKeyMap('n', '<C-k>', '<C-w>k', opts)
setKeyMap('n', '<C-l>', '<C-w>l', opts)

-- tabs management
setKeyMap('n', '<leader>l', ':tabnext<CR>', opts)
setKeyMap('n', '<leader>h', ':tabprevious<CR>', opts)
-- nnoremap <leader>l :tabnext<CR>

-- buffers
-- delete current buffer.
setKeyMap('n', '<leader>dd', ':Bdelete<CR>', opts)

-- better visual indenting
setKeyMap('v', '<', '<gv', opts)
setKeyMap('v', '>', '>gv', opts)


setKeyMap('n', 'vx', ':lua require("stackmap").select()<CR>', { noremap = true });

setKeyMap('n', '<leader>ss', ':so %<CR>', { noremap = true })
setKeyMap('n', '<leader>th', ':Telescope help_tags<CR>', { noremap = true })
setKeyMap('n', 'D', '0d$', { noremap = true, silent = true })



-- toggle cmd height
setKeyMap('n', '<C-]>', ':lua toggle_cmd_height()<CR>', { noremap = true, silent = true })
