local vim = vim
local setKeyMap = vim.keymap.set

local opts = { noremap = true, silent = true }
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

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
setKeyMap('n', '<leader>p', ':Telescope find_files<CR>', opts)
setKeyMap('n', '<leader>;', ':Telescope buffers<CR>', opts)
setKeyMap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
setKeyMap('n', '<localleader>ws', ':lua require(\'telescope.builtin\').lsp_workspace_symbols()<CR>', opts) -- "ws" stands for "workspace symbols"
setKeyMap('n', '<leader>bf', builtin.current_buffer_fuzzy_find, opts)
