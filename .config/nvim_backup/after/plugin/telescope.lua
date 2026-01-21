local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', 'z=', builtin.spell_suggest, {})

require("telescope").load_extension "fzf"
require('telescope').setup {
    defaults = {
        -- ...
    },
    pickers = {
        find_files = {
            theme = "ivy",
        },
        buffers = {
            theme = "ivy",
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            overrride_file_sorter = true,
            case_mode = "ignore_case"
        }
    }
}

require("telescope").load_extension "file_browser"
require("telescope").load_extension "zoxide"

vim.keymap.set('n', '<leader>fb', ":Telescope file_browser theme=ivy<CR>", { noremap = true })
vim.keymap.set('n', '<leader>zz', ":Telescope zoxide list theme=ivy<CR>", { noremap = true })
