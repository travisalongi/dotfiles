vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        -- separator_style = 'thick',
        separator_style = 'slant',
        offsets = {
            { filetype = "Nvimtree",
                text = "File Explorer",
                highlight = "Directory"
            },
            { filetype = "Oil",
                text = "Oil - File Explorer" }
        }
    }
}
