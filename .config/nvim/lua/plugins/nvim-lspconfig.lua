local nvim_lsp = require('lspconfig')

local on_attach = function(client)
    require('completion').on_attach(client)
end

nvim_lsp.solargraph.setup{{ on_attach = on_attach }}
nvim_lsp.html.setup{{ on_attach = on_attach }}
nvim_lsp.cssls.setup{{ on_attach = on_attach }}
nvim_lsp.tsserver.setup{{ on_attach = on_attach }}
nvim_lsp.jsonls.setup{{ on_attach = on_attach }}
nvim_lsp.yamlls.setup{{ on_attach = on_attach }}
nvim_lsp.tailwindcss.setup{{ on_attach = on_attach }}
nvim_lsp.stylelint_lsp.setup{
  on_attach = on_attach,
  settings = {
    stylelintplus = {
      autoFixOnSave = true
    }
  }
}
