
require'colorizer'.setup()

vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 2

-- vim.cmd.colorscheme "gruvbox-material"
-- vim.cmd.colorscheme "no-clown-fiesta"
-- vim.cmd.colorscheme "darkplus"
-- vim.cmd.colorscheme "tokyobones"
-- vim.cmd.colorscheme "default"
-- vim.cmd.colorscheme "tokoyonight-night"
-- vim.cmd[[colorscheme tokyonight-night]]
-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme kanagawa-dragon]]
vim.cmd[[colorscheme kanagawa]]

-- vim.cmd('highlight Normal guibg=#000')
vim.cmd('highlight Normal guibg=#111313')
vim.cmd('highlight Visual guibg=#957FB8 guifg=#111313')
vim.cmd('highlight Search guibg=#957FB8 guifg=#111313')
vim.cmd("highlight CursorLine guibg=#1A1B25")

return {
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
        end,
}
}
