local v = vim
local setKeyMap = v.api.nvim_set_keymap

v.g.NERDSpaceDelims = true
local mapping_options = { noremap = true, silent = true }

setKeyMap('n', '<C-_>', '<plug>NERDCommenterToggle', mapping_options)
setKeyMap('v', '<C-_>', '<plug>NERDCommenterToggle', mapping_options)

local is_neovide = v.g.neovide or false
if is_neovide then
  -- for neovide, the below mapping works
  setKeyMap('n', '<C-/>', '<plug>NERDCommenterToggle', mapping_options)
  setKeyMap('v', '<C-/>', '<plug>NERDCommenterToggle', mapping_options)
end
