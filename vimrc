runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

let $VIMHOME=expand('<sfile>:p:h') " http://superuser.com/a/120011

set number

syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=2

set foldmethod=syntax
autocmd BufWinEnter * normal zR

set nowrap
set linebreak
set breakindent

set t_Co=256
colorscheme monokai

set noswapfile

set statusline=%f%=%P " name of file in status
set laststatus=2

" load files changed outside vim
set autoread
autocmd FocusGained,BufEnter * silent! checktime

let mapleader = "\<Space>"

" Search options
set incsearch
set hlsearch
nnoremap / /\c
nnoremap ? ?\c
nnoremap <silent> <Leader>/ :nohlsearch<CR><C-L>

" Use system clipboard
if has("win32")
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

" Navigate wrapped lines intuitively
nnoremap j gj
nnoremap k gk

" Move lines and blocks
vnoremap <C-S-K> :m -2<CR>gv
vnoremap <C-S-J> :m '>+1<CR>gv

" Faster scrolling
nnoremap <C-Y> 3<C-Y>
nnoremap <C-E> 3<C-E>

" Save
noremap <C-S> :update<CR>
inoremap <C-S> <C-O>:update<CR>

" Enable mouse
set mouse=a
set ttymouse=xterm2

" vim-tmux-navigator
inoremap <silent> <C-H> <ESC>:TmuxNavigateLeft<cr>
inoremap <silent> <C-L> <ESC>:TmuxNavigateRight<cr>
inoremap <silent> <C-J> <ESC>:TmuxNavigateDown<cr>
inoremap <silent> <C-K> <ESC>:TmuxNavigateUp<cr>

" Ctags
set tags=tags; " Look for tags in cwd and parents

" Insert time
nnoremap <Leader>d "=strftime("%c")<CR>p

" NERDTree
let NERDTreeIgnore=['\~$', '\.pyc$', '\.class$', '^__pycache__$', '.o$']
let NERDTreeMapJumpNextSibling = 0 " Prevent conflict with vim-tmux-navigator
let NERDTreeMapJumpPrevSibling = 0 " Prevent conflict with vim-tmux-navigator
let NERDTreeMapOpenSplit='<C-s>'
let NERDTreeMapOpenVSplit='<C-v>'
let NERDTreeMapOpenInTab='<C-t>'
set encoding=utf-8 " Fix garbled arrows

noremap <F10> <ESC>:NERDTreeFind<CR>
noremap <F12> <ESC>:NERDTreeToggle<CR>
imap <F10> <ESC><F10>
imap <F12> <ESC><F12>

" Allow multi-indent
vnoremap < <gv
vnoremap > >gv

" Ale linting
let g:ale_python_flake8_options = '--ignore=E501,E302'   " 79 char limit, 2 line breaks
let g:ale_lint_delay = 1500
noremap <Leader>s :call ale#Lint()<CR>

" search
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']
vnoremap <Leader>a y:GrepperAck --known-types -i "<C-r>=fnameescape(@")<CR>"<Left>
nnoremap <Leader>a :GrepperAck --known-types -i "<C-r>=expand('<cword>')<CR>"<Left>

" CtrlP
let g:ctrlp_working_path_mode = 0 " Use cwd for search path
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 30
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|venv$\|target$\|build$',
  \ 'file': '\.pyc$\|\.class$\|\.o$' }

noremap <Leader>f :CtrlP<CR>
noremap <Leader>t :CtrlPTag<CR>
noremap <Leader>b :CtrlPBuffer<CR>

" Tagbar
noremap <Leader>r :TagbarOpenAutoClose<CR>/\c
noremap <Leader>R :TagbarToggle<CR>
let g:tagbar_foldlevel = 1
let g:tagbar_sort = 0

" https://github.com/majutsushi/tagbar/wiki#markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : $VIMHOME . '/support/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
" https://github.com/majutsushi/tagbar/wiki#restructuredtext
let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsbin' : $VIMHOME . '/support/rst2ctags/rst2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

" Close window shortcut
nnoremap Q q
nnoremap q :q<CR>

" Toggle spelling
nnoremap <F5> :setlocal spell! <CR>
imap <F5> <C-o><F5>
vmap <F5> <ESC><F5>gv
