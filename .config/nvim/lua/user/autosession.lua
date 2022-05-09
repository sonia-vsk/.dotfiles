local opts = {
	auto_restore_enabled = true,
	auto_save_enabled = true,
	log_level = "error",
	pre_save_cmds = { "lua require'nvim-tree'.setup()", "tabdo NvimTreeClose" },
}

require("auto-session").setup(opts)
