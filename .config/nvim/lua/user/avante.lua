local status_ok, avante = pcall(require, "avante")
if not status_ok then
  return
end

avante.setup({
  -- Provider configuration (modern format)
  provider = "openai", -- recommend using Claude for better results
  auto_suggestions_provider = "copilot", -- Since you have copilot setup
  
  -- Modern providers configuration
  providers = {
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4o",
      timeout = 30000,
      extra_request_body = {
        temperature = 0,
        max_tokens = 4096,
      },
      ["local"] = false,
    },
    copilot = {
      endpoint = "https://api.githubcopilot.com",
      model = "gpt-4o-2024-05-13",
      proxy = nil,
      allow_insecure = false,
      timeout = 30000,
      extra_request_body = {
        temperature = 0,
        max_tokens = 4096,
      },
    },
  },
  
  -- Behaviour
  behaviour = {
    auto_suggestions = false, -- Experimental stage
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
  },
  
  -- Mappings
  mappings = {
    --- @class AvanteConflictMappings
    diff = {
      ours = "co",
      theirs = "ct",
      all_theirs = "ca",
      both = "cb",
      cursor = "cc",
      next = "]x",
      prev = "[x",
    },
    suggestion = {
      accept = "<M-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
    jump = {
      next = "]]",
      prev = "[[",
    },
    submit = {
      normal = "<CR>",
      insert = "<C-s>",
    },
  },
  
  -- Hints for improving performance
  hints = { enabled = true },
  
  -- Windows configuration
  windows = {
    ---@type "right" | "left" | "top" | "bottom"
    position = "right", -- the position of the sidebar
    wrap = true, -- similar to vim.o.wrap
    width = 30, -- default % based on available width
    sidebar_header = {
      align = "center", -- left, center, right for title
      rounded = true,
    },
  },
  
  highlights = {
    ---@type AvanteConflictHighlights
    diff = {
      current = "DiffText",
      incoming = "DiffAdd",
    },
  },
  
  --- @class AvanteConflictUserConfig
  diff = {
    autojump = true,
    ---@type string | fun(): string
    list_opener = "copen",
  },
}) 