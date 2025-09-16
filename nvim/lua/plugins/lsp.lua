return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'seblyng/roslyn.nvim',
    ft = 'cs',
    ---@module 'roslyn.config'
    opts = {},
  },
}
