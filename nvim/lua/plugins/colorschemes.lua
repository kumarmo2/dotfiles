local vim = vim
return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 10000,
    config = function()
      -- setup must be called before loading the colorscheme
      -- Default options:
      require('gruvbox').setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          operators = true,
          comments = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = '', -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })
      vim.o.background = 'dark'
    end,
  },
  {
    'neanias/everforest-nvim',
    version = false,
    -- lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup({
        background = 'hard',
        -- Your config here
      })
    end,
  },
}
