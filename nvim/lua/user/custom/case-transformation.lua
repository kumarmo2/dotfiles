local api = vim.api

--[
-- TODO:
--  - Visual Block mode handling. It only handles visual mode right now.
--]
local getTableLength = function(t)
  local length = 0
  if t == nil then
    return length
  end
  for _, _ in pairs(t) do
    length = length + 1
  end
  return length
end

local handleTransformForSingleLine = function(startRow, startCol, endCol, lower)
  local text = vim.api.nvim_buf_get_text(0, startRow, startCol, startRow, endCol, {})[1]
  local transformed

  if lower then
    transformed = string.lower(text)
  else
    transformed = string.upper(text)
  end

  vim.api.nvim_buf_set_text(0, startRow, startCol, startRow, endCol, { transformed })
end

local handleTransformForMultipleLine = function(startRow, startCol, endRow, endCol, lower)
  local newLines = {}
  local text = vim.api.nvim_buf_get_text(0, startRow, startCol, endRow, endCol, {})
  for k, v in pairs(text) do
    local transformed
    if lower then
      transformed = string.lower(v)
    else
      transformed = string.upper(v)
    end
    table.insert(newLines, transformed)
  end
  vim.api.nvim_buf_set_text(0, startRow, startCol, endRow, endCol, newLines)
end

local transform = function(lower)
  -- [BUFNUM, LNUM, col, off]
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local startLine = start_pos[2]
  local endLine = end_pos[2]

  -- need to subtract 1 from startline as indices are 0 based.
  local Lines = api.nvim_buf_get_lines(0, startLine - 1, endLine, false)
  local numberOfLines = getTableLength(Lines)

  local startRow = startLine - 1
  local startCol = start_pos[3] - 1
  local endRow = endLine - 1
  local endCol = end_pos[3] - 1

  if numberOfLines == 1 then
    handleTransformForSingleLine(startRow, startCol, endCol, lower)
  else
    handleTransformForMultipleLine(startRow, startCol, endRow, endCol, lower)
  end
end

ToUpper = function()
  transform(false)
end

ToLower = function()
  transform(true)
end

local setKeyMap = vim.api.nvim_set_keymap

setKeyMap("v", "<C-l>", ":lua ToLower()<CR>", {})
setKeyMap("v", "<C-u>", ":lua ToUpper()<CR>", {})

-- SDFKSDLF
-- SDFSDL LKSDF
