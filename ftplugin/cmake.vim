if (exists('b:did_ftplugin'))
  finish
endif
let b:did_ftplugin = 1

let s:cmake_dict = printf('%s/dict/cmake.txt', expand('<sfile>:p:h:h'))

if stridx(&l:dictionary, 'cmake.txt') == -1 " only when it doesn't contain
  let &l:dictionary = printf('%s,%s', &l:dictionary, s:cmake_dict)
endif

let b:match_words = &matchpairs . ',^\s*if\s*(:^\s*elseif(:^\s*else\s*(:^\s*endif\s*('
let b:match_words .= ',^\s*function\s*(:^\s*endfunction\s*('
let b:match_words .= ',^\s*macro\s*(:^\s*endmacro\s*('
let b:match_words .= ',^\s*foreach\s*(:^\s*endforeach\s*('
let b:match_words .= ',^\s*while\s*(:^\s*endwhile\s*('

set formatoptions+=o
let b:undo_ftplugin = 'setl formatoptions<'

if has('comments')
  setlocal comments=:#
  let b:undo_ftplugin .= ' comments<'
endif
if has('folding')
  setlocal commentstring=#\ %s
  let b:undo_ftplugin .= ' commentstring<'
endif

if has('find_in_path') || has('eval')
function! FtCmakeIncExtract(iline) abort
  if a:iline !=# 'include'
    return a:iline
  endif
  return substitute(getline('.'),'^include\s*(\s*"\?\([^"]\+\)"\?\s*)','\1','')
endfunction

  setlocal isfname+=$,{,}
  setlocal includeexpr=FtCmakeIncExtract(v:fname)
  let b:undo_ftplugin .= ' includeexpr< isfname<'
endif

setlocal keywordprg=cmake\ --help-command
let b:undo_ftplugin .= ' keywordprg<'
