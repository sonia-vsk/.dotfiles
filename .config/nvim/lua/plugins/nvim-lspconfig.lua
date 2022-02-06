local lsp_status = require("lsp-status")

--[[ nvim-lsp-installer settings ]]
local lsp_installer = require("nvim-lsp-installer")

local servers = {
	"sumneko_lua",
	"solargraph",
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found and not server:is_installed() then
		print("Installing " .. name)
		server:install()
	end
end

local function on_attach(client, bufnr)
	-- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
	if client.name == "solargraph" then
		client.resolved_capabilities.document_formatting = false
	end
	lsp_status.on_attach(client)
end

require("cmp").setup({
	sources = {
		{ name = "nvim_lsp" },
	},
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)

local enhance_server_opts = {}

lsp_installer.on_server_ready(function(server)
	-- Specify the default options which we'll use to setup all servers
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if enhance_server_opts[server.name] then
		-- Enhance the default opts with the server-specific ones
		enhance_server_opts[server.name](opts)
	end

	server:setup(opts)
end)
