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

      vim.api.nvim_create_autocmd('VimEnter', {
        group = vim.api.nvim_create_augroup('FixLuaLineInvertColor', { clear = true }),
        callback = function()
          -- NOTE: This is a temporary fix for nvim 11.0. Once the fix is there, we can remove this `auto script`.
          vim.api.nvim_set_hl(0, 'StatusLine', { reverse = false })
          vim.api.nvim_set_hl(0, 'StatusLineNC', { reverse = false })
        end,
      })
    end,
  },
}
