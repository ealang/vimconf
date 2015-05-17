function! ctrlp#funky#ft#python#filters()
  let filters = [
        \ { 'pattern': '\v\C^\s*(class\s+\w+\s*(\([^\)]+\))?|def\s+\w+\s*(\_.{-})):',
        \   'formatter': [] }
  \ ]
  return filters
endfunction
