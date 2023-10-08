return {
  'kyazdani42/nvim-tree.lua',
  'nvim-lua/plenary.nvim',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-live-grep-args.nvim' },
  },
  'nvim-telescope/telescope-ui-select.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lsp',
  -- snippets
  'L3MON4D3/LuaSnip',
  -- lsp
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig', -- enable lsp
  -- use("williamboman/nvim-lsp-installer") -- simple to use language server installer
  'jose-elias-alvarez/null-ls.nvim', -- for better formatting
  'Hoffs/omnisharp-extended-lsp.nvim',
  { 'simrat39/rust-tools.nvim', lazy = false },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },

  -- colorschemes starts
  -- "priority": applicable for plugins with lazy = false. useful for loading certain plugins first.
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 900,
    lazy = true,
  },
  { 'folke/tokyonight.nvim', priority = 901, lazy = true },
  { 'EdenEast/nightfox.nvim', priority = 903, lazy = true },
  { 'nyoom-engineering/oxocarbon.nvim', priority = 904, lazy = true },
  { 'olimorris/onedarkpro.nvim', priority = 902, lazy = true },
  -- colorschemes ends

  { 'machakann/vim-highlightedyank', lazy = false },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
  },

  -- for better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  },
  -- 'nvim-treesitter/playground',
  -- for commentings
  { 'preservim/nerdcommenter', lazy = false },

  -- nightfox and alike colorschemes

  'famiu/bufdelete.nvim',
  {
    'Exafunction/codeium.vim',
    lazy = false,
    event = 'BufEnter',
    config = function()
      -- Change '<C-g>' here to any keycode you like.
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
  -- {
  {
    'folke/zen-mode.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
