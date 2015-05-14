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

" ctags
set tags=./tags;/
map <Leader>]s :sp <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>]v :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>]t :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Insert time
nnoremap <Leader>d "=strftime("%c")<CR>P

" NERDTree
let NERDTreeIgnore=['\~$', '\.pyc$']
map <F10> :NERDTreeFind<CR>
map <F12> :NERDTreeToggle<CR>

" Command T
set wildignore+=*.pyc,*.class,*.cache,*target/*,venv/*

" allow multi-indent
vnoremap < <gv
vnoremap > >gv

" Syntastic recommended defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
"let g:syntastic_python_checker_args='--ignore=E501' " 79 char limit
let g:syntastic_python_flake8_args='--ignore=E501'
