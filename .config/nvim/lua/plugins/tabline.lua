require'tabline'.setup {}
vim.cmd[[
    set guioptions-=e " Use showtabline in gui vim
    set sessionoptions+=tabpages,globals " store tabpages and globals in session
    let g:tabline_show_filename_only=v:true
    nnoremap <leader>tr :TablineTabRename
    ]]
