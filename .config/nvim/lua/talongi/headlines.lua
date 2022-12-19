vim.cmd [[highlight Headline1 guibg=#403d52]]
vim.cmd [[highlight Headline2 guibg=#524f67]]
vim.cmd [[highlight Headline3 guibg=#908caa]]
vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]

require("headlines").setup {
    org = {
        headline_highlights = { "Headline1", "Headline2", "Headline2" },
    },
    markdown = {
        headline_highlights = { "Headline1", "Headline2", "Headline2" },
    },
}
