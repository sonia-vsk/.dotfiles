vim.g.ale_ruby_rubocop_executable = "bundle"
vim.g.ale_ruby_rubocop_options = "-c .rubocop.yml"

vim.g.ale_fixers = {
	["*"] = { "remove_trailing_lines", "trim_whitespace" },
	elixir = "mix_format",
	javascript = { "prettier" },
	json = { "prettier" },
	css = { "prettier" },
	scss = { "prettier" },
	yaml = { "prettier" },
	ruby = { "rubocop" },
	lua = { "stylua" },
	html = { "tidy" },
}

vim.cmd("filetype indent on")
vim.opt.smartindent = true
vim.cmd("autocmd! bufread,bufwritepre *.html.erb normal gg=G``")

vim.cmd("autocmd! bufnewfile,bufread *.avsc setlocal filetype=json")

vim.g.ale_fix_on_save = 1

vim.g.ale_sign_column_always = 1
