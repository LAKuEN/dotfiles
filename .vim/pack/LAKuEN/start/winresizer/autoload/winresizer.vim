if exists('g:loaded_autoload_winresizer') 
  finish
endif

let g:loaded_autoload_winresizer = 1

let s:save_cpo = &cpo
set cpo&vim

" when value is 1 in return dictionary, 
" current window has edge in direction of dictionary key name
fun! winresizer#getEdgeInfo()
  let chk_direct = ['left', 'down', 'up', 'right']
  let result = {}
  for direct in chk_direct
    exe 'let result["' . direct . '"] = ' . !winresizer#canMoveCursorFromCurrentWindow(direct)
  endfor
  return result
endfun

fun! winresizer#canMoveCursorFromCurrentWindow(direct)
  let map_direct = {'left':'h', 'down':'j', 'up':'k', 'right':'l'}
  if has_key(map_direct, a:direct)
    let direct = map_direct[a:direct]
  elseif index(values(map_direct), a:direct) != -1
    let direct = a:direct
  endif
  let from = winnr()
  exe "wincmd " . direct
  let to = winnr()
  exe from . "wincmd w"
  return from != to
endfun

let &cpo = s:save_cpo
