" highlight search terms
set hlsearch

" ignore case while searching
set ignorecase

" set relative numbers in line numbers
set rnu


" >>>>>>>>>>> Key Mappings Starts <<<<<<<<<<<<<

let mapleader = ","

" :noh is `clear highlight until next search`

" clear search highlight on press of `\`
nnoremap \ :noh<return>

" save file on press of `<leader>w`
nnoremap <leader>w :w<cr>

" `vertical split` on press of `<leader>vs`
nnoremap <leader>vs :vs<cr>

" `horizontal split` on press of `<leader>hs`
nnoremap<leader>hs :split<cr>


" >>>>>>>>>>> Key Mappings Ends <<<<<<<<<<<<<


" Plugins using `vim-plug`


call plug#begin('~/.vim/plugged')


call plug#end()



