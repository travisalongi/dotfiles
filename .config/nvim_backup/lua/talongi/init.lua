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
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    "terrortylor/nvim-comment",
    { 'ethanholz/nvim-lastplace' },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-symbols.nvim' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = 'latexmk'
            vim.g.vimtex_view_skim_sync = 1
            vim.g.vimtex_view_skim_activate = 1
        end
    },

    {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    -- Niceties
    { 'stevearc/oil.nvim', },
    { 'echasnovski/mini.nvim',   version = false },
    { 'akinsho/bufferline.nvim', version = "*",  dependencies = 'nvim-tree/nvim-web-devicons' },
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    { "akinsho/toggleterm.nvim",    version = '*', config = true },
    { 'norcalli/nvim-colorizer.lua' },
    -- Colors
    "sainnhe/gruvbox-material",
    { 'aliqyan-21/darkvoid.nvim' },
    { "catppuccin/nvim",         name = "catpuccin" },
    "karb94/neoscroll.nvim",
    'rktjmp/lush.nvim',
    { 'ab-dx/ares.nvim', name = 'ares', priority = 1000 },
    'zenbones-theme/zenbones.nvim',
    'mofiqul/vscode.nvim',
    'martinsione/darkplus.nvim',
    'rebelot/kanagawa.nvim',
    'navarasu/onedark.nvim',
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },

    -- {"lukas-reineke/headlines.nvim",config=true},
    {
        'MeanderingProgrammer/markdown.nvim',
        name = 'render-markdown',              -- Only needed if you have another plugin named markdown.nvim
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- Mandatory
            'nvim-tree/nvim-web-devicons',     -- Optional but recommended
        },
        config = function()
            require('render-markdown').setup({})
        end,
        ---@type LazySpec
        {
            "mikavilpas/yazi.nvim",
            event = "VeryLazy",
            keys = {
                -- 👇 in this section, choose your own keymappings!
                {
                    "<leader>-",
                    "<cmd>Yazi<cr>",
                    desc = "Open yazi at the current file",
                },
                {
                    -- Open in the current working directory
                    "<leader>cw",
                    "<cmd>Yazi cwd<cr>",
                    desc = "Open the file manager in nvim's working directory",
                },
                {
                    -- NOTE: this requires a version of yazi that includes
                    -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
                    '<c-up>',
                    "<cmd>Yazi toggle<cr>",
                    desc = "Resume the last yazi session",
                },
            },
            ---@type YaziConfig
            opts = {
                -- if you want to open yazi instead of netrw, see below for more info
                open_for_directories = true,

                -- enable these if you are using the latest version of yazi
                -- use_ya_for_events_reading = true,
                -- use_yazi_client_id_flag = true,
                keymaps = {
                    show_help = '<f1>',
                },
            },
        }
    },

    {"Saghen/blink.cmp"},
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
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'uga-rosa/cmp-dictionary' },
            { "micangl/cmp-vimtex" },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
        },
    },

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            dashboard = {enabled=false},
        },
        keys = {
        { "<c-T>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
        { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" },
        { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
        },
    },
})


