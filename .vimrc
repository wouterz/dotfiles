" Wouters vimrc

set modelines=1 " Enable file specific mods

" Spacing&Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
" }}}
" UI {{{
"colorrscheme badwolf         	" awesome colorscheme
syntax enable			" enable syntax processing
set number              " show line numbers
set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.

" toggle between number and relativenumber
function! TgNr()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Per-mode cursor shape
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
if has('unix')
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
elseif has('macuinx')
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif
" }}}
" Searching {{{
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
:nnoremap <leader><space> :nohlsearch<CR>
:inoremap jj <Esc>
" }}}
" Movement {{{
" move to beginning/end of line
:nnoremap B ^
:nnoremap E $

" highlight everything from last insert mode
:nnoremap gV `[v`]
" }}}
" Plugins {{{

"}}}

" vim:foldmethod=marker:foldlevel=0
