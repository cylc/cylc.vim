" Syntax highlighting for Cylc files.
" Author: Hilary Oliver, 2011-2014
" see :help syntax

" syncing from start of file is best, but may be slow for large files:
syn sync fromstart

set foldmethod=syntax
syn region myFold start='\_^ *\[\[\[\(\w\| \)' end='\ze\_^ *\[\{1,3}\(\w\| \)' transparent fold
syn region myFold start='\_^ *\[\[\(\w\| \)' end='\ze\_^ *\[\{1,2}\(\w\| \)' transparent fold
syn region myFold start='\_^ *\[\(\w\| \)' end='\_^ *\ze\[\(\w\| \)' transparent fold

" note contained items are only recognized inside containing items
syn match lineCon "\\$"
syn match badLineCon "\\ \+$"
syn match trailingWS " \+\(\n\)\@="

syn region jinja2 start='{%' end='%}'
syn region jinja2 start='{{' end='}}'
syn region jinja2 start='{#' end='#}'

syn region empy start='@\[' end=']'
syn region empy start='@{' end='}'
syn region empy start='@(' end=')'

syn region cylcSection start='\[' end='\]' contains=trailingWS,lineCon,badLineCon,jinja2,empy
syn region cylcSection start='\[\[' end='\]\]' contains=trailingWS,lineCon,badLineCon,jinja2,empy
syn region cylcSection start='\[\[\[' end='\]\]\]' contains=trailingWS,lineCon,badLineCon,jinja2,empy

syn match cylcItem ' *\zs\(\w\| \|\-\)*\> *=\@='
syn match cylcEquals '='

syn match trigger /=>/ contained
syn match output /:[a-zA-Z0-9-]*\>/ contained
syn match suicide /\!\w\+/ contained
syn match offset /\[.\{-}\]/ contained

"file inclusion:
syn match cylcInclude '%include *\(\w\|\-\|\/\|\.\)*'
"inlined file markers:
syn match cylcInclude '\_^!\{1,}'
syn match cylcInclude '.*\(START INLINED\|END INLINED\).*'

syn match cylcToDo /[Tt][Oo][Dd][Oo]/

syn match empyVariable /@[a-zA-Z0-9]\+/
syn match empyComment /@#.*/ contains=trailingWS,cylcToDo,lineCon,badLineCon
syn match cylcComment /#.*/ contains=trailingWS,cylcToDo,lineCon,badLineCon,jinja2,empy

syn region cylcString start=+'+ skip=+\\'+ end=+'+ contains=trailingWS,lineCon,badLineCon,jinja2,empy,cylcToDo
syn region cylcString start=+"+ skip=+\\"+ end=+"+ contains=trailingWS,lineCon,badLineCon,jinja2,empy,cylcToDo
syn region cylcString start=+=\@<= *"""+ end=+"""+ contains=trailingWS,lineCon,badLineCon,jinja2,empy,empyComment,cylcComment,trigger,output,suicide,offset,cylcToDo
syn region cylcString start=+=\@<= *'''+ end=+'''+ contains=trailingWS,lineCon,badLineCon,jinja2,empy,empyComment,cylcComment,trigger,output,suicide,offset,cylcToDo

"de-emphasize strings as quoting is irrelevant in cylc
hi def link cylcString Normal

hi def link cylcSection Statement
hi def link cylcItem Type
hi def link cylcComment Comment

hi def link lineCon Constant
hi def link badLineCon Error
hi def link trailingWS Underlined

hi def link cylcToDo Todo
hi def link cylcInclude MatchParen
hi def link jinja2 CursorColumn
hi def link empy CursorColumn
hi def link empyComment CursorColumn
hi def link empyVariable CursorColumn
hi def link cylcEquals LineNr
hi def link output Special
hi def link suicide Special
hi def link offset Special
hi def link trigger Constant
