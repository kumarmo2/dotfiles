vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function(ev)
    vim.opt.number = false
    vim.opt.relativenumber = false;
    -- I am not exactly sure how this works, but below 2 lines make the window transparent.
    vim.api.nvim_win_set_option(0, "winhighlight", "Normal:TransparentBg")
    vim.cmd("highlight TransparentBg guibg=NONE")
  end
})

local directory_to_buf_id = {}

vim.keymap.set("n", "<leader>ft", function()
  local cwd = vim.fn.getcwd()
  local buf_id = directory_to_buf_id[cwd]
  local term_available = buf_id ~= nil and buf_id ~= -1
  local win_height = vim.api.nvim_win_get_height(0)
  local win_width = vim.api.nvim_win_get_width(0)
  if not term_available then
    directory_to_buf_id[cwd] = vim.api.nvim_create_buf(false, false)
  end
  vim.api.nvim_open_win(directory_to_buf_id[cwd], true, {
    relative = 'editor',
    width = win_width - 4,
    height = win_height - 4,
    col = 2, -- / 2,
    row = 2, -- / 2,
    -- style = 'minimal',
    border = 'rounded'
  });
  local tmux_session = "nvim-ft-" .. cwd
  local cmd = "terminal tmux attach-session -t " .. tmux_session .. " || tmux new-session -s " .. tmux_session
  if not term_available then
    vim.cmd(cmd)
  end
  vim.cmd("startinsert")
end)
