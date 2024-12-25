local M = {}
local state = {
  float_win_id = -1,
  float_buf_id = -1
}

M.state = state


local function open_floating_window()
  -- Get the dimensions of the Neovim window
  local ui = vim.api.nvim_list_uis()[1]
  local width = ui.width
  local height = ui.height

  -- Define the dimensions of the floating window
  local float_width = math.floor(width * 0.6)         -- 80% of the screen width
  local float_height = math.floor(height * 0.9)       -- 80% of the screen height
  local col = math.floor((width - float_width) / 2)   -- Center horizontally
  local row = math.floor((height - float_height) / 2) -- Center vertically

  -- Create a floating window with the current buffer
  local opts = {
    relative = 'editor',
    width = float_width,
    height = float_height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded', -- Change to 'single', 'double', etc., for other border styles
  }

  state.float_buf_id = vim.api.nvim_get_current_buf();
  state.float_win_id = vim.api.nvim_open_win(0, true, opts) -- 0 indicates the current buffer

  vim.api.nvim_set_option_value("winhighlight", "Normal:TransparentBg",
    { win = state.float_win_id })
  vim.api.nvim_set_option_value("number", true, { win = state.float_win_id })
  vim.api.nvim_set_option_value("relativenumber", true, { win = state.float_win_id })


  -- if this floating window is closed or even just left, close the window.
  vim.api.nvim_create_autocmd("WinLeave", {
    group = vim.api.nvim_create_augroup("float-buf-win-leave", { clear = true }),
    buffer = state.float_buf_id,
    callback = function()
      if not vim.api.nvim_win_is_valid(state.float_win_id) or not vim.api.nvim_buf_is_valid(state.float_buf_id) then
        return;
      end
      vim.cmd("CloseFloat")
    end,
  })
end

local closeFloat = function()
  if state.float_win_id == nil or not vim.api.nvim_win_is_valid(state.float_win_id) then
    vim.notify("no managed float win found", vim.log.levels.WARN)
    return
  end
  vim.api.nvim_win_close(state.float_win_id, true) -- true to force close
  state.float_win_id = -1
  state.float_buf_id = -1
end
vim.api.nvim_create_user_command('OpenFloat', open_floating_window, {})
vim.api.nvim_create_user_command('CloseFloat', closeFloat, {})


vim.keymap.set("n", "<leader>of", ":OpenFloat<CR>", {})
vim.keymap.set("n", "<leader>cf", ":CloseFloat<CR>", {})


M.closeFloat = closeFloat
return M
