
local cmd = vim.cmd

-- cmd('source '..lua_files_path..'/plugins.lua')
--
cmd('source ~/.config/nvim/lua/settings.lua')
cmd('source ~/.config/nvim/lua/plugins.lua')
cmd('source ~/.config/nvim/lua/keymappings.lua')
cmd('source ~/.config/nvim/vimfiles/coc.vim')
cmd('source ~/.config/nvim/vimfiles/lightline.vim')
cmd('source ~/.config/nvim/vimfiles/preview-markdown.vim')
cmd('source ~/.config/nvim/lua/coc/init.lua')

cmd('autocmd FileType javascript nnoremap <buffer> <C-_> I//<ESC>')







