local status_ok, render_markdown = pcall(require, "render-markdown")
if not status_ok then
  return
end

render_markdown.setup({
  latex = {
    enabled = false  -- Disable LaTeX support to avoid warnings
  },
  -- Keep other default settings
  enabled = true,
  max_file_size = 1.5,  -- MB
  debounce = 100,
  render_modes = true,
  anti_conceal = {
    enabled = true,
  },
  heading = {
    enabled = true,
    sign = true,
    position = 'overlay',
    icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    signs = { '󰫎 ' },
    width = 'full',
    left_pad = 0,
    right_pad = 0,
    min_width = 0,
  },
}) 