let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-emmet',
    \ 'coc-git',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-prettier',
    \ 'coc-pairs',
    \ 'coc-stylelintplus',
    \ 'coc-snippets',
    \ 'coc-tailwindcss',
    \ 'coc-tailwind-intellisense',
    \ 'coc-yaml'
    \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
