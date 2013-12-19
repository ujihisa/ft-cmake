let s:cmake_dict = printf('%s/dict/cmake.txt', expand('<sfile>:p:h:h'))

if stridx(&l:dictionary, 'cmake\.txt$') == -1 " only when it doesn't contain
  let &l:dictionary = printf('%s,%s', &l:dictionary, s:cmake_dict)
endif
