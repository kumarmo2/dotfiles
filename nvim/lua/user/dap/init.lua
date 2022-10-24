local dap = require "dap"
local vim = vim

-- require'dapui'.setup()
--- golang starts ---
-- dap.adapters.go = {
  -- type = 'executable';
  -- command = 'node';
  -- args = {os.getenv('HOME') .. '/open-source/vscode-go/dist/debugAdapter.js'};
-- }

-- dap.configurations.go = {
  -- {
    -- type = 'go';
    -- name = 'Debug';
    -- request = 'launch';
    -- showLog = true;
    -- program = "${file}";
    -- dlvToolPath = vim.fn.exepath('/usr/bin/dlv')  -- Adjust to where delve is installed
  -- },
-- }

require'dap-go'.setup()
-- dap.adapters.delve = {
  -- type = 'server',
  -- port = '${port}',
  -- executable = {
    -- command = 'dlv',
    -- args = {'dap', '-l', '127.0.0.1:${port}'},
  -- }
-- }

-- -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
-- dap.configurations.go = {
  -- {
    -- type = "delve",
    -- name = "Debug",
    -- request = "launch",
    -- program = "${file}"
  -- },
  -- {
    -- type = "delve",
    -- name = "Debug test", -- configuration for debugging test files
    -- request = "launch",
    -- mode = "test",
    -- program = "${file}"
  -- },
  -- -- works with go.mod packages and sub packages 
  -- {
    -- type = "delve",
    -- name = "Debug test (go.mod)",
    -- request = "launch",
    -- mode = "test",
    -- program = "./${relativeFileDirname}"
  -- }
-- }
--- golang ends ---


--- csharp starts ---

-- dap.adapters.coreclr = {
  -- type = 'executable',
  -- command = '/home/manya/.dotnet/tools/netcoredbg/netcoredbg',
  -- args = {'--interpreter=vscode'}
-- }


-- dap.configurations.cs = {
  -- {
    -- type = "coreclr",
    -- name = "launch - netcoredbg",
    -- request = "launch",
    -- program = function()
        -- return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', '${file}')
    -- end,
  -- },
-- }

vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    local path = vim.fn.input('Path to your *proj file', default_path, 'file')
    vim.g['dotnet_last_proj_path'] = path
    local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
    print('')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print('\nBuild: ✔️ ')
    else
        print('\nBuild: ❌ (code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local request = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
            vim.g['dotnet_last_dll_path'] = request()
        end
    end

    return vim.g['dotnet_last_dll_path']
end

local config = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
            vim.g.dotnet_build_project()
        end
        return vim.g.dotnet_get_dll_path()
    end,
  },
}

dap.configurations.cs = config
dap.configurations.fsharp = config




--- csharp ends ---


local opts = { noremap = true, silent = false };
local key_map  = vim.api.nvim_set_keymap


key_map('n', '<F5>', ':lua require"dap".continue()<CR>', opts);
key_map('n', '<leader>bb', ':lua require"dap".toggle_breakpoint()<CR>', opts);

