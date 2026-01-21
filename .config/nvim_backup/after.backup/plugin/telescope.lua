local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', 'z=', builtin.spell_suggest, {})


require('telescope').setup {
    defaults = {
        -- ...
    layout_config = {
        horizontal = {
            width = {padding = 0.02},
            height = {padding = 0.02},
            preview_width = 0.5,
        },
    },
    },


    pickers = {
        find_files = {
            -- theme = "ivy",
        },
        buffers = {
            -- theme = "ivy",
        },
        oldfiles = {
            -- theme = "ivy",
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        },
        -- fzy_native = {
        --     override_generic_sorter = false,
        --     override_file_sorter = true,
        --     case_mode = "ignore_case"
        -- },
        file_browser = {},
    },
}
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('fzy_native')
-- require('telescope').load_extension('file_browser')
