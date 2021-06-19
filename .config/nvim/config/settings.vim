syntax enable                          " Enables syntax highlighing

set relativenumber                     " turn relative line numbers on
set number relativenumber              " turn hybrid line numbers on
set noshowmode                         " hide mode

set autoindent

colorscheme dogrun

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces or set this to 4
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
