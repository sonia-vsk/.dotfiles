local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local builtins = null_ls.builtins
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = builtins.diagnostics

local completion = null_ls.builtins.completion
local null_ls_sources = {}

-- table.insert(null_ls_sources, formatting.codespell)
table.insert(null_ls_sources, formatting.prettier)
table.insert(null_ls_sources, formatting.stylua)
table.insert(null_ls_sources, formatting.eslint)
table.insert(null_ls_sources, diagnostics.eslint)
table.insert(null_ls_sources, formatting.rustywind) -- Tailwind organizer
-- table.insert(null_ls_sources, formatting.rubocop)
-- table.insert(null_ls_sources, diagnostics.rubocop)
table.insert(
	null_ls_sources,
	diagnostics.rubocop.with({
		command = "bundle",
		-- TODO: check if .rubocop-future exists, if not, just bundle exec rubocop
		args = vim.list_extend(
			{ "exec", "rubocop", "-c", ".rubocop.yml" },
			null_ls.builtins.diagnostics.rubocop._opts.args
		),
	})
)
table.insert(
	null_ls_sources,
	formatting.rubocop.with({
		command = "bundle",
		args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.formatting.rubocop._opts.args),
	})
)
-- table.insert(null_ls_sources, completion.spell.with({ filetypes = { "markdown" } }))

if #null_ls_sources ~= 0 then
	null_ls.setup({
		debounce = 500,
		debug = true,
		sources = null_ls_sources,
		on_attach = function(client)
			if client.server_capabilities.documentFormattingProvider then
				vim.cmd([[
				      augroup LspFormatting
				      autocmd! * <buffer>
				      autocmd BufWritePre <buffer> lua vim.lsp.buf.format({timeout_ms=2500})
				      augroup END
				     ]])
			end
		end,
	})
end
