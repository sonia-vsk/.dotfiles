vim.g.ale_fixers = {
  javascript = {'prettier'},
  json = {'prettier'},
  css = {'prettier'},
  ruby = {'rubocop'}
}
vim.g.ale_fixers["*"] = {"remove_trailing_lines", "trim_whitespace"}

vim.g['ale_ruby_rubocop_executable'] = 'bundle'

vim.cmd('autocmd! bufnewfile,bufread *.avsc setlocal filetype=json')

vim.g.ale_fix_on_save = 1

vim.g.ale_sign_column_always = 1
