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

noremap <F10> <ESC>:NERDTreeFind<CR>:NERDTreeTabsOpen<CR>
noremap <F12> <ESC>:NERDTreeTabsToggle<CR>
imap <F10> <ESC><F10>
imap <F12> <ESC><F12>

" Allow multi-indent
vnoremap < <gv
vnoremap > >gv

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E302' " 79 char limit, 2 line breaks
let g:syntastic_mode_map = { "mode": "passive",
                           \ "active_filetypes": ["python", "javascript"],
                           \ "passive_filetypes": [] }
noremap <Leader>s :w<CR>:SyntasticCheck<CR>

" Ack.vim
let g:ack_use_dispatch = 1
nnoremap <Leader>a :Ack! --known-types -i "<C-r>=expand('<cword>')<CR>"<Left>
" search selection - http://stackoverflow.com/a/28011266
vnoremap <Leader>a y:Ack --known-types -i "<C-r>=fnameescape(@")<CR>"<Left>

" https://github.com/mileszs/ack.vim/blob/6ef28a1c0839415c0a1cfc40f22344da52d5404d/plugin/ack.vim#L29
let g:ack_mappings = { "<C-T>": "<C-W><CR><C-W>T",
                     \  "<C-S>": "<C-W><CR>",
                     \  "<C-V>": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t" }
" CtrlP and CtrlP-Funky
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

" P4
if !empty($P4ROOT)
  let g:perforce_auto_source_dirs = [$P4ROOT]
else
  let g:perforce_open_on_save = 0
endif

" Toggle spelling
nnoremap <F5> :setlocal spell! <CR>
imap <F5> <C-o><F5>
vmap <F5> <ESC><F5>gv
