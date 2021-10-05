vim.g.ale_fixers = {
  ["*"] = {"remove_trailing_lines", "trim_whitespace"},
  javascript = {"prettier"},
  json = {"prettier"},
  css = {"prettier"}
}

vim.cmd("autocmd! bufnewfile,bufread *.avsc setlocal filetype=json")

vim.g.ale_fix_on_save = 1

vim.g.ale_sign_column_always = 1
