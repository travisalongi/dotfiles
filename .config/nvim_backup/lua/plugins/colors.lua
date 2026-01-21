return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { 'morhetz/gruvbox' },
    -- { 'sainnhe/everforest' },
    {
        'neanias/everforest-nvim',
        version = false,
        priority = 1000,
        config = function()
            require('everforest').setup(
                {
                    background = 'hard',
                    ui_contrast = 'low',
                    transparent_background_level=2,
                }
            )
        end,
    },
    {
        "metalelf0/black-metal-theme-neovim",
        lazy = false,
        priority = 1000,
        config = function()
            require("black-metal").setup({
                -- optional configuration here
            })
            require("black-metal").load()
        end,
    },
    {
        "mcauley-penney/phobos-anomaly.nvim",
        config = function()
            vim.cmd.colorscheme("phobos-anomaly")
        end,
        priority = 1000
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "thesimonho/kanagawa-paper.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { 'ellisonleao/gruvbox.nvim' },
    { 'projekt0n/github-nvim-theme', name = 'github-theme' },
    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("oldworld").setup(
                {
                    variant = "oled", -- default, oled, cooler
                    styles = {
                        booleans = { italic = false, bold = false },
                        functions = { bold = false }, -- style for functions
                        comments = { italic = true, bold = false },
                        highlight_overrides = {
                            Comment = { bg = "#ff0000" }
                        }
                    },
                }
            )
        end,
    },
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "webhooked/kanso.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            -- vim.cmd([[colorscheme kanagawa-dragon]])
            -- vim.cmd([[colorscheme oldworld]])
            -- vim.cmd([[colorscheme catppuccin-latte]])
            -- vim.g.everforest_background = 'hard'
            vim.cmd([[colorscheme everforest]])
            -- vim.cmd([[colorscheme github_light_default]])
            -- vim.cmd('highlight Normal guibg=#111313')
            -- vim.cmd('highlight Visual guibg=#957FB8 guifg=#111313')
            -- vim.cmd('highlight Search guibg=#957FB8 guifg=#111313')
            vim.cmd('highlight MiniCursorwordCurrent guibg=#c2ffb3')
        end,
    }
}
