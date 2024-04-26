return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    lazy = false,
    config = function()
      local lualine = require('lualine')
      local config = {
        options = {
          theme = 'auto',
          component_separators = '|',
          section_separators = '',
          globalstatus = 3,
        },
      }
      lualine.setup(config)
    end,
  },
}
