-- user/lsp/handlers.lua
local M = {}
local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")
if not cmp_ok then return end

M.capabilities = cmp.default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

M.setup = function()
  local signs = { Error="", Warn="", Hint="", Info="" }
  vim.diagnostic.config {
    virtual_text = false, -- Let trouble handle diagnostics display
    signs        = { text = signs },
    update_in_insert = true,
    underline    = true,
    severity_sort= true,
    float = { focusable=true, style="minimal", border="rounded", source="always" },
  }

  -- DON'T override these - let noice handle LSP UI
  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border="rounded"})
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border="rounded"})
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
	keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
	keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  -- Keymaps for LSP actions (trouble will handle references)
  local buf = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  buf("n","gd","<cmd>lua vim.lsp.buf.definition()<CR>", opts)      -- go-to-def
  buf("n","gD","<cmd>lua vim.lsp.buf.declaration()<CR>", opts)     -- decl (if supported)
  -- buf("n","gr","<cmd>lua vim.lsp.buf.references()<CR>", opts)   -- Let trouble handle this with gR
  buf("n","gi","<cmd>lua vim.lsp.buf.implementation()<CR>", opts)  -- impl
  buf("n","K","<cmd>lua vim.lsp.buf.hover()<CR>", opts)            -- doc (noice will enhance this)
  buf("n","<leader>rn","<cmd>lua vim.lsp.buf.rename()<CR>", opts)  -- rename
  buf("n","[d","<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)    -- Navigate diagnostics
  buf("n","]d","<cmd>lua vim.diagnostic.goto_next()<CR>", opts)    -- Navigate diagnostics

  -- illumination
  local illum_ok, illuminate = pcall(require, "illuminate")
  if illum_ok then illuminate.on_attach(client) end
end

return M

