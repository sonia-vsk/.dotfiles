require("settings")
require("maps")
require("plugins")

require("plugins.telescope")
require("plugins.calvera")
require("plugins.lualine")
require("plugins.nvim-compe")
require("plugins.nvim-lspconfig")
require("plugins.nvim-treesitter")
require("plugins.vim-test")
-- require("plugins.ale")
-- require("plugins.lspsaga")
require("plugins.gitsigns")
require("plugins.emmet")
require("plugins.tabline")

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	sources = {
		formatting.rubocop.with({
			command = "bundle",
			args = vim.list_extend({ "exec", "rubocop" }, formatting.rubocop._opts.args),
		}),
		-- diagnostics.rubocop,
		formatting.stylua,
		diagnostics.eslint,
		null_ls.builtins.completion.spell,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
