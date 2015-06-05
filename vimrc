runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set foldmethod=indent
set nofoldenable " no initial folding

set nowrap

set background=dark

set noswapfile

let mapleader = "\<Space>"

" Search options
set incsearch
set hlsearch
nnoremap <silent> <Leader>/ :nohlsearch<CR><C-L>  " https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim

" Copy & paste
set clipboard=unnamedplus " Use system clipboard

" Move lines and blocks
vnoremap <C-S-K> :m -2<CR>gv
vnoremap <C-S-J> :m '>+1<CR>gv

" Save
noremap <C-S> :update<CR>
inoremap <C-S> <C-O>:update<CR>

" Enable mouse
set mouse=a

" Ctags
set tags=./tags;/
noremap <Leader>]s :sp <CR>:exec("tag ".expand("<cword>"))<CR>
noremap <Leader>]v :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
noremap <Leader>]t :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Insert time
nnoremap <Leader>d "=strftime("%c")<CR>P

" NERDTree
let NERDTreeIgnore=['\~$', '\.pyc$']
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
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501' " 79 char limit
let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": [],
                           \ "passive_filetypes": ["scala"] }
noremap <Leader>s :w<CR>:SyntasticCheck<CR>

" Ack.vim
let g:ack_use_dispatch = 1
noremap <Leader>a :Ack! --known-types ""<Left>

" CtrlP and CtrlP-Funky
let g:ctrlp_working_path_mode = 0 " Use cwd for search path
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 30
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|venv$\|target$',
  \ 'file':  '\.pyc$' }

let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_nolim = 1

noremap <Leader>f :CtrlP<CR>
noremap <Leader>t :CtrlPTag<CR>
noremap <Leader>b :CtrlPBuffer<CR>
noremap <Leader>r :CtrlPFunky<CR>
