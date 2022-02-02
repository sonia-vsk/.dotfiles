local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
}

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(
    function(server)
        local opts = {
            capabilities = capabilities,
            on_attach = function(client)
                client.resolved_capabilities.document_formatting = true
                client.resolved_capabilities.document_range_formatting = true
            end
        }

        -- (optional) Customize the options passed to the server
        -- if server.name == "tsserver" then
        --     opts.root_dir = function() ... end
        -- end

        -- This setup() function will take the provided server configuration and decorate it with the necessary properties
        -- before passing it onwards to lspconfig.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        server:setup(opts)
    end
)

--[[ require("lspconfig").solargraph.setup(
  {
    autoformat = true, -- EXPERIMENTAL
    settings = {
      solargraph = {
        diagnostics = true
      }
    }
  }
) ]]
