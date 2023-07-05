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

syn region jinja2Block start='{%' end='%}'
syn region jinja2Print start='{{' end='}}'
syn region jinja2Comment start='{#' end='#}'

syn region empy start='@\[' end=']'
syn region empy start='@{' end='}'
syn region empy start='@(' end=')'

syn region cylcSection start='\[' end='\]' contains=trailingWS,lineCon,badLineCon,jinja2Block,jinja2Print,jinja2Comment,empy
syn region cylcSection start='\[\[' end='\]\]' contains=trailingWS,lineCon,badLineCon,jinja2Block,jinja2Print,jinja2Comment,empy
syn region cylcSection start='\[\[\[' end='\]\]\]' contains=trailingWS,lineCon,badLineCon,jinja2Block,jinja2Print,jinja2Comment,empy

syn match cylcItem ' *\zs\(\w\|+\|\/\| \|\-\)*\> *=\@='
syn match cylcEquals '='

syn match trigger /=>/ contained
syn match xtrigger /@[a-zA-Z0-9_-]*/ contained
syn match parameter /<[^>]*>/ contained
syn match output /:[a-zA-Z0-9_-]*\>/ contained
syn match suicide /\!\w\+/ contained
syn match offset /\[.\{-}\]/ contained
syn match optional /?/ contained

"file inclusion:
syn match cylcInclude '%include *\(\w\|"\| \|\-\|\/\|\.\)*'
"inlined file markers:
syn match cylcInclude '\_^!\{1,}'
syn match cylcInclude '.*\(START INLINED\|END INLINED\).*'

syn match cylcToDo /[Tt][Oo][Dd][Oo]/
syn match cylcToDo /[Ff][Ii][Xx][Mm][Ee]/

syn match empyVariable /@[a-zA-Z0-9]\+/
syn match empyComment /@#.*/ contains=trailingWS,cylcToDo,lineCon,badLineCon
syn match cylcComment /#.*/ contains=trailingWS,cylcToDo,lineCon,badLineCon,jinja2Block,jinja2Print,jinja2Comment,empy

syn region cylcString start=+'+ skip=+\\'+ end=+'+ contains=trailingWS,lineCon,badLineCon,jinja2Block,jinja2Print,jinja2Comment,empy,cylcToDo
syn region cylcString start=+"+ skip=+\\"+ end=+"+ contains=trailingWS,lineCon,badLineCon,jinja2Block,jinja2Print,jinja2Comment,empy,cylcToDo
syn region cylcMultiString start=+=\@<= *"""+ end=+"""+ contains=trailingWS,lineCon,badLineCon,jinja2Block,jinja2Print,jinja2Comment,empy,empyComment,cylcComment,optional,trigger,output,suicide,offset,cylcToDo,xtrigger,parameter
syn region cylcMultiString start=+=\@<= *'''+ end=+'''+ contains=trailingWS,lineCon,badLineCon,jinja2Block,jinja2Print,jinja2Comment,empy,empyComment,cylcComment,optional,trigger,output,suicide,offset,cylcToDo,xtrigger,parameter

hi def link cylcMultiString String
" de-emphasize regular strings as quoting is irrelevant in cylc
hi def link cylcString Normal

hi def link cylcSection Statement
hi def link cylcItem Type
hi def link cylcComment Comment

hi def link lineCon Constant
hi def link badLineCon Error
hi def link trailingWS Underlined

hi def link cylcToDo Todo
hi def link cylcInclude Include
hi def link jinja2Block PreProc
hi def link jinja2Print PreProc
hi def link jinja2Comment Comment
hi def link empy PreProc
hi def link empyComment CursorColumn
hi def link empyVariable PreProc
hi def link cylcEquals LineNr
hi def link output Identifier
hi def link suicide Special
hi def link offset Special
hi def link trigger Constant
hi def link optional Type

hi def link xtrigger Function
hi def link parameter Function
