require('lualine').setup({
  options = {
    theme = 'auto', -- Change theme
    section_separators = { left = '', right = '' },  -- Arrow effect
    component_separators = { left = ' ', right = ' ' }, -- Small arrows
  },
  sections = {
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' }
  }
})
