require('talongi.remap')
require('talongi.set')

-- Lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({

        "git",
        "clone",

        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
    { "nvim-treesitter/nvim-treesitter",            build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    'mbbill/undotree',
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                config = {
                    header = {},
                    shortcut_type = 'number',
                    packages = { enable = false },
                    project = { enable = false },
                    week_header = { enable = false },
                    footer = { ' K e e p  it  S i m p l e ' },
                    mru = { limit = 5, label = 'Recent Files' },
                    shortcut = {
                        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        { desc = ' Quit',    group = '@property', action = 'quit',        key = 'q' }
                    },
                },
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    "terrortylor/nvim-comment",
    {
        'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup {}
        end
    },
    { 'ethanholz/nvim-lastplace' },
    { 'ggandor/leap.nvim' },
    --
    -- Telescope stuff
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    { 'nvim-telescope/telescope-symbols.nvim' },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make' },
    -- { "nvim-telescope/telescope-fzy-native.nvim" },
    { "jvgrootveld/telescope-zoxide" },
    -- Fzf - Lua (testing if better for me than Telescope)
    { 'stevearc/oil.nvim', },
    --
    -- Pretty things
    "catppuccin/nvim",
    as = "catppuccin",
    "rebelot/kanagawa.nvim",
    "sainnhe/gruvbox-material",
    "norcalli/nvim-colorizer.lua",
    { 'Everblush/nvim',          name = 'everblush' },
    { 'akinsho/bufferline.nvim', version = "v3.*",  dependencies = 'nvim-tree/nvim-web-devicons' },
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    { "akinsho/toggleterm.nvim", version = '*', config = true },
    -- Completion and LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            -- { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            -- { 'rafamadriz/friendly-snippets' },
        },
    }
})
