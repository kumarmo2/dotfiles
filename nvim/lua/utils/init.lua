local v = vim
local M = {}

local count_items = function (iter)
    local count = 0;
    while true do
        local next_item = iter()
        if next_item == nil then
            return count
        end 
        count = count + 1
    end
    return count
end


local open_file_in_cur_dir = function ()
    local out = io.popen("find ./ -maxdepth 1 -type f") -- TODO: learn about io.popen lib.
    if out == nil then
        return
    end

    for file in out:lines() do -- TODO: checkout methods in lua.
        print("file:"..file)
        -- v.fn.bufload(file)
        -- v.api.nvim_set_current_buf(file)
        v.cmd("e " .. file)
        return;
    end
end


M.count_items = count_items;
M.open_file_in_cur_dir = open_file_in_cur_dir

return M;
