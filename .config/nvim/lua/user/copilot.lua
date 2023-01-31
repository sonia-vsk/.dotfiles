vim.cmd([[highlight CopilotLine guifg=#555555 ctermfg=8]])

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { silent = true, expr = true})
