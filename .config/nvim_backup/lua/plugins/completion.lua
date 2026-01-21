return {
    -- {"uga-rosa/cmp-dictionary"},
    -- {
    --     'saghen/blink.compat',
    --     -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    --     version = '*',
    --     -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    --     lazy = true,
    --     -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    --     opts = {},
    -- },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets', 'Kaiser-Yang/blink-cmp-dictionary', 'saghen/blink.compat' },
        version = '*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- See the full "keymap" documentation for information on defining your own keymap.
            keymap = { preset = 'default' },

            completion = {
                menu = { border = 'single' },
                accept = { auto_brackets = { enabled = true }, },
                documentation = { auto_show = true, auto_show_delay_ms = 100, window = { border = 'single' } },
                ghost_text = { enabled = true },
                -- mini.icons
                menu = {
                    draw = {
                        components = {
                            kind_icon = {
                                ellipsis = false,
                                text = function(ctx)
                                    local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                                    return kind_icon
                                end,
                                -- Optionally, you may also use the highlights from mini.icons
                                highlight = function(ctx)
                                    local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                    return hl
                                end,
                            }
                        }
                    }
                },
            },
            -- signature = { window = { border = 'single' } },

            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = 'normal'
            },

            sources = {
                default = { 'lsp', 'path', 'buffer', 'dictionary', 'snippets' },
                providers = {
                    lsp = {
                        score_offset = 90,
                        max_items = 8,
                    },
                    path = {
                        max_items = 5,
                        score_offset = 15,
                    },
                    buffer = {
                        max_items = 5,
                        score_offset = 20
                    },

                    dictionary = {
                        module = 'blink-cmp-dictionary',
                        name = 'Dict',
                        -- Make sure this is at least 2.
                        -- 3 is recommended
                        min_keyword_length = 3,
                        opts = {
                            dictionary_directories = { vim.fn.expand("~/.config/nvim/dict") },
                            dictionary_files = { vim.fn.expand("~/.config/nvim/spell/en.utf-8.add") }
                        },
                        score_offset = 10,
                        max_items = 5,
                    },
                    -- markdown = {
                    --     name = 'RenderMarkdown',
                    --     module = 'render-markdown.integ.blink',
                    --     fallbacks = { 'lsp' },
                    -- }
                },
            },

        },
        opts_extend = { "sources.default" },

        config = function(_, opts)
            -- Setup the plugin
            require('blink.cmp').setup(opts)

            -- Set custom highlights
            -- vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#1f1f28", fg = "#dcd7ba" })
            -- vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "#1f1f28", fg = "#dcd7ba" })
            -- vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#1f1f28", fg = "#dcd7ba" })
            -- vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "#1f1f28", fg = "#dcd7ba" })
        end,
    },
}
