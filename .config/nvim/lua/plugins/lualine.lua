require('lualine').setup{
  options = { theme  = 'palenight' },
  sections = {
    lualine_a = {{'mode', upper = true}},
    lualine_b = {{"branch", icon = ''}},
    lualine_c = {
      {'filename', file_status = true, full_path = true, shorten = true},
      "b:gitsigns_status"
    },
    lualine_x = {
      "location",
      {
        "diagnostics",
        sources = {"nvim_lsp"}
      }, 'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
