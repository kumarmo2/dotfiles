return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    lazy = false,
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
