set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

if has("win32")
  cd $HOME
  set guifont=Consolas:h12:cANSI
endif

let g:nerdtree_tabs_open_on_gui_startup=0
