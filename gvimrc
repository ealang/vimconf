set guioptions=c " terminal styling

let g:nerdtree_tabs_open_on_gui_startup=0

set spell

if has("win32")
  cd $HOME
endif

runtime gvimrc-local
