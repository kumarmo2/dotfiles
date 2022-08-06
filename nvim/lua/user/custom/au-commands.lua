local utils = require "utils"
local v = vim


local make_transparent = function ()
    v.cmd("hi Normal ctermbg=none guibg=none");
end

local open_file_on_startup_if_not_provided = function()
        local bufnr = v.api.nvim_get_current_buf()
        local bufname = v.api.nvim_buf_get_name(bufnr);
        print("bufnr: ".. bufnr)
        print("bufname: ".. bufname)
        if bufname == nil or bufname == '' then
            print("no buf name")
            utils.open_file_in_cur_dir()
        end
end


local vim_enter_setup = function ()
    make_transparent()
    open_file_on_startup_if_not_provided();
end


local group = v.api.nvim_create_augroup("vim_enter_setup", { clear = true });
v.api.nvim_create_autocmd("VimEnter", { group = group, callback = vim_enter_setup})

