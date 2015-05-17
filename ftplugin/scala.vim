function! ctrlp#funky#ft#scala#filters()
  let filters = [
        \ { 'pattern': '\m\C^[\t ]*\(\w\+\)\?[\t ]*\(\[\w\+\]\)\?[\t ]*\(def\|class\|trait\|object\)[\t ]\+\S\+',
        \   'formatter': [] },
        \ { 'pattern': '\m\C^[\t ]*test',
        \   'formatter': [] }
  \ ]
  return filters
endfunction
