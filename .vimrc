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
nnoremap <leader><CR> :q<CR>
nnoremap \ :noh<CR>
nnoremap <leader>ss :so%<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>n :Explore<CR>
nnoremap <leader><leader> :bprevious<CR>

" window management
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" split resizing
nnoremap _ :vertical resize -2<CR>
nnoremap + :vertical resize +2<CR>
nnoremap - :resize -2<CR>
nnoremap = :resize +2<CR>


" ----- Mappings ends 


filetype plugin on
colorscheme habamax

