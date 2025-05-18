local cmd = vim.cmd
vim.o.rnu = true
vim.o.nu = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.showmode = false -- statusline/plugin shows it
vim.o.visualbell = true
vim.o.wrap = true
-- indentation behavior
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
-- mouse support on
vim.o.mouse = 'a'
vim.cmd('set path+=**')
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
vim.o.syntax = 'enable'
vim.cmd.colorscheme('gruvbox')
-- vim.o.cursorline = true
vim.o.background = 'dark'
vim.termguicolors = true
-- keep block cursor in normal, visual, command and insert modes.
cmd('set guicursor=n-v-c-i:block-Cursor')
vim.o.cmdheight    = 1
vim.opt.list       = true
vim.opt.listchars  = { tab = '» ', trail = '-', lead = '.' }
vim.opt.grepprg    = 'rg --vimgrep'
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.signcolumn = 'yes'
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--vim.opt.clipboard = 'unnamedplus'
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff  = 10
vim.o.updatetime   = 2000 -- Check `CursorHold` event and updatetime friendly manual.


if vim.g.neovide then
  -- vim.keymap.set('n', '<D-s>', ':w<CR>')      -- Save
  vim.keymap.set('v', '<C-S-c>', '"+y')      -- Copy
  vim.keymap.set('n', '<C-S-v>', '"+P')      -- Paste normal mode
  vim.keymap.set('i', '<C-S-v>', '<esc>"+P') -- Paste normal mode
  vim.keymap.set('v', '<C-S-v>', '"+P')      -- Paste visual mode
end
