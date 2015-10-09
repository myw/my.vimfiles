" Stab - convenient utils for setting tabstop
"
" Based on vimcasts by Drew Neil http://vimcasts.org/episodes/tabs-and-spaces/
"
" Version:	0.1
" Last Change:	2015 September 22
" Maintainer:	Mikhail Wolfson <mywolfson@gmail.com>


" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=? Stab call Stab(<args>)
function! Stab(...)

  if a:0 < 1
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  else
    let l:tabstop = a:1
  endif

  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echo 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" vim: sts=2:ts=2:sw=2
