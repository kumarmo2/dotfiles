return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    config = function()
      local lualine = require('lualine')
      local config = {
        options = {
          component_separators = '|',
          section_separators = '',
        },
      }
      lualine.setup(config)
    end,
  },
}
