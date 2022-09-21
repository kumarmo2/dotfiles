local utils = require "utils"
local v = vim


local make_transparent = function ()
    v.cmd("hi Normal ctermbg=none guibg=none");
end

local open_file_on_startup_if_not_provided = function()
        local bufnr = v.api.nvim_get_current_buf()
        local bufname = v.api.nvim_buf_get_name(bufnr);
        local is_directory = v.fn.isdirectory(bufname);
        print("bufnr: ".. bufnr)
        print("bufname: ".. bufname)
        print("isdirectory: ".. is_directory)

        if bufname == nil or bufname == '' or is_directory == 1 then -- TODO: also need to do the same if its a directory
            print("no buf name")
            -- TODO: the issue that is happening right now is that, when 
            -- file is openend using this method, either the filetype or lsp or both
            -- are not being able to get set because of which no colorscheme, lsp is being enabled.
            utils.open_file_in_cur_dir()
        end
end


local vim_enter_setup = function ()
   make_transparent()
    -- open_file_on_startup_if_not_provided();
end


local group = v.api.nvim_create_augroup("vim_enter_setup", { clear = true });
v.api.nvim_create_autocmd("VimEnter", { group = group, callback = vim_enter_setup})

