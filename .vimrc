" set options starts.
set nu
set rnu
set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
" set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
" set undofile
set incsearch  " highlight words as they are searched
set ignorecase " case insensitive search.
set hlsearch
set path+=** " look into directory's subdirectories and their subdirectories.
set cursorline

set wildmode=longest,list,full "in normal mode, the tab completion will show options
set wildmenu

" set options ends.

" ----- Mappings starts 

let mapleader = " "
nnoremap <leader><CR> :qa<CR>
nnoremap \ :noh<CR>
nnoremap <leader>ss :so%<CR>
nnoremap <leader>n :Explore<CR>

" ----- Mappings ends 


filetype plugin on
colorscheme habamax

