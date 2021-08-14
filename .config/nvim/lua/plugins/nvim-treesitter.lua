vim.cmd("autocmd! bufnewfile,bufread *.jbuilder setlocal filetype=ruby")
require("nvim-treesitter.configs").setup(
  {
    indent = {
      enable = true
    },
    ensure_installed = {
      "dockerfile",
      "html",
      "regex",
      "scss",
      "css",
      "javascript",
      "json",
      "lua",
      "yaml"
    }
  }
)
