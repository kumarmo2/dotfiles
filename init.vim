" highlight search terms
set hlsearch



" ignore case while searching
set ignorecase

" set relative numbers in line numbers
set rnu
set nu
set cursorline

" removes the -- INSERT --. Since i am using lightline plugin which anyways
" shows the mode in it.
set noshowmode

" turn off bells.
set visualbell


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
nnoremap <leader>ww :w<cr>

nnoremap <leader>wq :wq<cr>

nnoremap <leader>qq :q<cr>
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
inoremap {<space> {}<esc>i

" Create ending double quotes
inoremap "<space> ""<esc>i

" Create ending single qoutes
inoremap '<space> ''<esc>i

" create ending closing parentheses.
inoremap (<space> ()<esc>i

inoremap [<space> []<esc>i

" >>>>>> Common Autocomplete ends <<<<<<<

" >>>>>  fzf related key bindings starts <<<<<< 



" open files using fzf 
nnoremap <c-p> :Files<cr>

" shortcut for opening buffers using fzf
nnoremap <leader>; :Buffers<cr>

nnoremap <c-F> :Rg<cr>

nnoremap <leader>gs :G<CR>

" Close the current buffer(without closing the window)
nnoremap <SPACE>w :bd<CR>


" >>>>>  fzf related key bindings ends <<<<<< 

" >>>>>>>>>>> Key Mappings Ends <<<<<<<<<<<<<

syntax enable
filetype plugin indent on


" Plugins using `vim-plug`


call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox'
"Plug 'dracula/vim', { 'as': 'dracula' }

" highlights the yanked text.
Plug 'machakann/vim-highlightedyank'

Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-fugitive'

Plug 'dracula/vim', { 'as': 'dracula' }

" ranger plugin
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

"Plug 'sheerun/vim-polyglot'

call plug#end()

" Plugins end

" gruvbox colorscheme settings starts

autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

"colorscheme dracula


" gruvbox colorscheme settings ends


" >>>> lightline plugin settings start

set laststatus=2

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


" >>>>>> lightline plugin settings ends

" netrw settings starts

let g:netrw_winsize = 20
let g:netrw_banner = 0
"let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'


" netrw settings ends

let g:rnvimr_ex_enable = 1

nnoremap <space>r :RnvimrToggle<CR>


" coc settings starts

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" coc settings ends