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

set clipboard=unnamedplus " Use system clipboard

" Move lines and blocks
nnoremap <C-K> :m -2<CR>
nnoremap <C-J> :m +1<CR>
vnoremap <C-K> :m -2<CR>gv
vnoremap <C-J> :m '>+1<CR>gv

" Ctags
set tags=./tags;/
noremap <Leader>]s :sp <CR>:exec("tag ".expand("<cword>"))<CR>
noremap <Leader>]v :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
noremap <Leader>]t :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Insert time
nnoremap <Leader>d "=strftime("%c")<CR>P

" NERDTree
let NERDTreeIgnore=['\~$', '\.pyc$']
noremap <F10> :NERDTreeFind<CR>
noremap <F12> :NERDTreeToggle<CR>

" Command T
set wildignore+=*.pyc,*.class,*.cache,*target/*,venv/*

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
noremap <Leader>s :SyntasticCheck<CR>

" Ack.vim
let g:ack_use_dispatch = 1
noremap <Leader>a :Ack! --known-types ""<Left>
