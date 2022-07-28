
-- global function to make the background opaque
set_opaque = function ()
    -- TODO: Shouldn't directly put the black here as blindly doing this can 
    -- will not look good with colorschemes beside gruvbox
    vim.cmd("hi Normal ctermbg=black guibg=black")
end

set_transparent = function ()
    vim.cmd("hi Normal ctermbg=none guibg=none")
end

vim.api.nvim_create_user_command("Opaque", 'lua set_opaque()', {})
vim.api.nvim_create_user_command("Transparent", 'lua set_transparent()', {})
