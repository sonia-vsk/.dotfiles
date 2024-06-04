local M = {}
function M.config()
	-- Configure folding
	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	vim.opt.foldenable = false -- disable folding by default

	local treesitter = require("nvim-treesitter")
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = {
			"lua",
			"markdown",
			"markdown_inline",
			"bash",
			"ruby",
			"json",
			"comment",
			"dockerfile",
			"git_rebase",
			"gitcommit",
			"gitignore",
			"c", 
			"vim", 
			"vimdoc", 
			"query", 
			"yaml", 
			"sql", 
			"tmux"
		}, -- put the language you want in this array
		ignore_install = { "" }, -- List of parsers to ignore installing
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "css" }, -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css" } },

		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

return M
