-- Lualine status bar
require('lualine').setup({
  options = {
    theme = 'onedark',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    },
  sections = {
	  lualine_a = {
		{'mode', separator = {left = '', right = ''}, right_padding = 2},
	  },
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {
	    {'location', separator = {left = '', right =  ''}, left_padding = 2},
	    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})
