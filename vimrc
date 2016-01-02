runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set number

syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=2

" Folds
set foldmethod=indent
autocmd BufWinEnter * normal zR

set nowrap
set linebreak

colorscheme monokai

set noswapfile

set statusline=%f " name of file in status

let mapleader = "\<Space>"

" Search options
set incsearch
set hlsearch
nnoremap <silent> <Leader>/ :nohlsearch<CR><C-L>  " https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim

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

" Save
noremap <C-S> :update<CR>
inoremap <C-S> <C-O>:update<CR>

" Enable mouse
set mouse=a

" vim-tmux-navigator
inoremap <silent> <C-H> <ESC>:TmuxNavigateLeft<cr>
inoremap <silent> <C-L> <ESC>:TmuxNavigateRight<cr>
inoremap <silent> <C-J> <ESC>:TmuxNavigateDown<cr>
inoremap <silent> <C-K> <ESC>:TmuxNavigateUp<cr>

" Ctags
set tags=tags; " Look for tags in cwd and parents
set hidden " Allow navigate without saving current buffer

" Insert time
nnoremap <Leader>d "=strftime("%c")<CR>P

" NERDTree
let NERDTreeIgnore=['\~$', '\.pyc$', '\.class$']
let NERDTreeMapJumpNextSibling = 0 " Prevent conflict with vim-tmux-navigator
let NERDTreeMapJumpPrevSibling = 0 " Prevent conflict with vim-tmux-navigator
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close if NERDTree is only window left

noremap <F10> <ESC>:NERDTreeFind<CR>
noremap <F12> <ESC>:NERDTreeToggle<CR>
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
let g:syntastic_python_flake8_args='--ignore=E501' " 79 char limit
let g:syntastic_mode_map = { "mode": "passive",
                           \ "active_filetypes": ["python"],
                           \ "passive_filetypes": [] }
noremap <Leader>s :w<CR>:SyntasticCheck<CR>

" Ack.vim
let g:ack_use_dispatch = 1
noremap <Leader>a :Ack! --known-types ""<Left>

" CtrlP and CtrlP-Funky
let g:ctrlp_working_path_mode = 0 " Use cwd for search path
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 30
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|venv$\|target$\|build$',
  \ 'file': '\.pyc$\|\.class$' }

noremap <Leader>f :CtrlP<CR>
noremap <Leader>t :CtrlPTag<CR>
noremap <Leader>b :CtrlPBuffer<CR>

" Tagbar
noremap <Leader>r :TagbarOpenAutoClose<CR>
noremap <Leader>R :TagbarToggle<CR>
let g:tagbar_foldlevel = 1

" Close window shortcut
nnoremap Q q
nnoremap q :q<CR>
