return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
}
      )
    end
  },
  {
    'seblyng/roslyn.nvim',
    ft = 'cs',
    ---@module 'roslyn.config'
    opts = {},
  },
}
