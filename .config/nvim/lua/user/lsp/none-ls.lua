-- user/lsp/none-ls.lua
local ok, none_ls = pcall(require, "none-ls")
if not ok then return end

none_ls.setup({
  debounce = 500,
  debug    = true,
  sources  = {
    none_ls.builtins.formatting.stylua,
  },
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd([[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.format({timeout_ms=2500})
        augroup END
      ]])
    end
  end,
})

