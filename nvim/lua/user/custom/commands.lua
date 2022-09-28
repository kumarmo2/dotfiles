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

PrintSelectedContent = function ()
  -- [bufnum, lnum, col, off]
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local startLine = start_pos[2]
  local endLine = end_pos[2]

  print( "start_pos: " .. vim.inspect(start_pos));
  print( "startLine: " .. startLine);
  print( "end_pos: " .. vim.inspect(end_pos));
  print( "endLine: " .. endLine);

  -- need to subtract 1 from startline as indices are 0 based.
  local lines = api.nvim_buf_get_lines(0, startLine - 1, endLine, false);
  print("total number of lines selected: "..getTableLength(lines))

  for k, v in pairs(lines) do
    print("key: "..k.." value: "..v)
    if k == 1 then
      
    end
  end

  print(vim.inspect(lines))




end



api.nvim_create_user_command("Opaque", 'lua set_opaque()', {})
api.nvim_create_user_command("Transparent", 'lua set_transparent()', {})






