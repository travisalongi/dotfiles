return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },

    {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
},

    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },

        opts = {
            servers = {
                lua_ls = {}, -- Correct LSP server name
                ruff = {},
                yamlls = {},
                pyright = { -- Pyright server configuration
                    settings = {
                        python = {
                            analysis = {
                                diagnosticSeverityOverrides = {
                                    -- Disable specific warnings
                                    ["reportMissingImports"] = "none", 
                                    ["reportUnusedImport"] = "none",  
                                    ["reportUnusedVariable"] = "none",
                                    ["reportAttributeAccessIssue"] = "none",
                                    ["reportOptionalMemberAccess"] = "none",
                                    ["reportOptionalSubscript"] = "none",
                                    ["reportArgumentType"] = "none",
                                    ["reportCallIssues"] = "none"
                                },
                            },
                        },
                    },
                },
                markdown_oxide = {},
                texlab = {},
            }
        },

        -- Single `config` function to handle LSP setup
        config = function(_, opts)
            local lspconfig = require('lspconfig')
            -- local capabilities = require('blink.cmp').get_lsp_capabilities()

            for server, config in pairs(opts.servers) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end

            vim.keymap.set("n", "gd", vim.lsp.buf.definition)
            vim.keymap.set("n", "K", vim.lsp.buf.hover)
            vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
            vim.keymap.set("n", "<leader>vw", vim.lsp.buf.workspace_symbol)
            vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
            vim.keymap.set("n", "<leader>vc", vim.lsp.buf.code_action)
            vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references)
            vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)
            vim.diagnostic.config({
                float = { border = 'rounded' },
                signs = {
                    warning = { text = "~" } -- Replace with your desired symbol
                }
            })
        end

    }
}
