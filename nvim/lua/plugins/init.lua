return {
  'nvim-lua/plenary.nvim',

  -- lsp
  {
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    config = function()
      require('fidget').setup({})
    end,
  },
  {
    'windwp/nvim-autopairs',
    lazy = false,
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },

  -- { 'machakann/vim-highlightedyank', lazy = false },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
    lazy = false,
  },

  {
    'Exafunction/codeium.vim',
    lazy = false,
    event = 'BufEnter',
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.g.codeium_enabled = false
      vim.keymap.set('i', '<C-g>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true })

      vim.keymap.set('i', '<c-;>', function()
        return vim.fn['codeium#CycleCompletions'](1)
      end, { expr = true })

      vim.keymap.set('i', '<c-,>', function()
        return vim.fn['codeium#CycleCompletions'](-1)
      end, { expr = true })

      vim.keymap.set('i', '<c-x>', function()
        return vim.fn['codeium#Clear']()
      end, { expr = true })
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
