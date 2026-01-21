return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    -- @module 'obsidian'
    -- @type obsidian.config.ClientOpts
    opts = {
        ui = { enable = false },
        workspaces = {
            {
                name = "Notesap",
                path = "~/Documents/Notesap/",
            },
        },
        daily_notes = {
            folder = "7_daily_notes",
            workdays_only = true
        },
        completion = {
            nvim_cmp = false,
            blink = true,
            min_chars = 2,
        },
        new_notes_location = "1_rough_notes",
        picker = {
            name = 'snacks.pick'
        },
        attachments = {
            folder = "assets"
        },
        templates = {
            folder = "./5_templates",
            date_format = "%Y-%m-%d-%a",
            time_format = "%H:%M",
        },
        legacy_commands = false
    },
}
