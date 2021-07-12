require('telescope').load_extension('session-lens')
require('telescope').load_extension('heading')

vim.api.nvim_set_keymap(
    'n',
    '<leader>ff',
    '<cmd>Telescope find_files find_command=fd,--hidden,--no-ignore,--exclude,*.git,--type,f<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap('n', '<C-P>', '<cmd>Telescope git_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-F>', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fl', '<cmd>Telescope lsp_document_symbols<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fm', '<cmd>Telescope heading<cr>', { noremap = true })

local actions = require('telescope.actions')
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
            },
        },
    },
})
