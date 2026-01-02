local function column_widths_snapshot()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local cols = {}

  for _, win in ipairs(wins) do
    local pos = vim.fn.win_screenpos(win) -- {row, col}
    local col = pos[2]
    -- all windows in same column share width; save once
    if cols[col] == nil then
      cols[col] = vim.api.nvim_win_get_width(win)
    end
  end

  return cols
end

local function restore_column_widths(cols)
  local wins = vim.api.nvim_tabpage_list_wins(0)
  for _, win in ipairs(wins) do
    local pos = vim.fn.win_screenpos(win)
    local col = pos[2]
    local w = cols[col]
    if w then
      pcall(vim.api.nvim_win_set_width, win, w)
    end
  end
end

local function move_keep_slot_width(cmd)
  local cols = column_widths_snapshot()
  vim.cmd(cmd)
  restore_column_widths(cols)
end

-- replacements for the usual moves
vim.keymap.set("n", "<C-w>L", function() move_keep_slot_width("wincmd L") end, { silent = true })
vim.keymap.set("n", "<C-w>H", function() move_keep_slot_width("wincmd H") end, { silent = true })
vim.keymap.set("n", "<C-w>J", function() move_keep_slot_width("wincmd J") end, { silent = true })
vim.keymap.set("n", "<C-w>K", function() move_keep_slot_width("wincmd K") end, { silent = true })

vim.opt.equalalways = false
