require('lualine').setup({
  options = {
    theme = 'auto', -- Change theme
    section_separators = '', component_separators = ''
  },
  sections = {
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' }
  }
})
