colorscheme koehler

set guifont=Consolas:h14:cANSI

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

if has("win32")
  cd $HOME
  " http://www.vim.org/scripts/script.php?script_id=2596
  map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif
