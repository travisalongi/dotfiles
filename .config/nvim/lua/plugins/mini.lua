return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.cursorword').setup()
            require('mini.surround').setup()
            require('mini.align').setup()
            require('mini.icons').setup()
            require('mini.files').setup()
            require('mini.icons').setup()
            require('mini.pick').setup()
        end,
    }
}
