local M = {}

local count_items = function(iter)
  local count = 0
  while true do
    local next_item = iter()
    if next_item == nil then
      return count
    end
    count = count + 1
  end
  return count
end

local contains = function(tbl, val)
  for _, v in pairs(tbl) do
    if v == val then
      return true
    end
  end
  return false
end

local get_keys = function(tbl)
  local keys = {}
  for key, _ in pairs(tbl) do
    table.insert(keys, key)
  end
  return keys
end

M.count_items = count_items
M.contains = contains
M.get_keys = get_keys

return M
