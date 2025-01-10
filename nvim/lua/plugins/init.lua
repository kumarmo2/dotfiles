return {
  'nvim-lua/plenary.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },
  {
    'windwp/nvim-ts-autotag',
    -- ft = { 'javascript', 'javascriptreact', 'html', 'typescript', 'typescriptreact' },
    lazy = false,
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          -- Defaults
          enable_close = true,         -- Auto close tags
          enable_rename = true,        -- Auto rename pairs of tags
          enable_close_on_slash = true -- Auto close on trailing </
        },
      })
    end,
  },
}
