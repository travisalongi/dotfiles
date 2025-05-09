return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.cursorword').setup()
            require('mini.surround').setup()
            -- require('mini.pairs').setup()
            require('mini.align').setup()
            -- require('mini.sessions').setup()
            require('mini.icons').setup()
            -- require('mini.map').setup({
            --     symbols = require("mini.map").gen_encode_symbols.dot("4x2"),
            --     integrations = nil
            -- })
            require('mini.files').setup()
            -- require('mini.statusline').setup()
            require('mini.icons').setup()
            -- require('mini.tabline').setup()
            require('mini.jump2d').setup(
                {
                    -- Function producing jump spots (byte indexed) for a particular line.
                    -- For more information see |MiniJump2d.start|.
                    -- If `nil` (default) - use |MiniJump2d.default_spotter|
                    spotter = nil,

                    -- Characters used for labels of jump spots (in supplied order)
                    labels = 'abcdefghijklmnopqrstuvwxyz',

                    -- Options for visual effects
                    view = {
                        -- Whether to dim lines with at least one jump spot
                        -- dim = false,
                        dim = true,

                        -- How many steps ahead to show. Set to big number to show all steps.
                        n_steps_ahead = 1,
                    },

                    -- Which lines are used for computing spots
                    allowed_lines = {
                        blank = false,        -- Blank line (not sent to spotter even if `true`)
                        cursor_before = true, -- Lines before cursor line
                        cursor_at = true,     -- Cursor line
                        cursor_after = true,  -- Lines after cursor line
                        fold = true,          -- Start of fold (not sent to spotter even if `true`)
                    },

                    -- Which windows from current tabpage are used for visible lines
                    allowed_windows = {
                        current = true,
                        not_current = true,
                    },

                    -- Functions to be executed at certain events
                    hooks = {
                        before_start = nil, -- Before jump start
                        after_jump = nil,   -- After jump was actually done
                    },

                    -- Module mappings. Use `''` (empty string) to disable one.
                    mappings = {
                        start_jumping = '',
                    },

                    -- Whether to disable showing non-error feedback
                    silent = true,
                }
            )
        end,
    }
}
