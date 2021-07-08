vim.opt.syntax = 'on'
vim.opt.relativenumber = true
vim.opt.showmode = false

-- Whitespace
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.backspace = 'indent,eol,start'

vim.cmd('filetype indent on')
vim.opt.smartindent = true
vim.cmd('autocmd! bufread,bufwritepre *.html.erb,*.scss normal gg=G``')

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.ruby_host_prog = '~/.rbenv/shims/neovim-ruby-host'
