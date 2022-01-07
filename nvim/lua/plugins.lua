local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
   use 'wbthomason/packer.nvim'
   use {'junegunn/fzf', run = ' -> fzf#install()'}
   use 'junegunn/fzf.vim'

   -- nvim tree
   use 'kyazdani42/nvim-web-devicons'
   use 'kyazdani42/nvim-tree.lua'


   use {'neoclide/coc.nvim', branch = 'release'}

   use 'morhetz/gruvbox'
   use 'machakann/vim-highlightedyank'

   -- using nvim-tree for file explorer
   -- use 'kevinhwang91/rnvimr'
   -- use 'sheerun/vim-polyglot'

   -- status line plugin
   use 'itchyny/lightline.vim'

   use 'Omnisharp/Omnisharp-vim'

   use {'dracula/vim', as = 'dracula'}

   use 'lunarvim/colorschemes'

   use 'flazz/vim-colorschemes'

   use 'itchyny/vim-gitbranch'

   -- for better syntax highlighting
   use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate'}

   -- for commentings
   use 'preservim/nerdcommenter'

   use 'joshdick/onedark.vim'

   -- nightfox and alike colorschemes
   use 'EdenEast/nightfox.nvim'

   -- git integrations.
   use {
       'lewis6991/gitsigns.nvim',
       requires = {
           'nvim-lua/plenary.nvim'
       },
   }

   use 'akinsho/toggleterm.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

