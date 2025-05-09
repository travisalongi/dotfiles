return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({

                options = {
                    -- theme = 'kanagawa',
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '|', right = '|' },
                    disabled_filetypes = {'latex','markdown'}
                },
                sections = {
                    lualine_a = {
                        {
                            'mode',
                            icons_enabled = true,
                            separator = { left = '', right = '' },
                            right_padding = -1
                        },
                    },
                    lualine_b = { 'branch','diff', 'diagnostics' },
                    lualine_c = {
                        {
                            'filename',
                            -- {'',
                            path = 1,
                            symbols = {
                                modified = '+', -- Text to show when the file is modified.
                                readonly = ' ﰸ ', -- Text to show when the file is non-modifiable or readonly.
                                unnamed = '[No Name]', -- Text to show for unnamed buffers.
                                newfile = '[New]', -- Text to show for new created file before first writting
                            },
                            shortening_target = 10,
                        },

                    },
                    lualine_x = { {'lsp_status', }, { 'filetype', icon_only = true }, },
                    lualine_y = { 'progress' },
                    lualine_z = {}
                    -- lualine_z = {
                    --     { 'location', separator = { left = '', right = '' }, left_padding = -1 },
                    -- },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = { 'toggleterm','oil','overseer' }

            })
        end
    },
}
