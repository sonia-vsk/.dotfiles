local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

harpoon:setup({
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
    key = function()
      return vim.loop.cwd()
    end,
  }
})

-- Keybindings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Add current file to harpoon
keymap("n", "<leader>ha", function() harpoon:list():add() end, opts)

-- Toggle harpoon quick menu
keymap("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)

-- Navigate to files
keymap("n", "<leader>1", function() harpoon:list():select(1) end, opts)
keymap("n", "<leader>2", function() harpoon:list():select(2) end, opts)
keymap("n", "<leader>3", function() harpoon:list():select(3) end, opts)
keymap("n", "<leader>4", function() harpoon:list():select(4) end, opts)
keymap("n", "<leader>5", function() harpoon:list():select(5) end, opts)

-- Navigate between harpoon files
keymap("n", "<C-S-P>", function() harpoon:list():prev() end, opts)
keymap("n", "<C-S-N>", function() harpoon:list():next() end, opts)

-- Telescope integration
keymap("n", "<leader>ht", function()
  local conf = require("telescope.config").values
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    }):find()
  end
  
  toggle_telescope(harpoon:list())
end, opts) 