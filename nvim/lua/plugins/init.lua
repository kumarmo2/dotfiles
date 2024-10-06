return {
  'nvim-lua/plenary.nvim',
  -- lsp
  {
    'windwp/nvim-autopairs',
    lazy = false,
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },
  {
    'windwp/nvim-ts-autotag',
    ft = { 'javascript', 'javascriptreact', 'html', 'typescript', 'typescriptreact' },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
}
