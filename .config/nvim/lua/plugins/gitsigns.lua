require('gitsigns').setup{
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    added        = {hl = 'GitSignsAdd'   , text = '', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  current_line_blame = true,
  current_line_blame_delay = 1000,
  current_line_blame_position = 'eol',
  status_formatter = function(status)
    local added, changed, removed = status.added, status.changed, status.removed
    local status_txt = {}
    if added   and added   > 0 then table.insert(status_txt, ' '..added) end
    if changed and changed > 0 then table.insert(status_txt, ' '..changed) end
    if removed and removed > 0 then table.insert(status_txt, ' '..removed) end
    return table.concat(status_txt, ' ')
  end
}
