local hight_au_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = hight_au_group,
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false;
    vim.opt.relativenumber = false;
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, true), "n", false) -- enter the insert mode.
    -- I am not exactly sure how this works, but below 2 lines make the window transparent.
    vim.api.nvim_win_set_option(0, "winhighlight", "Normal:TransparentBg")
    vim.cmd("highlight TransparentBg guibg=NONE")
  end
})

local ft_buf = -1
vim.keymap.set("n", "<leader>ft", function()
  local term_available = ft_buf ~= -1
  local win_height = vim.api.nvim_win_get_height(0)
  local win_width = vim.api.nvim_win_get_width(0)
  if not term_available then
    ft_buf = vim.api.nvim_create_buf(false, false)
  end
  vim.api.nvim_open_win(ft_buf, true, {
    relative = 'editor',
    width = win_width - 4,
    height = win_height - 4,
    col = 2, -- / 2,
    row = 2, -- / 2,
    -- style = 'minimal',
    border = 'rounded'
  });
  if not term_available then
    vim.cmd("terminal tmux attach-session -t nvim-ft || tmux new-session -s nvim-ft")
  end
end)
