local v = vim
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

M.count_items = count_items

return M
