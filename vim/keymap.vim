let mapleader = " "
nnoremap <leader><CR> :q<CR>
nnoremap \ :noh<CR>
nnoremap <leader>ss :so%<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>n :Lexplore<CR>
nnoremap <leader><leader> :bprevious<CR>

" window management
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h

" Table management
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>

" split resizing
nnoremap _ :vertical resize -2<CR>
nnoremap + :vertical resize +2<CR>
nnoremap - :resize -2<CR>
nnoremap = :resize +2<CR>


" fzf
nnoremap <leader>p :Files<CR>
nnoremap <leader>gp :GFiles<CR>
