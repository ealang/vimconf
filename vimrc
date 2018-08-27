runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

let $VIMHOME=expand('<sfile>:p:h') " http://superuser.com/a/120011

set number

syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2

set foldmethod=indent
autocmd BufWinEnter * normal zR

set nowrap
set linebreak
set breakindent

set t_Co=256

" pull in color scheme from base16-shell
" https://github.com/chriskempson/base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
else
  colorscheme monokai
endif

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
imap <C-S> <C-O><C-S>
vmap <C-S> <ESC><C-S>gv

" Select all
nnoremap <C-A> ggVG
imap <C-A> <ESC><C-A>
vmap <C-A> <ESC><C-A>

" Copy/paste shortcuts
inoremap <C-C> <C-O>yy
nnoremap <C-C> yy
vnoremap <C-C> y

inoremap <C-X> <C-O>dd
nnoremap <C-X> dd
vnoremap <C-X> x

noremap <C-V> P
inoremap <C-V> <C-O>P

" Enable mouse
set mouse=a
set ttymouse=xterm2

" vim-tmux-navigator
inoremap <silent> <C-H> <ESC>:TmuxNavigateLeft<cr>
inoremap <silent> <C-L> <ESC>:TmuxNavigateRight<cr>
inoremap <silent> <C-J> <ESC>:TmuxNavigateDown<cr>
inoremap <silent> <C-K> <ESC>:TmuxNavigateUp<cr>

" Split management
set splitright
set splitbelow

nnoremap <C-W>< 10<C-W><
nnoremap <C-W>> 10<C-W>>
nnoremap <C-W>+ 5<C-W>+
nnoremap <C-W>- 5<C-W>-

" https://github.com/wesQ3/vim-windowswap#key-bindings
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <Leader>w :call WindowSwap#EasyWindowSwap()<CR>

" Ctags
set tags=tags; " Look for tags in cwd and parents

" Insert time
nnoremap <Leader>d "=strftime("%c")<CR>p

" NERDTree
let NERDTreeIgnore=['\~$', '\.pyc$', '\.class$', '^__pycache__$', '\.o$', '^node_modules$']
let NERDTreeMapJumpNextSibling = 0 " Prevent conflict with vim-tmux-navigator
let NERDTreeMapJumpPrevSibling = 0 " Prevent conflict with vim-tmux-navigator
let NERDTreeMapQuit = 0 " Binding already in use
let NERDTreeMapOpenSplit='<C-s>'
let NERDTreeMapOpenVSplit='<C-v>'
let NERDTreeMapOpenInTab='<C-t>'
set encoding=utf-8 " Fix garbled arrows

noremap <silent> <leader>e :e %:p:h<cr>

noremap <F10> <ESC>:NERDTreeFind<CR>
noremap <F12> <ESC>:NERDTreeToggle<CR>
imap <F10> <ESC><F10>
imap <F12> <ESC><F12>

" Allow multi-indent
vnoremap < <gv
vnoremap > >gv

" search
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>']
let g:qfenter_keymap.topen = ['<C-t>']
nnoremap <Leader>a :GrepperAck --known-types "<C-r>=expand('<cword>')<CR>"<Left>
vnoremap <Leader>a y:GrepperAck --known-types "<C-r>=fnameescape(@")<CR>"<Left>
nnoremap <Leader>A :GrepperAck --type="<C-R>=expand('%:e')<CR>" "<C-r>=expand('<cword>')<CR>"<Left>
vnoremap <Leader>A y:GrepperAck --type="<C-R>=expand('%:e')<CR>" "<C-r>=fnameescape(@")<CR>"<Left>

" YCM
nnoremap <leader>= :YcmCompleter GetType<CR>
nnoremap <leader><leader>= :YcmCompleter GetType<CR>
nnoremap <Leader><Leader>f :YcmCompleter FixIt<CR>
nnoremap <leader><Leader>b :YcmCompleter GoTo<CR>
nnoremap <leader><Leader>d :YcmCompleter GetDoc<CR>
nnoremap <leader><Leader>y :YcmCompleter<space>
let g:ycm_autoclose_preview_window_after_completion = 1

" CtrlP
let g:ctrlp_working_path_mode = 0 " Use cwd for search path
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 30
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '^\.git$\|\.hg$\|venv$\|target$\|build$\|node_modules$',
  \ 'file': '\.pyc$\|\.class$\|\.o$' }

noremap <Leader>f :CtrlP<CR>
noremap <Leader>F :CtrlPMRUFiles<CR>
noremap <Leader>t :CtrlPTag<CR>
noremap <Leader>b :CtrlPBuffer<CR>
noremap <Leader>g :CtrlPModified<CR>
noremap <Leader>G :CtrlPBranchModified<CR>

" Tagbar
noremap <Leader>r :TagbarOpenAutoClose<CR>/\c
noremap <Leader>R :TagbarToggle<CR>
let g:tagbar_foldlevel = 1
let g:tagbar_sort = 0

" Markdown
let g:vim_markdown_new_list_item_indent = 0 " avoid auto-indenting lists

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
" https://github.com/majutsushi/tagbar/wiki#typescript
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

" Close window shortcut
nnoremap q :q<CR>
nnoremap Q :qa<CR>
nnoremap <leader>m q

" Toggle spelling
nnoremap <F5> :setlocal spell! <CR>
imap <F5> <C-o><F5>
vmap <F5> <ESC><F5>gv

" Persistent undo
set undofile
set undodir=~/.vimundo

runtime vimrc-local
