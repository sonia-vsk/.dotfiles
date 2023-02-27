local util = require("lspconfig/util")
return {
	cmd = { "solargraph", "stdio" },
	filetypes = { "ruby" },
	root_dir = util.root_pattern("Gemfile", ".git"),
  init_options = {
    formatting = false,
    autoformat = false,
    diagnostics = true,
  },
	settings = {
		solargraph = {
			diagnostics = true,
		},
	},
}
