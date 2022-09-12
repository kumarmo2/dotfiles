local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function(use)
    -- My plugins here
    use 'wbthomason/packer.nvim'
    -- use { 'junegunn/fzf', run = ' -> fzf#install()' }
    -- use 'junegunn/fzf.vim'

    -- use '/home/manya/code/nvim-plugins/practice-run.nvim'
    -- nvim tree
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- telescope 
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
   use {'nvim-telescope/telescope-ui-select.nvim' }
    use 'nvim-treesitter/playground'

    -- nvim cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'

    -- snippets
    use 'L3MON4D3/LuaSnip'

    -- lsp
    use 'neovim/nvim-lspconfig' -- enable lsp
    use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
    use 'simrat39/rust-tools.nvim'

    -- dap
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'

    -- formatting
    use 'sbdchd/neoformat'
    --
    -- code foldings
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

    use 'morhetz/gruvbox'
    use 'machakann/vim-highlightedyank'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'Omnisharp/Omnisharp-vim'

    use 'itchyny/vim-gitbranch'

    -- for better syntax highlighting
    use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate' }

    -- for commentings
    use 'preservim/nerdcommenter'

    -- nightfox and alike colorschemes
    use 'EdenEast/nightfox.nvim'
    use 'navarasu/onedark.nvim'
    -- git integrations.
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    use 'akinsho/toggleterm.nvim'

    use 'ellisonleao/glow.nvim'

    use 'famiu/bufdelete.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
