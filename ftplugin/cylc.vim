" Simple indentation
setlocal autoindent

" Includes
setlocal include=^\\s*%include

" Comments start with `#`
setlocal commentstring=#%s
setlocal comments=:#
" ... so don't bother reindenting on `#`
setlocal indentkeys-=0#
setlocal cinkeys-=0#

" Don't autowrap text
setlocal formatoptions-=t
" Do format comments
setlocal formatoptions+=croql
