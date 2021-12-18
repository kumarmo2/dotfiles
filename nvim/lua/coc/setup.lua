local fn = vim.fn
local cmd = vim.cmd


vim.o.encoding = 'utf-8'

-- " TextEdit might fail if hidden is not set.
vim.o.hidden = true

-- " Some servers have issues with backup files, see #649.
vim.o.backup = false
vim.o.writebackup = false



-- Give more space for displaying messages.
vim.o.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime = 300

-- " Don't pass messages to |ins-completion-menu|.
cmd('set shortmess+=c')

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
if fn.has('nvim-0.5.0') or fn.has('patch-8.1.1564') then
   vim.o.signcolumn = 'number' 
else
    vim.o.signcolumn = 'yes'
end





