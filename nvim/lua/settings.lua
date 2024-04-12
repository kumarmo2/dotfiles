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
-- removes the -- INSERT --. Since i am using lightline plugin which anyways
-- shows the mode in it.
vim.o.showmode = false
vim.o.visualbell = true
vim.o.wrap = true
-- indentation behavior
setOption('tabstop', 4)
vim.o.tabstop = 4
setOption('shiftwidth', 4)
vim.o.shiftwidth = 4
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
-- vim.o.autoread = true

setOption('syntax', 'enable')
setOption('laststatus', 3)
setOption('statuscolumn', '%l %r ')
-- vim.g.gruvbox_transparent_bg = '1'
cmd('colorscheme onedark')
-- vim.api.nvim_command("colorscheme catppuccin")
-- vim.api.nvim_command("colorscheme tokyonight")
-- cmd('colorscheme nordfox')
vim.o.cursorline = true
vim.o.background = 'dark'
vim.termguicolors = true
-- vim.o.ch = 0 -- set command heght to 0
-- keep block cursor in normal, visual, command and insert modes.
cmd('set guicursor=n-v-c-i:block-Cursor')
vim.o.cmdheight = 1
vim.opt.list = true
vim.opt.listchars:append('space:⋅')
vim.opt.listchars:append('eol:↴')
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.grepformat = '%f:%l:%c:%m'
