local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_lsp" },
	sections = { "error", "warn", "info", "hint" },
	symbols = { 
		error = " ", 
		warn = " ", 
		info = " ", 
		hint = "󰌶 " 
	},
	colored = true,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	colored = true,
	symbols = { 
		added = " ", 
		modified = " ", 
		removed = " " 
	},
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return str:lower()
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon_only = false,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "󰄛",
}

local location = {
	"location",
	padding = 0,
}

-- Enhanced progress with better visual indicator
local progress = {
	"progress",
	fmt = function()
		local current_line = vim.fn.line(".")
		local total_lines = vim.fn.line("$")
		local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
		local line_ratio = current_line / total_lines
		local index = math.ceil(line_ratio * #chars)
		return chars[index]
	end,
}

-- Enhanced spaces function with icon (VSCode style)
local spaces = function()
	return "󱁐 " .. vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
end

-- Enhanced encoding display with icon (VSCode style)
local encoding = function()
	local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
	if ret == "" then
		return ""
	end
	return "󰉿 " .. ret
end

-- Enhanced file format with VSCode icons
local fileformat = {
	"fileformat",
	symbols = {
		unix = " LF",
		dos = " CRLF",
		mac = " CR",
	},
}

-- LSP status with VSCode icon
local lsp_status = function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if next(clients) == nil then
		return ""
	end
	
	local client_names = {}
	for _, client in pairs(clients) do
		table.insert(client_names, client.name)
	end
	
	return "󰒋 " .. table.concat(client_names, ", ")
end

-- Search count with VSCode icon
local search_count = function()
	if vim.v.hlsearch == 0 then
		return ""
	end
	
	local ok, search = pcall(vim.fn.searchcount)
	if not ok or search.total == 0 then
		return ""
	end
	
	return string.format("󰍉 %d/%d", search.current, search.total)
end

-- Macro recording indicator with VSCode icon
local macro_recording = function()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	else
		return "󰑋 @" .. recording_register
	end
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "Outline", "alpha" },
		always_divide_middle = true,
		globalstatus = true, -- Single status line for all windows (VSCode style)
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diff },
		lualine_c = { 
			{ "filename", path = 1, symbols = { modified = " ", readonly = "󰌾 " } }, 
			diagnostics,
			macro_recording,
		},
		lualine_x = { 
			search_count,
			lsp_status,
			encoding, 
			fileformat, 
			spaces,
			filetype 
		},
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { 
		{
			sections = {
				lualine_a = { function() return "󰄛 Explorer" end },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			filetypes = { "NvimTree" },
		},
		"toggleterm" 
	},
})
