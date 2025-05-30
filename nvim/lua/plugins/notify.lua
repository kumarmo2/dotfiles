return {
  'rcarriga/nvim-notify',
  lazy = false,
  config = function()
    vim.notify = require('notify')
    require('notify').setup({
      merge_duplicates = true,
      background_colour = '#000000',
    })
  end,
}
