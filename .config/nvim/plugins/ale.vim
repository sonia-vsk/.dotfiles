let g:ale_sign_error = '﵃'
let g:ale_sign_warning = ''

let g:ale_linters = {
\  'javascript': ['eslint'],
\}
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['prettier'],
\  'json': ['prettier'],
\  'ruby': ['rubocop'],
\}

let g:ale_ruby_rubocop_executable = 'bundle'

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

au BufRead,BufNewFile *.avsc setfiletype json

let g:ale_fix_on_save = 1

let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
