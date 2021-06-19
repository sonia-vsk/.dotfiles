set laststatus=2

let g:currentmode={
       \ 'n'  : '🅝 ',
       \ 'v'  : '🅥 ',
       \ '^V' : '🅥 ·Block',
       \ 'V'  : '🅥 ',
       \ 'i'  : '🅘 ',
       \ 'R'  : '🅡 ',
       \ 'c'  : '🅒 ',
       \ 't'  : '🅣 ',
       \}

set statusline=
set statusline+=%#HomeMode#
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%#HomeModeEnd#
set statusline+=

hi HomeMode ctermfg=237  ctermbg=104
hi HomeModeEnd ctermfg=104 ctermbg=146

set statusline+=%#GitStatus#
set statusline+=\ %{get(g:,'coc_git_status','')}
set statusline+=\ %{get(b:,'coc_git_status','')}
set statusline+=\ %{get(b:,'coc_git_blame','')}

set statusline+=%#GitStatusEnd#
set statusline+=\

hi GitStatus ctermfg=237 ctermbg=146
hi GitStatusEnd ctermfg=146 ctermbg=237
hi DiffChange ctermfg=208 ctermbg=NONE
hi DiffAdd ctermfg=148 ctermbg=NONE
hi DiffDelete ctermfg=203 ctermbg=NONE

function! LineColumn()
  let l:line = line('.')
  let l:column = col('.')
  return ' '.l:line.':'.l:column.' | '
endfunction

function! LinePercent()
  let byte = line2byte( line( "." ) ) + col( "." ) - 1
  let size = (line2byte( line( "$" ) + 1 ) - 1)
  return (byte * 100) / size .'% '
endfunction

set statusline+=%=
set statusline+=%#LineColumn#
set statusline+=\
set statusline+=%#LineColumnEnd#
set statusline+=%{LineColumn()}
set statusline+=%{LinePercent()}

hi LineColumn ctermfg=104 ctermbg=237
hi LineColumnEnd ctermfg=237  ctermbg=104

function! LinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return printf(
    \   ' %d  ',
    \   all_non_errors
    \)
endfunction

set statusline+=%#LinterWarnings#
set statusline+=\
set statusline+=%#LinterWarningsEnd#
set statusline+=%{LinterWarnings()}

hi LinterWarnings ctermfg=221 ctermbg=104
hi LinterWarningsEnd ctermfg=237 ctermbg=221

function! LinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error

    return printf(
    \   ' %d ﵃ ',
    \   all_errors
    \)
endfunction

set statusline+=%#LinterErrors#
set statusline+=\
set statusline+=%#LinterErrorsEnd#
set statusline+=%{LinterErrors()}

hi LinterErrors ctermfg=209 ctermbg=221
hi LinterErrorsEnd ctermfg=237 ctermbg=209
