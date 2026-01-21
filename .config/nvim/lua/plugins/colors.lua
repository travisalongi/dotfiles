return {

    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = {},
    },

    { "catppuccin/nvim", name = "catppuccin", lazy=true },

    { 'ellisonleao/gruvbox.nvim', lazy=true },

    { 'projekt0n/github-nvim-theme', name = 'github-theme', lazy=true },

    { "rebelot/kanagawa.nvim", },

    {
        'neanias/everforest-nvim',
        version = false,
        priority = 1000,
        config = function()
            require('everforest').setup(
                {
                    background = 'hard',
                    ui_contrast = 'low',
                    transparent_background_level = 2,
                }
            )

            vim.schedule(function()
                vim.cmd([[colorscheme everforest]])
                vim.cmd('set background=light')
                vim.cmd('highlight MiniCursorwordCurrent guibg=#c2ffb3')
                -- vim.cmd('highlight clear Visual')
            end)
        end,
    },

    { 'mistweaverco/vhs-era-theme.nvim' },

    { "serhez/teide.nvim", lazy = false, priority =1000, opts = {}},

}
