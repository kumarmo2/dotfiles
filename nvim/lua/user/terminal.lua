vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false;
    -- require("user.float_focus").closeFloat()
    -- I am not exactly sure how this works, but below 2 lines make the window transparent.
    vim.api.nvim_win_set_option(0, "winhighlight", "Normal:TransparentBg")
    vim.cmd("highlight TransparentBg guibg=NONE")
  end
})

local directory_to_buf_id = {}

local function tmux_session_exists(session_name)
  local cmd = string.format("tmux has-session -t %s 2>/dev/null", session_name)
  local _ = vim.fn.system(cmd)
  return vim.v.shell_error == 0 -- Check exit code
end

vim.keymap.set("n", "<leader>ft", function()
  local cwd = vim.fn.getcwd()
  local buf_id = directory_to_buf_id[cwd]
  local term_available = buf_id ~= nil and buf_id ~= -1
  local win_height = vim.api.nvim_win_get_height(0)
  local win_width = vim.api.nvim_win_get_width(0)
  if not term_available then
    directory_to_buf_id[cwd] = vim.api.nvim_create_buf(false, false)
  end

  -- require("user.float_focus").closeFloat()

  local ui = vim.api.nvim_list_uis()[1]
  local width = ui.width
  local height = ui.height
  local float_width = math.floor(width * 0.95)        -- x% of the screen width
  local float_height = math.floor(height * 0.90)      -- x% of the screen height
  local col = math.floor((width - float_width) / 2)   -- Center horizontally
  local row = math.floor((height - float_height) / 2) -- Center vertically

  vim.api.nvim_open_win(directory_to_buf_id[cwd], true, {
    relative = 'editor',
    width = float_width,
    height = float_height,
    col = col, -- / 2,
    row = row, -- / 2,
    border = 'single'
  });
  local tmux_session = "nvim-ft-" .. cwd
  tmux_session = string.gsub(tmux_session, "%.", "_")
  local is_tmux_session_available = tmux_session_exists(tmux_session)
  local tmux_cmd = nil

  if is_tmux_session_available then
    tmux_cmd = "tmux attach-session -t " .. tmux_session
  else
    tmux_cmd = "tmux new-session -s " .. tmux_session
  end

  vim.cmd("terminal " .. tmux_cmd)
  vim.cmd("startinsert")
end)
