return {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local fzf = require("fzf-lua")

            -- Setup fzf-lua
            fzf.setup({
                files = {
                    fd_opts = "--hidden --no-ignore", -- Disable .gitignore by default
                },
                oldfiles = { include_current_session = true },
                actions = { ['ctrl-d'] = { fn = fzf.actions.buf_del, reload = true } },
                keymap = {
                    fzf = {
                        -- use cltr-q to select all items and convert to quickfix list
                        ["ctrl-q"] = "select-all+accept",

                    },
                },
            })

            -- Register fzf-lua as the UI interface for vim.ui.select
            fzf.register_ui_select()

            -- Keymaps for FzfLua commands
            vim.keymap.set('n', "<leader>te", ":FzfLua<CR>")                   -- Open FzfLua main menu
            vim.keymap.set('n', "<leader>fz", ":FzfLua<CR>")                   -- Duplicate (optional)
            -- vim.keymap.set('n', "<leader>ff", function() fzf.files() end)      -- Open file picker
            -- vim.keymap.set('n', "<leader>fr", function() fzf.oldfiles() end)   -- Show old files
            -- vim.keymap.set('n', "<leader>bb", function() fzf.buffers() end)    -- Show buffers
            -- vim.keymap.set('n', "<leader>fg", function() fzf.live_grep() end)  -- Live grep
            -- vim.keymap.set('n', "<leader>/", function() fzf.grep_curbuf() end) -- Search current buffer
            -- vim.keymap.set('n', "z=", function() fzf.spell_suggest() end)      -- Search current buffer
        end,
    }
}
