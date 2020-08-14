
" ================ Vim Options Start =================
syntax on

set noerrorbells
set rnu
set nu

" for tabs and identation.
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab 
set smartindent 

set nowrap
set smartcase
set noswapfile
set incsearch

set cursorline " for highlighting the present line.


" When set, lets us switch to different buffers wihout first changing saving
" changes to current buffer.
set hidden 

set colorcolumn=160

highlight ColorColumn ctermbg=0 guibg=lightgrey

" ================ Vim Options End =================

" =================Custom keybindings Start=========

" List Buffers.
nnoremap <C-p> :ls<CR>

" Next buffer
nnoremap <C-n> :bn<CR> 

" Prev Buffer.
nnoremap <C-m> :bp<CR>

" TODO: close buffer without closing the split.
" TODO: figure out why # is not working here.
" nnoremap <C-d> :bp|bd #<CR>

nnoremap <C-S-E> :NERDTreeToggle<CR>



" =================Custom keybindings End=========


call plug#begin('~/.vim/plugged')

"============GUI Starts=================

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

"============GUI Ends=================

Plug 'scrooloose/syntastic'

Plug 'scrooloose/nerdtree'

Plug 'rust-lang/rust.vim'

Plug 'autozimu/LanguageClient-neovim', {
     \ 'branch': 'next',
     \ 'do': 'bash install.sh',
     \ }
Plug 'valloric/youcompleteme'


" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'


call plug#end()

colorscheme gruvbox
set background=dark

" Status Bar
set laststatus=2


" ======= Systastic Settings Start ================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1




" ======= Systastic Settings End ================

" Language Server Start

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
    \ }


" Rust Lang Server Settings Start

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
"
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:rustfmt_autosave = 1

" Rust Lang Server Settings End


" Language Server End


