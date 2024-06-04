local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local api = require("nvim-tree.api")

nvim_tree.setup({
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = false,
	hijack_unnamed_buffer_when_opening = false,
	sort_by = "name",
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = "",
		args = {},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = { ".git", "node_modules", ".cache" },
		exclude = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			diagnostics = false,
			git = false,
			profile = false,
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		highlight_opened_files = "none",
		root_folder_modifier = ":~",
		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
	},
	view = {
		width = 30,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	on_attach = function(bufnr)
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		-- VSCode-like key mappings
		vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
		vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
		vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
		vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
		vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
		vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
		vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
		vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
		vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
		vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
		vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
		vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
		vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
		vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
		vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
		vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
		vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
		vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
		vim.keymap.set("n", "<C-K>", api.node.navigate.sibling.first, opts("First Sibling"))
		vim.keymap.set("n", "<C-J>", api.node.navigate.sibling.last, opts("Last Sibling"))
		vim.keymap.set("n", "a", api.fs.create, opts("Create"))
		vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
		vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
		vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
		vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
		vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
		vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
		vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
		vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
		vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
		vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
		vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
		vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
		vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
		vim.keymap.set("n", "q", api.tree.close, opts("Close"))
		vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
		vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
		vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
		vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
		vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
	end,
})

