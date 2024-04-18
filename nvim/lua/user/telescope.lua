local vim = vim
local setKeyMap = vim.keymap.set

local opts = { noremap = true, silent = true }
local actions = require('telescope.actions')
local lga_actions = require('telescope-live-grep-args.actions')
local action_state = require('telescope.actions.state')
local helpers = require('telescope-live-grep-args.helpers')
local Path = require('plenary.path')
local builtin = require('telescope.builtin')

local cur_live_grep_buf = 0 -- fg_buf is used to track the "current" buf number when live_grep was invoked.

function FILE_GREP_HANDLER()
  cur_live_grep_buf = vim.api.nvim_get_current_buf()
  require('telescope').extensions.live_grep_args.live_grep_args()
end

function FILE_GREP_UNDER_CURSOR_HANDLER()
  cur_live_grep_buf = vim.api.nvim_get_current_buf()
  require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()
end

function HELPER_QUOTE_PROMPT(prompt_bufnr)
  local prompt_opts = {
    quote_char = '"',
    postfix = ' ',
    trim = true,
  }

  local file = vim.api.nvim_buf_get_name(cur_live_grep_buf)
  local cwd = vim.loop.cwd()
  local relative_path = Path:new(file):make_relative(cwd)

  prompt_opts.postfix = ' --iglob ' .. relative_path

  local picker = action_state.get_current_picker(prompt_bufnr)
  local prompt = picker:_get_prompt()
  if prompt_opts.trim then
    prompt = vim.trim(prompt)
  end

  prompt = helpers.quote(prompt, { quote_char = prompt_opts.quote_char }) .. prompt_opts.postfix
  picker:set_prompt(prompt)
end

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

setKeyMap('n', '<leader>i', ':lua HELPER_QUOTE_PROMPT()<CR>', opts)

-- check documentation for *vim.ui.select()*
require('telescope').load_extension('ui-select')
require('telescope').load_extension('live_grep_args')

-- lua print(vim.api.nvim_buf_get_name(0))
setKeyMap('n', '<leader>p', ':Telescope find_files<CR>', opts)
setKeyMap('n', '<leader>;', ':Telescope buffers<CR>', opts)
-- setKeyMap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
setKeyMap('n', '<leader>fg', ':lua FILE_GREP_HANDLER()<CR>', opts)
setKeyMap('n', '<leader>gc', ':lua require(\'telescope-live-grep-args.shortcuts\').grep_word_under_cursor()<CR>', opts)
-- setKeyMap('n', '<leader>m', ':Telescope marks<CR>', opts)
setKeyMap('n', '<localleader>ws', ':lua require(\'telescope.builtin\').lsp_workspace_symbols()<CR>', opts) -- "ws" stands for "workspace symbols"
setKeyMap('n', '<leader>bf', builtin.current_buffer_fuzzy_find, opts)
-- setKeyMap('n', '<C-h>', ':Telescope help_tags<CR>', opts);
