return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.configs'.setup({
            ensure_installed = { "c", "lua", "python" },
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            -- List of parsers to ignore installing (for "all")
            ignore_install = { "javascript" },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
