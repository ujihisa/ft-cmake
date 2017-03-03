let s:cmake_dict = printf('%s/dict/cmake.txt', expand('<sfile>:p:h:h'))

if stridx(&l:dictionary, 'cmake.txt') == -1 " only when it doesn't contain
  let &l:dictionary = printf('%s,%s', &l:dictionary, s:cmake_dict)
endif

let b:match_words = &matchpairs . ',^\s*if\s*(:^\s*elseif(:^\s*else\s*(:^\s*endif\s*('
let b:match_words .= ',^\s*function\s*(:^\s*endfunction\s*('
let b:match_words .= ',^\s*macro\s*(:^\s*endmacro\s*('
let b:match_words .= ',^\s*foreach\s*(:^\s*endforeach\s*('
let b:match_words .= ',^\s*while\s*(:^\s*endwhile\s*('
