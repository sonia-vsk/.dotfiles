# 🚀 Neovim Plugin Reference Guide

## 🎯 Harpoon - File Navigation Revolution

**What it does:** Quick navigation between your most important files

### Keybindings:
- `<leader>ha` - Add current file to harpoon
- `<leader>hh` - Toggle harpoon quick menu
- `<leader>1` - Jump to file 1
- `<leader>2` - Jump to file 2
- `<leader>3` - Jump to file 3
- `<leader>4` - Jump to file 4
- `<leader>5` - Jump to file 5
- `<leader>ht` - View harpoon files in Telescope
- `<C-S-P>` - Previous harpoon file
- `<C-S-N>` - Next harpoon file

### Workflow:
1. Open important files (model, controller, spec, etc.)
2. Add each with `<leader>ha`
3. Jump between them with `<leader>1`, `<leader>2`, etc.

---

## 🔍 Trouble - Better Diagnostics

**What it does:** Beautiful list of all errors, warnings, and references

### Keybindings:
- `<leader>xx` - Toggle trouble
- `<leader>xw` - Workspace diagnostics
- `<leader>xd` - Document diagnostics
- `<leader>xq` - Quickfix list
- `<leader>xl` - Location list
- `gR` - LSP references in trouble
- `]t` - Next trouble item
- `[t` - Previous trouble item

### Inside Trouble:
- `<cr>` - Jump to item
- `<c-x>` - Open in split
- `<c-v>` - Open in vsplit
- `<c-t>` - Open in new tab
- `o` - Jump and close trouble
- `q` - Close trouble
- `K` - Hover details
- `p` - Preview

---

## 🎛️ Dial - Smart Increment/Decrement

**What it does:** Smart `<C-a>` and `<C-x>` for more than just numbers

### Keybindings:
- `<C-a>` - Increment
- `<C-x>` - Decrement
- `g<C-a>` - Increment (visual mode)
- `g<C-x>` - Decrement (visual mode)

### Examples:
- `true` ↔ `false`
- `yes` ↔ `no`
- `on` ↔ `off`
- `left` ↔ `right`
- `Monday` → `Tuesday`
- `==` ↔ `!=`
- `public` ↔ `private`
- `nil` ↔ `true` ↔ `false` (Ruby)
- `class` ↔ `module` (Ruby)

---

## 🔄 Spectre - Project-wide Find & Replace

**What it does:** Visual find and replace across your entire project

### Keybindings:
- `<leader>S` - Open spectre
- `<leader>sw` - Search current word
- `<leader>sp` - Search in current file
- `<leader>sw` (visual) - Search selection

### Rails-specific:
- `<leader>sm` - Search in models
- `<leader>sc` - Search in controllers
- `<leader>sv` - Search in views
- `<leader>st` - Search in specs

### Inside Spectre:
- `<leader>R` - Replace all
- `<leader>rc` - Replace current line
- `<leader>q` - Send to quickfix
- `dd` - Toggle line
- `<cr>` - Go to file
- `<leader>o` - Show options

---

## 🎨 Noice - Better UI

**What it does:** Beautiful command line, notifications, and messages

### Keybindings:
- `<leader>nh` - Message history
- `<leader>nl` - Last message
- `<leader>ne` - Show errors
- `<leader>nd` - Dismiss all notifications
- `<leader>nt` - Toggle noice

### Features:
- Command palette in center of screen
- Beautiful notifications
- Better LSP hover docs
- Search count in statusline
- Enhanced message history

---

## 📐 Indent Blankline v3

**What it does:** Beautiful indent guides with rainbow colors

### Features:
- Rainbow colored indent guides
- Scope highlighting
- Smart exclusions for special buffers
- Works with Treesitter

---

## 🔧 Vim-Projectionist

**What it does:** Navigate between related files in Rails apps

### Keybindings:
- `:A` - Alternate (model ↔ spec)
- `:AS` - Alternate in split
- `:AV` - Alternate in vertical split
- `:AT` - Alternate in tab

### Examples:
- `app/models/user.rb` ↔ `spec/models/user_spec.rb`
- `app/controllers/users_controller.rb` ↔ `spec/controllers/users_controller_spec.rb`
- `components/bookings/app/modules/bookings/service.rb` ↔ `components/bookings/spec/modules/bookings/service_spec.rb`

---

## 🎯 Rails-Specific Workflow

### 1. **File Navigation with Harpoon:**
```
1. Open User model -> <leader>ha
2. Open UsersController -> <leader>ha  
3. Open user_spec.rb -> <leader>ha
4. Open users_controller_spec.rb -> <leader>ha

Now jump between them: <leader>1, <leader>2, <leader>3, <leader>4
```

### 2. **Testing Workflow:**
```
1. In model: :A -> Jump to spec
2. Run test: <leader>t
3. Back to model: :A
4. Fix issue, back to spec: :A
```

### 3. **Debugging Workflow:**
```
1. <leader>xx -> See all errors
2. <cr> -> Jump to first error
3. Fix it
4. ]t -> Next error
5. Repeat
```

### 4. **Refactoring Workflow:**
```
1. <leader>sw -> Search for method name
2. Review all occurrences
3. <leader>R -> Replace all
4. <leader>xx -> Check for any errors
```

---

## 🎨 Enhanced Statusline Features

Your statusline now shows:
- 🔍 Search count (`󰍉 3/10`)
- 🤖 Active LSP servers (`󰒋 solargraph`)
- 🎬 Macro recording (`󰑋 @q`)
- 📁 File status (` ` modified, `󰌾` readonly)
- 🔧 Indentation (`󱁐 2`)
- 📝 File format (` LF`, ` CRLF`)

---

## 🚀 Pro Tips

1. **Start your day:** Use Harpoon to mark your key files
2. **Before committing:** Use `<leader>xx` to check for issues
3. **Refactoring:** Use Spectre for project-wide changes
4. **Testing:** Use `:A` to quickly jump between code and tests
5. **Debugging:** Use Trouble to see all issues at once

---

## 🔥 Next Level Usage

### Combine plugins for maximum efficiency:
1. **Harpoon + Trouble:** Mark important files, use Trouble to see issues across all of them
2. **Spectre + Dial:** Find/replace, then use Dial to toggle related values
3. **Projectionist + Harpoon:** Use `:A` to find related files, then add them to Harpoon
4. **Telescope + Harpoon:** Use `<leader>ht` to search through your marked files

Your Neovim setup is now a productivity powerhouse! 🚀 