require('mini.pick').setup()

-- require('mini.animate').setup()

-- -- vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { fg = "#ea6962", bg = "#504945", bold = true })
-- vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { fg = "#eeeeee", bg = "#D38DD9", bold = true })
-- vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { fg = "#eeeeee", bg = "#D38DD9", bold = true,italic=true })
-- vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { fg = "#eeeeee", bg = "#D38DD9", bold = true })
-- -- vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { fg = "#ea6962", bg = "#504945", italic = true })
-- -- vim.api.nvim_set_hl(0, "MiniTablineHidden", { fg = "#d4be98", bg = "#504945", italic=true})
-- vim.api.nvim_set_hl(0, "MiniTablineCurrent", { fg = "#eeeeee", bg = "#0A7ACA", italic = true})
-- vim.api.nvim_set_hl(0, "MiniJump2Dspot", { bg = "#eeeeee", fg = "#111111", bold = true})

-- require('mini.indentscope').setup(
--     {symbol = "|"}
-- )

require('mini.tabline').setup(
    {
        -- Whether to show file icons (requires 'nvim-tree/nvim-web-devicons')
        show_icons = true,

        -- Function which formats the tab label
        -- By default surrounds with space and possibly prepends with icon
        format = nil,

        -- Whether to set Vim's settings for tabline (make it always shown and
        -- allow hidden buffers)
        set_vim_settings = true,

        -- Where to show tabpage section in case of multiple vim tabpages.
        -- One of 'left', 'right', 'none'.
        tabpage_section = 'left',
    }
)

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

require('mini.files').setup(
-- No need to copy this inside `setup()`. Will be used automatically.
    {
        -- Customization of shown content
        content = {
            -- Predicate for which file system entries to show
            filter = nil,
            -- What prefix to show to the left of file system entry
            prefix = nil,
            -- In which order to show file system entries
            sort = nil,
        },

        -- Module mappings created only inside explorer.
        -- Use `''` (empty string) to not create one.
        mappings = {
            close       = 'q',
            go_in       = 'l',
            go_in_plus  = 'L',
            go_out      = 'h',
            go_out_plus = 'H',
            reset       = '<BS>',
            reveal_cwd  = '@',
            show_help   = 'g?',
            synchronize = '=',
            trim_left   = '<',
            trim_right  = '>',
        },

        -- General options
        options = {
            -- Whether to delete permanently or move into module-specific trash
            permanent_delete = true,
            -- Whether to use for editing directories
            use_as_default_explorer = true,
        },

        -- Customization of explorer windows
        windows = {
            -- Maximum number of windows to show side by side
            max_number = math.huge,
            -- Whether to show preview of file/directory under cursor
            preview = false,
            -- Width of focused window
            width_focus = 50,
            -- Width of non-focused window
            width_nofocus = 15,
            -- Width of preview window
            width_preview = 25,
        },
    }
)
