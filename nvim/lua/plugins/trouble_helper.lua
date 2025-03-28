local keys_to_command_map = {
  ['<leader>dt'] = ':Trouble diagnostics<CR>',
}

local utils = require("utils")
return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', name = 'nvim_tree_web_devicons' },
    lazy = true,
    keys = utils.get_keys(keys_to_command_map),
    config = function()
      local opts = { noremap = true, silent = false }
      require('trouble').setup({})

      for k, v in pairs(keys_to_command_map) do
        vim.api.nvim_set_keymap('n', k, v, opts);
        -- vim.keymap.set('n', k, v, opts)
      end
    end,
  },
}
