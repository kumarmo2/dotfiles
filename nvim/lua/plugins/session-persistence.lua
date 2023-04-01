local vim = vim
-- NOTE: the reason for not defining key bindings inside the "config" function is that,
-- this plugin is loaded only on "BufReadPre" event. So when the vim is started without any file input,
-- no file is being "Read" and the plugin is not loaded and hence "config" function is also not called.

-- restore the session for the current directory
vim.api.nvim_set_keymap('n', '<leader>qs', [[<cmd>lua require("persistence").load()<cr>]], {})

-- restore the last session
vim.api.nvim_set_keymap('n', '<leader>ql', [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

-- stop Persistence => session won't be saved on exit
vim.api.nvim_set_keymap('n', '<leader>qd', [[<cmd>lua require("persistence").stop()<cr>]], {})
return {
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    module = 'persistence',
    config = function()
      -- plugin for managing user session.
      -- plugin: https://github.com/folke/persistence.nvim
      require('persistence').setup()
    end,
  },
}
