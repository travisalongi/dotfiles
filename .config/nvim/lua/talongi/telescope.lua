-- Telescope
require('telescope').setup{
  -- change some default behavior
  defaults = {
	  prompt_prefix = ">>> ",
	  selection_caret = "* "
	  }
}

-- Telescope extensions
require('telescope').load_extension("file_browser")
require('telescope').load_extension("fzf")
require('telescope').load_extension('media_files')
require('telescope').load_extension('zoxide')
require('telescope').load_extension('harpoon')
