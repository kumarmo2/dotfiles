require "user.custom.au-commands"
local neovide_setup = require "user.custom.neovide"
local api = vim.api

local is_neovide = neovide_setup.is_neovide

if(is_neovide) then
    return
end


-- local bg = nil;
-- local hg = vim.api.nvim_get_hl_by_name("Normal", true)
-- print(vim.inspect(hg))

-- if (hg and hg.background) then
    -- bg = hg.background
-- end
-- print("bg below")
-- print(bg)




-- global function to make the background opaque
set_opaque = function ()
    local color = 'black'
    if (bg ~= nil) then
        color = bg
    end

    -- TODO: Shouldn't directly put the black here as blindly doing this can 
    -- will not look good with colorschemes beside gruvbox
    -- local cmd = "hi Normal ctermbg=" .. color .. " guibg=" .. color;
    local cmd = "hi Normal ctermbg=black guibg=black" ;
    vim.cmd(cmd)
    -- print(cmd)
end

set_transparent = function ()
  vim.cmd("hi Normal ctermbg=none guibg=none")
end


local getTableLength = function (t)
  local length = 0
  if t == nil then
    return length
  end
  for k, v in pairs(t) do
    length = length + 1
  end
  return length
end

-- local handleTransformForSingleLine = function ()
  
-- end

local transform = function (lower)
  -- [bufnum, lnum, col, off]
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local startLine = start_pos[2]
  local endLine = end_pos[2]

  -- lua vim.api.nvim_buf_set_text(0, 0, 0,0, 10, {'kumarmo2'}); 
  -- need to subtract 1 from startline as indices are 0 based.
  local Lines = api.nvim_buf_get_lines(0, startLine - 1, endLine, false);
  local numberOfLines = getTableLength(Lines)
  -- PRINT("TOTAL NUMBER OF LINES SELECTED: "..NUMBEROFLINES)

  -- [[
  -- cases:
  --  1. when startrow == endrow i.e numberoflines selected = 1
  --  2. when startrow != endrow i.e numberoflines selected > 1
  -- ]]

  local startRow = startLine - 1
  local startCol = start_pos[3] -1
  local endRow = endLine - 1
  local endCol = end_pos[3] - 1

  if numberOfLines == 1 then

    local text = vim.api.nvim_buf_get_text(0, startRow,startCol, startRow, endCol, {} )[1]
    local transformed;

    if lower then
      transformed = string.lower(text)
    else
      transformed = string.upper(text)
    end

    vim.api.nvim_buf_set_text(0, startRow,startCol, startRow, endCol, {transformed} )
  else
    -- print("todo: handling for multiple lines")
    -- print("startrow: "..startrow..", startcol: ".. startcol..", endrow: "..endrow.. ", endcol: "..endcol)
    local newLines = {}
    local text = vim.api.nvim_buf_get_text(0, startRow,startCol, endRow, endCol, {} )
    for k, v in pairs(text) do
      -- print("k: "..k..", v: "..v)
      local transformed;
      if lower then
        transformed = string.lower(v)
      else
        transformed = string.upper(v)
      end
      table.insert(newLines, transformed)
    end

    -- print(vim.inspect(newLines))




    --[
    -- - get text, using text = (0, startROW,STARTCOL, ENdrow, endcol, {} )
    -- - loop in array of text
    -- - get text, using text = (0, startrow,startcol, endrow, endcol, {} )
    -- - loop in array of text
    -- - GET TEXT, USING TEXT = (0, STARTROW,STARTCOL, ENDROW, ENDCOL, {} )
    -- - LOOP IN ARRAY OF TEXT
    --]
    --[
    -- - get text, using text = (0, startrow,startcol, endrow, endcol, {} )
    -- - loop in array of text
    --]
    --[
    -- - GET TEXT, USING TEXT = (0, STARTROW,STARTCOL, ENDROW, ENDCOL, {} )
    -- - LOOP IN ARRAY OF TEXT
    --]
    -- - get text, using text = (0, startRow,startCol, endRow, endCol, {} )
    -- - loop in array of text
    --]

    vim.api.nvim_buf_set_text(0, startRow,startCol, endRow, endCol, newLines )

  end


end


ToUpper = function ()
  transform(false)
end

ToLower = function ()
  transform(true)
end

api.nvim_create_user_command("Opaque", 'lua set_opaque()', {})
api.nvim_create_user_command("Transparent", 'lua set_transparent()', {})


local setKeyMap = vim.api.nvim_set_keymap

setKeyMap('v', '<C-l>', ':lua ToLower()<CR>', {})
setKeyMap('v', '<C-u>', ':lua ToUpper()<CR>', {})




