-- user/lsp/mason.lua
local settings = {
  PATH = "prepend",
  ui = { border = "none", icons = { installed="◍", pending="◍", uninstalled="◍" } },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
local capabilities = require("cmp_nvim_lsp").default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local servers = {
  lua_ls    = {
    settings = {
      Lua = {
        diagnostics = {
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
  },
  ruby_lsp  = {
    init_options = { formatter = "auto" },
    settings = {
      ruby_lsp = {
        autoformat   = true,
        diagnostics  = true,
        completion   = true,
        folding      = true,
        references   = true,
        rename       = true,
        symbols      = true,
      },
    },
  },
  jsonls    = require("user.lsp.settings.jsonls"),
  yamlls    = {},
  ltex      = {},
}

require("mason-lspconfig").setup({
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true,
})

local on_attach = require("user.lsp.handlers").on_attach
for name, opts in pairs(servers) do
  require("lspconfig")[name].setup(vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach    = on_attach,
  }, opts))
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rb",
  callback = function() vim.lsp.buf.format({ timeout_ms = 2500 }) end,
})
