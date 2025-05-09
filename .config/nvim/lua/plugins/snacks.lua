return
{
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        image = {
            enabled = true,
            doc = {
                -- enable image viewer for documents
                -- a treesitter parser must be available for the enabled languages.
                -- supported language injections: markdown, html
                enabled = true,
                -- render the image inline in the buffer
                -- if your env doesn't support unicode placeholders, this will be disabled
                -- takes precedence over `opts.float` on supported terminals
                inline = false,
                -- render the image in a floating window
                -- only used if `opts.inline` is disabled
                float = true,
                max_width = 80,
                max_height = 40,
            },
            math = {
                enabled = false,
            }
        },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = {
            enabled = false,
            {
                left = { "mark", "sign" }, -- priority of signs on the left (high to low)
                right = { "fold", "git" }, -- priority of signs on the right (high to low)
                folds = {
                    open = true,           -- show open fold icons
                    git_hl = false,        -- use Git Signs hl for fold icons
                },
            }
        },
        words = { enabled = true },
        terminal = {
            win = {
                style = 'float',
                height = 0.8,
                width = 0.9,
                border = 'rounded',
                title = 'Terminal',
                title_pos = "center",
                backdrop = { transparent = true, blend = 40 },

            },

            keys = {
                q = "hide",
                term_normal = {
                    "<esc>",
                    function(self)
                        self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
                        if self.esc_timer:is_active() then
                            self.esc_timer:stop()
                            vim.cmd("stopinsert")
                        else
                            self.esc_timer:start(500, 0, function() end)
                            return "<esc>"
                        end
                    end,
                    mode = "t",
                    expr = true,
                    desc = "Double escape to normal mode",
                },

            },
            styles = {
                notification = {
                    -- wo = { wrap = true } -- Wrap notifications
                },
            },
        },
        zen = {
            enabled = true,
            enter = true,
            fixbuf = false,
            minimal = true,
            width = 80,
            height = 0,
            backdrop = { transparent = true, blend = 40 },
            keys = { q = false },
            zindex = 40,
            wo = {
                winhighlight = "NormalFloat:Normal",
            },
        },
        picker = {
            win = {
                -- input window
                input = {
                    keys = {
                        ["<c-A>"] = { "select_all", mode = { "n", "i" } },
                    }
                }
            },
            matcher = {
                cwd_bonus = true,
                frequency = true
            }
        }
    },
    keys = {
        { "<leader>z",  function() Snacks.zen() end,                                                desc = "Toggle Zen Mode" },
        -- { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
        { "<leader>.",  function() Snacks.scratch() end,                                            desc = "Toggle Scratch Buffer" },
        { "<leader>S",  function() Snacks.scratch.select() end,                                     desc = "Select Scratch Buffer" },
        { "<leader>n",  function() Snacks.notifier.show_history() end,                              desc = "Notification History" },
        { "<leader>bd", function() Snacks.bufdelete() end,                                          desc = "Delete Buffer" },
        { "<leader>cR", function() Snacks.rename.rename_file() end,                                 desc = "Rename File" },
        { "<leader>gB", function() Snacks.gitbrowse() end,                                          desc = "Git Browse",                  mode = { "n", "v" } },
        { "<leader>gb", function() Snacks.git.blame_line() end,                                     desc = "Git Blame Line" },
        { "<leader>gf", function() Snacks.lazygit.log_file() end,                                   desc = "Lazygit Current File History" },
        { "<leader>gg", function() Snacks.lazygit() end,                                            desc = "Lazygit" },
        { "<leader>gl", function() Snacks.lazygit.log() end,                                        desc = "Lazygit Log (cwd)" },
        { "<leader>un", function() Snacks.notifier.hide() end,                                      desc = "Dismiss All Notifications" },
        { "<c-/>",      function() Snacks.terminal() end,                                           desc = "Toggle Terminal" },
        { "<c-_>",      function() Snacks.terminal() end,                                           desc = "which_key_ignore" },
        { "]]",         function() Snacks.words.jump(vim.v.count1) end,                             desc = "Next Reference",              mode = { "n", "t" } },
        { "[[",         function() Snacks.words.jump(-vim.v.count1) end,                            desc = "Prev Reference",              mode = { "n", "t" } },

        { "<leader>sp", function() Snacks.picker() end,                                             desc = "Fuzzy Finder",                mode = { "n", "t" } },
        { "<leader>ff", function() Snacks.picker.files({ ignored = true, layout = "default" }) end, desc = "Fuzzy Finder",                mode = { "n", "t" } },
        { "<leader>fr", function() Snacks.picker.smart() end,                                       desc = "Fuzzy Finder",                mode = { "n", "t" } },
        { "<leader>bb", function() Snacks.picker.buffers({ layout = "ivy" }) end,                   desc = "Fuzzy Finder",                mode = { "n", "t" } },
        { "<leader>fg", function() Snacks.picker.grep() end,                                        desc = "Fuzzy Finder",                mode = { "n", "t" } },
        { "<leader>zo", function() Snacks.picker.zoxide() end,                                      desc = "Fuzzy Finder",                mode = { "n", "t" } },
        { "<leader>/",  function() Snacks.picker.lines() end,                                       desc = "Fuzzy Finder",                mode = { "n", "t" } },
        { "z=",         function() Snacks.picker.spelling({ layout = "select" }) end,               desc = "Fuzzy Finder",                mode = { "n", "t" } },
        {
            "<leader>N",
            desc = "Neovim News",
            function()
                Snacks.win({
                    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                    width = 0.6,
                    height = 0.6,
                    wo = {
                        spell = false,
                        wrap = false,
                        signcolumn = "yes",
                        statuscolumn = " ",
                        conceallevel = 3,
                    },
                })
            end,
        }
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.line_number():map("<leader>ul")
                Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                    :map("<leader>uc")
                Snacks.toggle.treesitter():map("<leader>uT")
                -- Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
                Snacks.toggle.inlay_hints():map("<leader>uh")
                Snacks.toggle.indent():map("<leader>ug")
                Snacks.toggle.dim():map("<leader>uD")
            end,
        })
    end,
}
