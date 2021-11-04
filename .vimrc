" highlight search terms
set hlsearch
" ignore case while searching
set ignorecase

" set relative numbers in line numbers
set rnu
set nu

set nowrap

set tabstop=4
" set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent
" set incremental search. highlights as you type the search term.
set incsearch

" to keep the cursor in the middle of the page most of the time.
set scrolloff=999

set colorcolumn=120

set signcolumn=yes

set noswapfile
set nobackup

" enable hidden buffers. By default, if there are unsaved changes in your
" current buffer, and you try moving to some another buffer, vim won't let you
" do that. By setting `hidden` it enables this behavior.
set hidden

" >>>>>>>>>>> Key Mappings Starts <<<<<<<<<<<<<

let mapleader = ","

" :noh is `clear highlight until next search`

" clear search highlight on press of `\`
nnoremap \ :noh<return>

" save file on press of `<leader>w`
nnoremap <leader>w :w<cr>

nnoremap <leader>wq :wq<cr>

nnoremap <leader>q :q<cr>
nnoremap <leader>q! :q!<cr>

" `vertical split` on press of `<leader>vs`
nnoremap <leader>v<cr> :vs<cr>

" `horizontal split` on press of `<leader>hs`
nnoremap <leader>h<cr> :split<cr><c-w>j


" on press of 2 times leader key, go to previous buffer.
" Very helpful for quickly switching between 2 buffers.
nnoremap <leader><leader> <c-^>


" >>>>>> Common Autocomplete starts <<<<<<<

" Automatically complete create the closing curly braces.
inoremap {<cr> {}<esc>i<cr><esc>O

" Create ending double quotes
inoremap "<space> ""<esc>i

" Create ending single qoutes
inoremap '<space> ''<esc>i

" create ending closing parentheses.
inoremap (<space> ()<esc>i


" >>>>>> Common Autocomplete ends <<<<<<<

" >>>>>  fzf related key bindings starts <<<<<< 



" open files using fzf 
nnoremap <c-p> :Files<cr>

" shortcut for opening buffers using fzf
nnoremap <leader>; :Buffers<cr>

nnoremap <c-F> :Rg<cr>


" >>>>>  fzf related key bindings ends <<<<<< 

" >>>>>>>>>>> Key Mappings Ends <<<<<<<<<<<<<


" Plugins using `vim-plug`


call plug#begin('~/.vim/plugged')

" fuzzy searching.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox'


" highlights the yanked text.
Plug 'machakann/vim-highlightedyank'

Plug 'itchyny/lightline.vim'

call plug#end()

" gruvbox colorscheme settings starts

autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" gruvbox colorscheme settings ends


" Plugins end
"
" >>>> lightline plugin settings start

set laststatus=2

" >>>>>> lightline plugin settings ends

