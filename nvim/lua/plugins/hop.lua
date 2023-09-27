local vim = vim
return {
  {
    'smoka7/hop.nvim',
    version = '*',
    opts = {},
    config = function()
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      hop.setup()
      vim.keymap.set('', '<leader>/', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
      end, { remap = true })
    end,
  },
}
