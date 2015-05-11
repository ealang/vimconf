runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set foldmethod=indent
set foldlevel=3

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

