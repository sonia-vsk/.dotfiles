-- plugins/which-key.lua
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- Setup
which_key.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = { enabled = true, suggestions = 20 },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  icons = { breadcrumb = "»", separator = "➜", group = "+" },
  win = {
    border = "single",
    padding = { 2, 2, 2, 2 },
    wo = {
      winblend = 0,
    },
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  filter = function(mapping)
    -- Filter out some default mappings
    return true
  end,
  show_help = true,
})

-- Helper to map normal and visual
local function nmap(keys, cmd, desc)
  if cmd then
    vim.keymap.set("n", "<leader>" .. keys, cmd, { silent = true, noremap = true, desc = desc })
  end
end

local function vmap(keys, cmd, desc)
  if cmd then
    vim.keymap.set("v", "<leader>" .. keys, cmd, { silent = true, noremap = true, desc = desc })
  end
end

-- Normal mode mappings
nmap("/", "<Plug>(comment_toggle_linewise_current)", "Comment")
nmap("F", "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text")
nmap("R", "<cmd>TestNearest<cr>", "Test nearest")
nmap("S", "<cmd>RSpec --only-failures<cr>", "Last Failed Test")
nmap("b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers")
nmap("c", "<cmd>Bdelete!<CR>", "Close Buffer")
nmap("e", "<cmd>lua require('nvim-tree.api').tree.toggle()<cr>", "Explorer")
nmap("f", "<cmd>Telescope find_files find_command=fd,--hidden,--no-ignore,--exclude,*.git,--type,f<cr>", "Find files")
nmap("h", "<cmd>nohlsearch<CR>", "No Highlight")
nmap("q", "<cmd>lua require('user.functions').smart_quit()<CR>", "Quit")
nmap("r", "<cmd>TestFile<cr>", "Test file")
nmap("w", "<cmd>w!<CR>", "Save")

-- Git mappings
nmap("gR", "<cmd>lua require('gitsigns').reset_buffer()<cr>", "Reset Buffer")
nmap("gb", "<cmd>Telescope git_branches<cr>", "Checkout branch")
nmap("gc", "<cmd>Telescope git_commits<cr>", "Checkout commit")
nmap("gd", "<cmd>Gitsigns diffthis HEAD<cr>", "Diff")
nmap("gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit")
nmap("gj", "<cmd>lua require('gitsigns').next_hunk()<cr>", "Next Hunk")
nmap("gk", "<cmd>lua require('gitsigns').prev_hunk()<cr>", "Prev Hunk")
nmap("gl", "<cmd>lua require('gitsigns').blame_line()<cr>", "Blame")
nmap("go", "<cmd>Telescope git_status<cr>", "Open changed file")
nmap("gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview Hunk")
nmap("gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk")
nmap("gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk")
nmap("gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Undo Stage Hunk")

-- LSP mappings
nmap("lE", "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition")
nmap("lI", "<cmd>Mason<cr>", "Installer Info")
nmap("lR", "<cmd>lua vim.lsp.buf.references()<CR>", "References")
nmap("lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols")
nmap("la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action")
nmap("ld", "<cmd>lua vim.diagnostic.open_float()<CR>", "Floating diagnostics")
nmap("le", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration")
nmap("lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format")
nmap("lh", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover")
nmap("ll", "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action")
nmap("lr", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename")
nmap("ls", "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols")

-- Packer mappings
nmap("pS", "<cmd>PackerStatus<cr>", "Status")
nmap("pc", "<cmd>PackerCompile<cr>", "Compile")
nmap("pi", "<cmd>PackerInstall<cr>", "Install")
nmap("ps", "<cmd>PackerSync<cr>", "Sync")
nmap("pu", "<cmd>PackerUpdate<cr>", "Update")

-- Telescope Search mappings
nmap("sC", "<cmd>Telescope commands<cr>", "Commands")
nmap("sM", "<cmd>Telescope man_pages<cr>", "Man Pages")
nmap("sR", "<cmd>Telescope registers<cr>", "Registers")
nmap("sc", "<cmd>Telescope colorscheme<cr>", "Colorscheme")
nmap("sh", "<cmd>Telescope help_tags<cr>", "Help")
nmap("sk", "<cmd>Telescope keymaps<cr>", "Keymaps")
nmap("sr", "<cmd>Telescope oldfiles<cr>", "Open Recent File")

-- Terminal mappings
nmap("tf", "<cmd>ToggleTerm direction=float<cr>", "Float")
nmap("th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal")
nmap("tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical")

-- Avante (Cursor-like AI)
nmap("aa", "<cmd>AvanteAsk<CR>", "Avante Ask")
nmap("ar", "<cmd>AvanteRefresh<CR>", "Avante Refresh")
nmap("ae", "<cmd>AvanteEdit<CR>", "Avante Edit")
nmap("as", "<cmd>AvanteToggle<CR>", "Avante Sidebar")
nmap("ac", "<cmd>AvanteClear<CR>", "Avante Clear")

-- Icon picker for cat icons
nmap("ip", "<cmd>IconPickerNormal<CR>", "Icon Picker")
nmap("iy", "<cmd>IconPickerYank<CR>", "Icon Picker (Yank)")

vmap("aa", "<cmd>AvanteAsk<CR>", "Avante Ask (visual)")                  -- Ask about selection
vmap("ae", "<cmd>AvanteEdit<CR>", "Avante Edit (visual)")                -- Edit selection with Avante


-- Visual mode mappings
vmap("/", "<Plug>(comment_toggle_linewise_visual)", "Comment")

-- Register ALL keymaps with descriptions (including non-leader keys)
which_key.add({
  -- Leader key groups
  { "<leader>a", group = "AI" },
  { "<leader>g", group = "Git" },
  { "<leader>i", group = "Icons" },
  { "<leader>l", group = "LSP" },
  { "<leader>n", group = "Noice" },
  { "<leader>p", group = "Packer" },
  { "<leader>s", group = "Search" },
  { "<leader>t", group = "Terminal" },
  { "<leader>x", group = "Diagnostics" },
  
  -- Noice keymaps
  { "<leader>nh", "<cmd>Noice history<cr>", desc = "Message History" },
  { "<leader>nl", "<cmd>Noice last<cr>", desc = "Last Message" },
  { "<leader>ne", "<cmd>Noice errors<cr>", desc = "Show Errors" },
  { "<leader>nd", "<cmd>Noice dismiss<cr>", desc = "Dismiss All" },
  { "<leader>nt", "<cmd>Noice toggle<cr>", desc = "Toggle Noice" },
  
  -- Trouble keymaps
  { "<leader>xx", desc = "Toggle Diagnostics" },
  { "<leader>xw", desc = "Workspace Diagnostics" },
  { "<leader>xd", desc = "Document Diagnostics" },
  { "<leader>xq", desc = "Quickfix (LSP Diagnostics)" },
  { "<leader>xl", desc = "Location List" },
  { "gR", desc = "LSP References (Trouble)" },
  { "[t", desc = "Previous Trouble Item" },
  { "]t", desc = "Next Trouble Item" },
  
  -- Window navigation (from keymaps.lua)
  { "<C-h>", "<C-w>h", desc = "Window Left" },
  { "<C-j>", "<C-w>j", desc = "Window Down" },
  { "<C-k>", "<C-w>k", desc = "Window Up" },
  { "<C-l>", "<C-w>l", desc = "Window Right" },
  
  -- Window resizing
  { "<C-Up>", ":resize -2<CR>", desc = "Resize Window Up" },
  { "<C-Down>", ":resize +2<CR>", desc = "Resize Window Down" },
  { "<C-Left>", ":vertical resize -2<CR>", desc = "Resize Window Left" },
  { "<C-Right>", ":vertical resize +2<CR>", desc = "Resize Window Right" },
  
  -- Buffer navigation
  { "<S-l>", ":bnext<CR>", desc = "Next Buffer" },
  { "<S-h>", ":bprevious<CR>", desc = "Previous Buffer" },
  
  -- Text movement in normal mode
  { "<A-j>", "<Esc>:m .+1<CR>==gi", desc = "Move Line Down" },
  { "<A-k>", "<Esc>:m .-2<CR>==gi", desc = "Move Line Up" },
  
  -- Insert mode
  { "jk", "<ESC>", desc = "Exit Insert Mode", mode = "i" },
  
  -- Visual mode
  { "<", "<gv", desc = "Indent Left", mode = "v" },
  { ">", ">gv", desc = "Indent Right", mode = "v" },
  { "<A-j>", ":m .+1<CR>==", desc = "Move Selection Down", mode = "v" },
  { "<A-k>", ":m .-2<CR>==", desc = "Move Selection Up", mode = "v" },
  { "p", '"_dP', desc = "Paste Without Overwriting", mode = "v" },
  
  -- Visual Block mode
  { "J", ":move '>+1<CR>gv-gv", desc = "Move Block Down", mode = "x" },
  { "K", ":move '<-2<CR>gv-gv", desc = "Move Block Up", mode = "x" },
  { "<A-j>", ":move '>+1<CR>gv-gv", desc = "Move Block Down", mode = "x" },
  { "<A-k>", ":move '<-2<CR>gv-gv", desc = "Move Block Up", mode = "x" },
  
  -- Common built-in mappings that might show as blank
  { "gcc", desc = "Toggle Comment Line" },
  { "gc", desc = "Toggle Comment", mode = { "n", "v" } },
  { "gf", desc = "Go to File" },
  { "gx", desc = "Open URL" },
  { "zz", desc = "Center Cursor" },
  { "zt", desc = "Cursor to Top" },
  { "zb", desc = "Cursor to Bottom" },
  { "zo", desc = "Open Fold" },
  { "zc", desc = "Close Fold" },
  { "za", desc = "Toggle Fold" },
  { "dd", desc = "Delete Line" },
  { "yy", desc = "Yank Line" },
  { "cc", desc = "Change Line" },
  { ">>", desc = "Indent Line" },
  { "<<", desc = "Unindent Line" },
  { "u", desc = "Undo" },
  { "<C-r>", desc = "Redo" },
  { ".", desc = "Repeat Last Command" },
  { "*", desc = "Search Word Under Cursor" },
  { "#", desc = "Search Word Under Cursor (Backwards)" },
  { "n", desc = "Next Search Result" },
  { "N", desc = "Previous Search Result" },
  { "0", desc = "Beginning of Line" },
  { "$", desc = "End of Line" },
  { "^", desc = "First Non-Blank Character" },
  { "gg", desc = "Go to Top" },
  { "G", desc = "Go to Bottom" },
  { "%", desc = "Go to Matching Bracket" },
  { "w", desc = "Next Word" },
  { "b", desc = "Previous Word" },
  { "e", desc = "End of Word" },
  { "f", desc = "Find Character" },
  { "F", desc = "Find Character (Backwards)" },
  { "t", desc = "Till Character" },
  { "T", desc = "Till Character (Backwards)" },
  { ":", desc = "Command Mode" },
  { "/", desc = "Search Forward" },
  { "?", desc = "Search Backward" },
  { "o", desc = "Open Line Below" },
  { "O", desc = "Open Line Above" },
  { "a", desc = "Append" },
  { "A", desc = "Append End of Line" },
  { "i", desc = "Insert" },
  { "I", desc = "Insert Beginning of Line" },
  { "s", desc = "Substitute Character" },
  { "S", desc = "Substitute Line" },
  { "r", desc = "Replace Character" },
  { "R", desc = "Replace Mode" },
  { "v", desc = "Visual Mode" },
  { "V", desc = "Visual Line Mode" },
  { "<C-v>", desc = "Visual Block Mode" },
  { "x", desc = "Delete Character" },
  { "X", desc = "Delete Character (Backwards)" },
  { "p", desc = "Paste After" },
  { "P", desc = "Paste Before" },
  { "m", desc = "Set Mark" },
  { "'", desc = "Go to Mark" },
  { "`", desc = "Go to Mark (Exact)" },
  { "q", desc = "Record Macro" },
  { "@", desc = "Play Macro" },
  { "ZZ", desc = "Save and Quit" },
  { "ZQ", desc = "Quit Without Saving" },
  { "<C-w>", desc = "Window Commands" },
  { "<C-d>", desc = "Scroll Down Half Page" },
  { "<C-u>", desc = "Scroll Up Half Page" },
  { "<C-f>", desc = "Scroll Down Full Page" },
  { "<C-b>", desc = "Scroll Up Full Page" },
})

