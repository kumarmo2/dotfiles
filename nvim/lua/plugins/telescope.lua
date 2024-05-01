local keys_to_command_map = {
  ['<leader>p'] = ':Telescope find_files<CR>',
  ['<leader>;'] = ':Telescope buffers<CR>',
  ['<leader>fg'] = ':Telescope live_grep<CR>',
  ['<leader>gf'] = ':Telescope git_files<CR>',
  ['<leader>bf'] = ':lua require(\'telescope.builtin\').current_buffer_fuzzy_find()<CR>',
  ['<leader>th'] = ':Telescope help_tags<CR>',
}
local keys = vim.tbl_keys(keys_to_command_map)
return {
  'nvim-telescope/telescope-ui-select.nvim',
  {
    'nvim-telescope/telescope.nvim',
    keys = keys,
    dependencies = {
      'nvim-lua/plenary.nvim',
      {

        -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
    },
    config = function()
      local setKeyMap = vim.keymap.set
      local opts = { noremap = true, silent = true }
      local actions = require('telescope.actions')

      require('telescope').setup({
        defaults = {
          preview = true,
          mappings = {
            i = {
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
            },
          },
          layout_strategy = 'horizontal',
          sorting_strategy = 'ascending',
          layout_config = {
            height = 0.9,
            preview_cutoff = 10,
            prompt_position = 'top',
            width = 0.8,
          },
        },
        extensions = {
          -- check documentation for *vim.ui.select()*
          -- setting vim.ui.select to telescope
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({}),
          },
          live_grep_args = {
            auto_quoting = true,
            mappings = { -- extend mappings
            },
          },
        },
      })

      require('telescope').load_extension('ui-select')
      for k, v in pairs(keys_to_command_map) do
        setKeyMap('n', k, v, opts)
      end
    end,
  },
}
