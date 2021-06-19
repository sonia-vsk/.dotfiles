" source $HOME/.config/nvim/plugin/vimux.vim
let test#strategy = "vimux"
" let test#strategy = "neovim"

nnoremap <leader>r :TestFile<CR>
nnoremap <leader>R :TestNearest<CR>
