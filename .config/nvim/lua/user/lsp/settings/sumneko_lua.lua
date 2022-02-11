return {
	settings = {
		init_options = {
			diagnostic = {
				enable = true,
			},
		},
		Lua = {
			diagnostics = {
				enable = true,
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
