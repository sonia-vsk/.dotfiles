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

local exists_local_file = function(local_path)
	return vim.fn.filereadable(vim.fn.getcwd() .. "/" .. local_path) == 1
end

-- Rubocop doesn't have command_resolver like eslint, so we have to do this to
-- take in account the bash configuration to run rubocop
if exists_local_file(".rubocop.yml") and exists_local_file("Gemfile") then
	-- table.insert(
	-- 	null_ls_sources,
	-- 	formatting.rubocop.with({
	-- 		command = "bash",
	-- 		args = { "-c", "rubocop --auto-correct -f quiet --stderr --stdin $FILENAME" },
	-- 	})
	-- )
	-- table.insert(
	-- 	null_ls_sources,
	-- 	diagnostics.rubocop.with({
	-- 		command = "bash",
	-- 		args = { "-c", "rubocop -f json $FILENAME" },
	-- 	})
	-- )
end

table.insert(null_ls_sources, formatting.codespell)
table.insert(null_ls_sources, formatting.crystal_format.with({ filetypes = {} }))
table.insert(null_ls_sources, formatting.prettier)
table.insert(null_ls_sources, formatting.stylua)
table.insert(null_ls_sources, formatting.eslint)
table.insert(null_ls_sources, diagnostics.eslint)
table.insert(null_ls_sources, formatting.rustywind) -- Tailwind organizer
table.insert(null_ls_sources, diagnostics.shellcheck)
table.insert(null_ls_sources, completion.spell.with({ filetypes = { "markdown" } }))

if #null_ls_sources ~= 0 then
	null_ls.setup({
		debounce = 500,
		debug = false,
		sources = null_ls_sources,
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd([[
          augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 2500)
          augroup END
         ]])
			end
		end,
	})
end
