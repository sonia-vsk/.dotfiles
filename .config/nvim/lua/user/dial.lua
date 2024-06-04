local status_ok, dial = pcall(require, "dial")
if not status_ok then
  return
end

local augend = require("dial.augend")

-- Configure dial with various increment/decrement patterns
dial.augends["default"] = {
  augend.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
  augend.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
  augend.date.alias["%Y/%m/%d"],  -- date (2022/02/19, etc.)
  augend.date.alias["%Y-%m-%d"],  -- date (2022-02-19, etc.)
  augend.date.alias["%m/%d/%Y"],  -- date (02/19/2022, etc.)
  augend.date.alias["%H:%M"],     -- time (14:30, etc.)
  augend.constant.alias.bool,     -- boolean value (true <-> false)
  augend.constant.new{
    elements = {"and", "or"},
    word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
    cyclic = true,  -- "or" is incremented into "and".
  },
  augend.constant.new{
    elements = {"&&", "||"},
    word = false,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"==", "!="},
    word = false,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"===", "!=="},
    word = false,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"yes", "no"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"on", "off"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"left", "right"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"up", "down"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"top", "bottom"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"first", "last"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"before", "after"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"start", "end"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"min", "max"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"get", "set"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"add", "remove"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"create", "destroy"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"show", "hide"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"open", "close"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"enable", "disable"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"public", "private"},
    word = true,
    cyclic = true,
  },
  -- Days of the week
  augend.constant.new{
    elements = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"},
    word = true,
    cyclic = true,
  },
  -- Months
  augend.constant.new{
    elements = {"January", "February", "March", "April", "May", "June", 
               "July", "August", "September", "October", "November", "December"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", 
               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"},
    word = true,
    cyclic = true,
  },
}

-- Ruby-specific augends
dial.augends["ruby"] = {
  augend.integer.alias.decimal,
  augend.integer.alias.hex,
  augend.date.alias["%Y/%m/%d"],
  augend.date.alias["%Y-%m-%d"],
  augend.constant.alias.bool,
  augend.constant.new{
    elements = {"nil", "true", "false"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"class", "module"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"def", "end"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"if", "unless"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"include", "extend"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"attr_reader", "attr_writer", "attr_accessor"},
    word = true,
    cyclic = true,
  },
  augend.constant.new{
    elements = {"public", "private", "protected"},
    word = true,
    cyclic = true,
  },
}

-- Set up keybindings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Normal mode
keymap("n", "<C-a>", function()
  require("dial.map").manipulate("increment", "normal")
end, opts)

keymap("n", "<C-x>", function()
  require("dial.map").manipulate("decrement", "normal")
end, opts)

keymap("n", "g<C-a>", function()
  require("dial.map").manipulate("increment", "gnormal")
end, opts)

keymap("n", "g<C-x>", function()
  require("dial.map").manipulate("decrement", "gnormal")
end, opts)

-- Visual mode
keymap("v", "<C-a>", function()
  require("dial.map").manipulate("increment", "visual")
end, opts)

keymap("v", "<C-x>", function()
  require("dial.map").manipulate("decrement", "visual")
end, opts)

keymap("v", "g<C-a>", function()
  require("dial.map").manipulate("increment", "gvisual")
end, opts)

keymap("v", "g<C-x>", function()
  require("dial.map").manipulate("decrement", "gvisual")
end, opts)

-- Auto-command to use ruby-specific augends for Ruby files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", 
      "<Cmd>lua require('dial.map').manipulate('increment', 'normal', 'ruby')<CR>", 
      { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "<C-x>", 
      "<Cmd>lua require('dial.map').manipulate('decrement', 'normal', 'ruby')<CR>", 
      { noremap = true, silent = true })
  end,
}) 