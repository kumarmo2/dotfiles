return {
  {
    'williamboman/mason.nvim',
    event = 'VeryLazy',
    config = function()
      require('mason').setup()
    end
  },
  {
    'seblyng/roslyn.nvim',
    ft = 'cs',
    event = 'VeryLazy',
    ---@module 'roslyn.config'
    opts = {},
  },
}
