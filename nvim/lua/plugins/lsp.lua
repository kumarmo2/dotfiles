return {
  'williamboman/mason.nvim',
  {
    'seblyng/roslyn.nvim',
    ft = 'cs',
    event = 'VeryLazy',
    ---@module 'roslyn.config'
    opts = {},
  },
}
