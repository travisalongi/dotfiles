require("toggleterm").setup {
 hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  open_mapping = [[<c-\>]],
  --start_in_insert = true,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  terminal_mappings = false, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = 'vertical',
  close_on_exit = true, -- close the terminal window when the process exits
  --shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' 'border 'is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved',
    --width = 0.85,
    --height = 0.85,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}
