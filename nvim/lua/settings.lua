local vim = vim
local setOption = vim.api.nvim_set_option
local cmd = vim.cmd
vim.o.rnu = true
vim.o.nu = true
-- highlight search terms
vim.o.hlsearch = true
-- ignore cases while searching
vim.o.ignorecase = true
vim.o.incsearch = true
-- show cursor line
-- setOption('cursorline', true)
-- removes the -- INSERT --. Since i am using lightline plugin which anyways
-- shows the mode in it.
vim.o.showmode = false
vim.o.visualbell = true
vim.o.wrap = false
-- indentation behavior
setOption('tabstop',2)
vim.o.tabstop = 2
setOption('shiftwidth', 2)
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
-- mouse support on
vim.o.mouse = 'a'
-- using big value for `scrolloff`, you can keep the cursor at the
-- center
-- vim.o.scrolloff = 999
-- vim.o.colorcolumn = '120'
-- shorter way to global options
vim.o.swapfile = false
vim.o.backup = false
-- enable hidden buffers. By default, if there are unsaved changes in your
-- current buffer, and you try moving to some another buffer, vim won't let you
-- do that. By setting `hidden` it enables this behavior.
vim.o.hidden = true
vim.o.guifont = 'Caskaydia Cove Nerd Font'



setOption('syntax', 'enable')
setOption('filetype', 'on')
setOption('laststatus', 3)
vim.g.gruvbox_transparent_bg = '1'
cmd('colorscheme gruvbox')
-- cmd('colorscheme nordfox')
vim.o.cursorline = true
-- vim.o.background = 'dark'
vim.termguicolors = true
-- keep block cursor in normal, visual, command and insert modes.
cmd('set guicursor=n-v-c-i:block-Cursor')

