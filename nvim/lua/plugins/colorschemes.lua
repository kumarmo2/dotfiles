return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 10000,
    event = 'VeryLazy',
    config = function()
      -- setup must be called before loading the colorscheme
      -- Default options:
      local g = require('gruvbox')
      require('gruvbox').setup({
        undercurl = false,
        underline = false,
        bold = true,
        italic = {
          strings = false,
          operators = false,
          comments = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = '', -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {
          ['@keyword.import.rust'] = { fg = g.palette.bright_red },
          ['@lsp.type.namespace.rust'] = { fg = g.palette.bright_aqua },
        },
        dim_inactive = false,
        transparent_mode = false,
      })
      vim.o.background = 'dark'
    end,
  },
  -- {
  --   'neanias/everforest-nvim',
  --   version = false,
  --   event = 'VeryLazy',
  --   priority = 1001, -- make sure to load this before all the other start plugins
  --   -- Optional; default configuration will be used if setup isn't called.
  --   config = function()
  --     require('everforest').setup({
  --       background = 'hard',
  --       transparent_background = true,
  --       transparent_background_level = 2
  --     })
  --   end,
  -- },
  -- {
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   event = 'VeryLazy',
  --   config = function()
  --     require('onedark').setup({
  --       -- Main options --
  --       style = 'dark',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  --       transparent = true,           -- Show/hide background
  --       term_colors = true,           -- Change terminal color as per the selected theme style
  --       ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
  --       cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
  --
  --       -- toggle theme style ---
  --       toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  --       toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between
  --
  --       -- Change code style ---
  --       -- Options are italic, bold, underline, none
  --       -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  --       code_style = {
  --         comments = 'italic',
  --         keywords = 'none',
  --         functions = 'none',
  --         strings = 'none',
  --         variables = 'none',
  --       },
  --
  --       -- Lualine options --
  --       lualine = {
  --         transparent = false, -- lualine center bar transparency
  --       },
  --
  --       -- Custom Highlights --
  --       colors = {},     -- Override default colors
  --       highlights = {}, -- Override highlight groups
  --
  --       -- Plugins Config --
  --       diagnostics = {
  --         darker = true,     -- darker colors for diagnostic
  --         undercurl = true,  -- use undercurl instead of underline for diagnostics
  --         background = true, -- use background color for virtual text
  --       },
  --     })
  --   end,
  -- },
}
