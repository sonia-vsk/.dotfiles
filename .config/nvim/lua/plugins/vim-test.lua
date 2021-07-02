vim.g['test#strategy'] = "vimux"
vim.api.nvim_set_keymap('n', '<leader>r', ':TestFile<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>R', ':TestNearest<cr>', { noremap = true })
