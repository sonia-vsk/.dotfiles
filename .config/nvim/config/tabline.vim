set ls=0
set showtabline=2

function! CurrentFileTypeSymbol()
  let l:icon = ''
  if exists("*WebDevIconsGetFileTypeSymbol")
    let l:icon = substitute(WebDevIconsGetFileTypeSymbol(), "\u00A0", '', '')
  endif
  return l:icon
endfunction

set tabline=
set tabline+=%#FileName#
set tabline+=\ %{CurrentFileTypeSymbol()}
set tabline+=\ %f " set filename
set tabline+=\ %{&modified?'':''}
set tabline+=%#FileNameEnd#
set tabline+=\

hi FileName ctermfg=237 ctermbg=104
hi FileNameEnd ctermfg=104 ctermbg=237

set tabline+=%=
set tabline+=\ 
set tabline+=\ " "
