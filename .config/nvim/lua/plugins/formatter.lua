require("formatter").setup(
  {
    logging = false,
    filetype = {
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      ruby = {
        -- rubocop
        function()
          return {
            exe = "rubocop", -- might prepend `bundle exec `
            args = {"--auto-correct", "--stdin", "%:p", "2>/dev/null", "|", "awk 'f; /^====================$/{f=1}'"},
            stdin = true,
            cwd = vim.fn.expand("%:p:h")
          }
        end
      }
    }
  }
)
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua,*.rb FormatWrite
augroup END
]],
  true
)
