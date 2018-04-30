set guioptions=c " terminal styling

if has("win32")
  cd $HOME
  set guifont=Consolas:h12:cANSI
endif

let g:nerdtree_tabs_open_on_gui_startup=0

set spell

runtime gvimrc-local
