-- set function ref to make it easier
local vim = vim
local setKeyMap = vim.api.nvim_set_keymap
require 'keymappings.toggle-cmdheight'

-- set leader key to ','
vim.g.mapleader = ' '

local opts = { noremap = true, silent = true };

setKeyMap('n', '\\', ':noh<CR>', opts)

setKeyMap('n', '<Leader>w', ':w<CR>', opts)
setKeyMap('n', '<Leader><CR>', ':q<CR>', opts)
setKeyMap('n', '<Leader>qq', ':q<CR>', opts)

-- movements
setKeyMap('n', '<C-d>', '<C-d>zz', opts)
setKeyMap('n', '<C-u>', '<C-u>zz', opts)

-- prev buffer
setKeyMap('n', '<leader><leader>', '<C-^>', { noremap = true })


-- better window movement
setKeyMap('n', '<Leader>h', '<C-w>h', opts)
setKeyMap('n', '<Leader>j', '<C-w>j', opts)
setKeyMap('n', '<Leader>k', '<C-w>k', opts)
setKeyMap('n', '<Leader>l', '<C-w>l', opts)

-- tabs management
setKeyMap('n', '<leader>]', ':tabnext<CR>', opts)
setKeyMap('n', '<leader>[', ':tabprevious<CR>', opts)
setKeyMap('n', '<leader>tc', ':tabclose<CR>', opts)
-- nnoremap <leader>l :tabnext<CR>

-- buffers
-- delete current buffer.
setKeyMap('n', '<leader>dd', ':Bdelete<CR>', opts)

-- better visual indenting
setKeyMap('v', '<', '<gv', opts)
setKeyMap('v', '>', '>gv', opts)


-- setKeyMap('n', 'vx', ':lua require("stackmap").select()<CR>', { noremap = true });

setKeyMap('n', '<leader>ss', ':so %<CR>', { noremap = true })
setKeyMap('n', '<leader>th', ':Telescope help_tags<CR>', { noremap = true })
setKeyMap('n', 'D', '0d$', { noremap = true, silent = true })



-- toggle cmd height
setKeyMap('n', '<C-]>', ':lua toggle_cmd_height()<CR>', { noremap = true, silent = true })


-- open nvim config folder in new tab
setKeyMap('n', '<leader>c', ':tabnew ~/configs/nvim/init.lua<CR>', { noremap = true, silent = true })

-- nvim tree
setKeyMap('n', '<Leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
setKeyMap('n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = false })
