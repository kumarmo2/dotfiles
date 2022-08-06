local vim = vim;
local setKeyMap = vim.api.nvim_set_keymap;


local opts = { noremap = true, silent = true };
local actions = require "telescope.actions"
local pickers = require "telescope.pickers"

local conf = require("telescope.config").values
local finders = require "telescope.finders"

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
        -- check documentation for *vim.ui.select()*
        -- setting vim.ui.select to telescope
        ["ui-select"]= {
            require "telescope.themes".get_dropdown {}

        },

    }
}

-- check documentation for *vim.ui.select()*
require "telescope".load_extension("ui-select")

MyPicker = function ()
    local results = {}
    table.insert(results, "kumamor2")
    table.insert(results, "manya")

    pickers.new({}, {
        prompt_title = "Custom Picker",
        finder = finders.new_table(results),
        sorter = conf.generic_sorter({}),

        -- attach_mappings = function(_, map)
        -- map("i", "<CR>", actions.set_command_line)
        -- map("n", "<CR>", actions.set_command_line)
        -- map("n", "<C-e>", actions.edit_command_line)
        -- map("i", "<C-e>", actions.edit_command_line)

        -- TODO: Find a way to insert the text... it seems hard.
        -- map('i', '<C-i>', actions.insert_value, { expr = true })

        -- return true
        -- end,
    }):find()

end


PrintX2 = function ()
    print("hello")
end

setKeyMap('n', '<C-p>', ':Telescope find_files<CR>', opts);
setKeyMap('n', '<leader>;', ':Telescope buffers<CR>', opts);
setKeyMap('n', '<leader>fg', ':Telescope live_grep<CR>', opts);
-- setKeyMap('n', '<C-h>', ':Telescope help_tags<CR>', opts);

