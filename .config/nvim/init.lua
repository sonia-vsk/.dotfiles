require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.lualine")
require("user.toggleterm")
require("user.vim-test")
require("user.indentline")
require("user.whichkey")
require("user.better_whitespace")
require("user.copilot")
require("user.harpoon")
require("user.trouble")
require("user.dial")
require("user.spectre")
require("user.noice")
require("user.render-markdown")

local env_path = vim.fn.stdpath("config") .. "/.env"
local env_file = io.open(env_path, "r")
if env_file then
  for line in env_file:lines() do
    local key, val = line:match("^([%w_]+)%s*=%s*(.+)$")
    if key and val then
      vim.fn.setenv(key, val)
    end
  end
  env_file:close()
end

require("user.avante")
