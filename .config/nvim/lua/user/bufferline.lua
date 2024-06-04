local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup({
  options = {
    numbers = "none",
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,

    -- VSCode-style indicators and icons
    indicator = { style = "icon", icon = "▎" },
    buffer_close_icon = "󰅖",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",

    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 21,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,

    -- VSCode-style offsets
    offsets = {
      {
        filetype = "NvimTree",
        text = "󰄛 Explorer",
        text_align = "left",
        separator = true
      }
    },
    
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin", -- VSCode-like thin separators
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
    },
  },
  
  -- VSCode-inspired color scheme
  highlights = {
    fill = {
      fg = "#7C7C7C",
      bg = "#252526",
    },
    background = {
      fg = "#9D9D9D",
      bg = "#2D2D30",
    },
    tab = {
      fg = "#9D9D9D",
      bg = "#2D2D30",
    },
    tab_selected = {
      fg = "#FFFFFF",
      bg = "#1E1E1E",
    },
    buffer_visible = {
      fg = "#9D9D9D",
      bg = "#2D2D30",
    },
    buffer_selected = {
      fg = "#FFFFFF",
      bg = "#1E1E1E",
      bold = false,
      italic = false,
    },
    modified = {
      fg = "#9D9D9D",
      bg = "#2D2D30",
    },
    modified_selected = {
      fg = "#FFFFFF",
      bg = "#1E1E1E",
    },
    duplicate_selected = {
      fg = "#FFFFFF",
      bg = "#1E1E1E",
      italic = false,
    },
    duplicate_visible = {
      fg = "#9D9D9D",
      bg = "#2D2D30",
      italic = false,
    },
    duplicate = {
      fg = "#9D9D9D",
      bg = "#2D2D30",
      italic = false,
    },
    separator_selected = {
      fg = "#1E1E1E",
      bg = "#1E1E1E",
    },
    separator_visible = {
      fg = "#2D2D30",
      bg = "#2D2D30",
    },
    separator = {
      fg = "#2D2D30",
      bg = "#2D2D30",
    },
    indicator_selected = {
      fg = "#007ACC",
      bg = "#1E1E1E",
    },
    close_button = {
      fg = "#9D9D9D",
      bg = "#2D2D30",
    },
    close_button_visible = {
      fg = "#9D9D9D",
      bg = "#2D2D30",
    },
    close_button_selected = {
      fg = "#FFFFFF",
      bg = "#1E1E1E",
    },
  },
})
