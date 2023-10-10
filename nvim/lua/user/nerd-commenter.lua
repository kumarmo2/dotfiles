local v = vim
local setKeyMap = v.api.nvim_set_keymap

v.g.NERDSpaceDelims = true
local mapping_options = { noremap = true, silent = true }

setKeyMap('n', '<C-_>', '<plug>NERDCommenterToggle', mapping_options)
setKeyMap('v', '<C-_>', '<plug>NERDCommenterToggle', mapping_options)
setKeyMap('n', '<C-/>', '<plug>NERDCommenterToggle', mapping_options)
setKeyMap('v', '<C-/>', '<plug>NERDCommenterToggle', mapping_options)
setKeyMap('n', '<leader>/', '<plug>NERDCommenterToggle', mapping_options) -- For macos(shitos), as above keybindings not seem to be working on shitos
setKeyMap('v', '<leader>/', '<plug>NERDCommenterToggle', mapping_options) -- For macos(shitos), as above keybindings not seem to be working on shitos
