local vim = vim;
local setKeyMap = vim.api.nvim_set_keymap;


local opts = { noremap = true, silent = true };
local actions = require "telescope.actions"

require('telescope').setup{
    defaults = {
        preview = false,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        },
        layout_strategy = 'horizontal',
        sorting_strategy = "ascending",
        layout_config = {
            height = 0.9,
            preview_cutoff = 10,
            prompt_position = "top",
            width = 0.8
          }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },
        extensions = {
            -- Your extension configuration goes here:
            -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
            }
        }

setKeyMap('n', '<C-p>', ':Telescope find_files<CR>', opts);
setKeyMap('n', '<leader>;', ':Telescope buffers<CR>', opts);
setKeyMap('n', '<leader>fg', ':Telescope live_grep<CR>', opts);
