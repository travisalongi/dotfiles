return
{
    'stevearc/quicker.nvim',
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
    config = function()
        require('quicker').setup({})
        vim.keymap.set("n", "<leader>q", function()
            require('quicker').toggle()
        end)
    end

}
