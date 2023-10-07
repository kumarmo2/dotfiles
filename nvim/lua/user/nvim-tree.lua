local vim = vim

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  print('could not find nvim-tree. returning...')
  return
end
-- local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
-- if not config_status_ok then
-- return
-- end

-- local tree_cb = nvim_tree_config.nvim_tree_callback

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

nvim_tree.setup({
  on_attach = on_attach,
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  respect_buf_cwd = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  renderer = {
    root_folder_modifier = ':t',
    icons = {
      webdev_colors = true,
      git_placement = 'before',
      padding = ' ',
      symlink_arrow = ' ➛ ',
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = '',
        symlink = '',
        folder = {
          arrow_closed = '',
          arrow_open = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
        git = {
          unstaged = '✗',
          staged = '✓',
          unmerged = '',
          renamed = '➜',
          untracked = '★',
          deleted = '',
          ignored = '◌',
        },
      },
    },
  },
  view = {
    width = 40,
    -- height = 30,
    side = 'right',
    number = false,
    relativenumber = false,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
    change_dir = {
      enable = false, -- if true, then your cwd is subject to be changed, which causes issue with other plugins like telescope which shows files under the "cwd" only.
    },
  },
})

-- if last window is nvim-tree. quit the nvim
-- local buf_enter_callback = function(opts)
-- if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match('NvimTree_') ~= nil then
-- vim.cmd('quit')
-- end
-- end

-- local group = vim.api.nvim_create_augroup('NvimTreeCloseIfLast', { clear = true })
-- vim.api.nvim_create_autocmd('BufEnter', { callback = buf_enter_callback, group = group })
