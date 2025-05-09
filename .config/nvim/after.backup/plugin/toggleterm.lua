require("toggleterm").setup {
    hide_numbers = true,  -- hide the number column in toggleterm buffers
    shade_terminals = true,
    shading_factor = '2', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    open_mapping = [[<c-\>]],
    --start_in_insert = true,
    insert_mappings = false,   -- whether or not the open mapping applies in insert mode
    terminal_mappings = false, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    direction = 'vertical',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell,  -- change the default shell
    float_opts = {
        border = 'double',
        -- width = 0.90,
        -- height = 0.90,
        title_pos = 'center',
        winblend = 0,
    },
}
