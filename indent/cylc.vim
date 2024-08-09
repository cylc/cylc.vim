" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

" Some preliminary settings
setlocal nolisp      " Make sure lisp indenting doesn't supersede us
setlocal autoindent  " indentexpr isn't much help otherwise

setlocal indentexpr=GetCylcIndent(v:lnum)
setlocal indentkeys=!^F,o,O,],\",'

" Only define the function once.
if exists("*GetCylcIndent")
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

function s:header_level(lnum)
  " Level of the section header on a given line, 0 if none
  let line = getline(a:lnum)
  return substitute(line, '^\s*\(\[*\).*', '\=strlen(submatch(1))', '')
endfunction

function s:prev_header(lnum)
  " Jump to the header preceding a given line
  call cursor(a:lnum, 1)
  return search('^\s*\[\+', "bW")
endfunction

function s:is_in_multistring(lnum)
  " Check whether a given line makes up a multi-line string
  if has('syntax_items')
    for id in synstack(a:lnum, 1)
      if synIDattr(id, "name") =~ "String"
        return 1
      endif
    endfor
  endif
  return 0
endfunction

function GetCylcIndent(lnum)
  let line = getline(a:lnum)
  let line = substitute(line, '\v^\s+|\s+$', '', 'g')

  " Do not adjust jinja or empy indentation
  if line =~ '^\({[{%#]\|@[[({]\)'
    return -1
  endif

  " Check for a section header on this line
  let level = s:header_level(a:lnum)
  if level > 0
    return shiftwidth() * (level - 1)
  endif

  " Otherwise, find the nearest section header
  let level = s:header_level(s:prev_header(a:lnum))

  " Add an extra indent inside multiline strings, not including closing
  " quotes if on their own line
  if s:is_in_multistring(a:lnum)
    if line != '"""' && line != "'''"
      let level = level + 1
    endif
  endif

  return shiftwidth() * level
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
