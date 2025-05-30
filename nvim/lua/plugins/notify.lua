return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy',
  config = function()
    vim.notify = require('notify')
    require('notify').setup({
      merge_duplicates = true,
      background_colour = '#000000',
    })
  end,
}
