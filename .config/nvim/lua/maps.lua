vim.api.nvim_set_keymap('n', '<leader><esc>', ':nohlsearch<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':bnext<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>p', ':bprev<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F5>', ":luafile %<cr>", { noremap = true })
