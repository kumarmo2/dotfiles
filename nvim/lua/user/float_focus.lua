local M = {}
local state = {
  float_win_id = -1,
  float_buf_id = -1,
  attached_buffs = {}, -- right now we are treating as array. maybe we can convert it
  -- to a map, if bottleneck is the lookup.
}

M.state = state

local bring_floating_window_in_focus = function()
  vim.api.nvim_set_current_win(state.float_win_id)
end

local counter = 0
local is_floating_window_available = function()
  return state.float_win_id ~= nil and vim.api.nvim_win_is_valid(state.float_win_id)
end

local function open_floating_window()
  -- Get the dimensions of the Neovim window
  if is_floating_window_available() then
    bring_floating_window_in_focus()
    return
  end
  local ui = vim.api.nvim_list_uis()[1]
  local width = ui.width
  local height = ui.height

  -- Define the dimensions of the floating window
  local float_width = math.floor(width * 0.65)        -- 80% of the screen width
  local float_height = math.floor(height * 0.95)      -- 80% of the screen height
  local col = math.floor((width - float_width) / 2)   -- Center horizontally
  local row = math.floor((height - float_height) / 2) -- Center vertically

  -- Create a floating window with the current buffer
  local opts = {
    relative = 'editor',
    width = float_width,
    height = float_height,
    col = col,
    row = row,
    zindex = 10,
    -- style = 'minimal',
    border = 'single', -- Change to 'single', 'double', etc., for other border styles
  }

  local curr_buff = vim.api.nvim_get_current_buf()
  state.float_buf_id = curr_buff
  state.float_win_id = vim.api.nvim_open_win(0, true, opts) -- 0 indicates the current buffer
  table.insert(state.attached_buffs, curr_buff)

  vim.api.nvim_set_option_value('winhighlight', 'Normal:TransparentBg', { win = state.float_win_id })
  vim.api.nvim_set_option_value('number', true, { win = state.float_win_id })
  vim.api.nvim_set_option_value('relativenumber', true, { win = state.float_win_id })

  vim.api.nvim_buf_set_keymap(state.float_buf_id, 'n', '<leader><cr>', ':CloseFloat<CR>', {})
end

local close_float = function()
  -- print("state.float_win_id", state.float_win_id)
  if state.float_win_id == nil or not vim.api.nvim_win_is_valid(state.float_win_id) then
    vim.notify('no managed float win found', vim.log.levels.WARN)
    return
  end
  for _, v in ipairs(state.attached_buffs) do
    pcall(vim.api.nvim_buf_del_keymap, v, 'n', '<leader><cr>') -- FIXME: we shouldn't be needing pcall if everything worked nicely.
    -- vim.api.nvim_buf_del_keymap(v, "n", "<leader><cr>")
  end
  vim.api.nvim_win_close(state.float_win_id, true) -- true to force close
end

vim.api.nvim_create_user_command('OpenFloat', open_floating_window, {})
vim.api.nvim_create_user_command('CloseFloat', close_float, {})

vim.keymap.set('n', '<leader>of', ':OpenFloat<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cf', ':CloseFloat<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    counter = counter + 1
    -- vim.notify(
    --   "called BufWinEnter: " ..
    --   tostring(counter) ..
    --   "state.float_win_id: " .. tostring(state.float_win_id) .. " curr_win: " .. tostring(vim.api.nvim_get_current_win()),
    --   vim.log.levels.WARN)
    if state.float_win_id == nil or not vim.api.nvim_win_is_valid(state.float_win_id) then
      return
    end
    local curr_win = vim.api.nvim_get_current_win()
    if curr_win ~= state.float_win_id then
      return
    end
    local new_buff = vim.api.nvim_get_current_buf()

    local table_contains = require('utils').contains
    if not table_contains(state.attached_buffs, new_buff) then
      table.insert(state.attached_buffs, new_buff)
    end
    vim.api.nvim_buf_set_keymap(new_buff, 'n', '<leader><cr>', ':CloseFloat<CR>', {})
    vim.api.nvim_set_option_value('winhighlight', 'Normal:TransparentBg', { win = curr_win })
    vim.api.nvim_set_option_value('number', true, { win = curr_win })
    vim.api.nvim_set_option_value('relativenumber', true, { win = curr_win })
  end,
})

M.closeFloat = close_float
return M
