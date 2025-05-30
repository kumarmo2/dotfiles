local keys_to_handler = {
  ['<F5>'] = ':lua require(\'dap\').continue()<CR>',
  ['<F10>'] = ':lua require(\'dap\').step_over()<CR>',
  ['<F11>'] = ':lua require(\'dap\').step_into()<CR>',
  ['<F12>'] = ':lua require(\'dap\').step_out()<CR>',
  ['<Leader>b'] = ':lua require(\'dap\').toggle_breakpoint()<CR>',
}

local utils = require("utils")

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
    keys = utils.get_keys(keys_to_handler),
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      local setup_dapui = function()
        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end
        dapui.setup();
      end

      local set_key_maps = function()
        local opts = { noremap = true, silent = true }
        for k, v in pairs(keys_to_handler) do
          vim.api.nvim_set_keymap('n', k, v, opts)
        end
      end

      local configure_dap_for_languages = function()
        local dotnet_dap_setup = function()
          local dotnet_debugger_path = vim.fn.exepath("netcoredbg");

          if dotnet_debugger_path ~= nil then
            dap.adapters.coreclr = {
              type = 'executable',
              command = dotnet_debugger_path,
              args = { '--interpreter=vscode' }
            }
            dap.configurations.cs = {
              {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                  return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                end,
              },
            }
          end
        end

        local rust_dap_setup = function()
          local codelldb_path = vim.fn.exepath("codelldb");
          if codelldb_path == nil then
            return;
          end
          dap.adapters.codelldb = {
            type = 'server',
            port = "${port}",
            executable = {
              -- CHANGE THIS to your path!
              command = codelldb_path,
              args = { "--port", "${port}" },

              -- On windows you may have to uncomment this:
              -- detached = false,
            }
          }

          dap.configurations.rust = {
            {
              name = "Launch file",
              type = "codelldb",
              request = "launch",
              program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
              end,
              cwd = '${workspaceFolder}',
              stopOnEntry = false,
            },
          }
        end
        dotnet_dap_setup()
        rust_dap_setup();
      end

      set_key_maps();
      setup_dapui();
      configure_dap_for_languages();
    end,
    lazy = true
  }
}
