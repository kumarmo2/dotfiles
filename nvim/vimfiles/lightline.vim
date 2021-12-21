
" >>>> lightline plugin settings start

set laststatus=2

let g:lightline = {
      \ 'active': {
            \ 'left': [ [ 'mode', 'paste'],
            \           ['gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
