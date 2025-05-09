local keymap = vim.keymap.set
vim.g.mapleader = " "
-- vim.keymap.set("i", "jk", "<esc>")
-- vim.keymap.set("v", "jk", "<esc>")
-- vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>te", vim.cmd.Telescope)
vim.keymap.set("n", ";", ':lua MiniJump2d.start(MiniJump2d.builtin_opts.word_start)<CR>')
vim.keymap.set("n", "<leader>mf", ':Pick files<CR>')
vim.keymap.set("n", "<leader>mb", ':Pick buffers<CR>')
vim.keymap.set("n", "<leader>mt", ':lua MiniFiles.open()<CR>')


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- Keep things centered
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")


vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>n", ":set rnu<CR>")
vim.keymap.set("n", "<F5>", ":!python %<CR> &")

-- Toggle term
keymap("n", "<leader>1", ":1ToggleTerm direction=vertical size=80<CR>")
keymap("n", "<leader>2", ":2ToggleTerm direction=vertical size=80<CR>")
-- keymap("n", "<F1>", ":1ToggleTerm size=95<CR>")
keymap("n", "<leader>tf", ":1ToggleTerm direction=float name=TERMINAL<CR>")
keymap("n", "<leader>tt", ":ToggleTerm direction=float <CR>")
keymap("n", "<leader>th", ":ToggleTerm direction=horizontal <CR>")
keymap("n", "<F9>", ":ToggleTermSendCurrentLine<CR>")
keymap("v", "<F8>", ":ToggleTermSendVisualLines<CR>")
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Window motions
keymap("n", "<leader>wh", ":wincmd h<CR>")
keymap("n", "<leader>wj", ":wincmd j<CR>")
keymap("n", "<leader>wk", ":wincmd k<CR>")
keymap("n", "<leader>wl", ":wincmd l<CR>")
keymap("n", "<leader>wH", ":wincmd H<CR>")
keymap("n", "<leader>wJ", ":wincmd J<CR>")
keymap("n", "<leader>wK", ":wincmd K<CR>")
keymap("n", "<leader>wK", ":wincmd K<CR>")
keymap("n", "<leader>wL", ":wincmd L<CR>")
keymap("n", "<leader>wc", ":wincmd c<CR>")
keymap("n", "<leader>wo", ":wincmd o<CR>")
keymap("n", "<leader>w=", ":wincmd =<CR>")
keymap("n", "<leader>wn", ":vnew<CR>")

-- To the end of the line
keymap("n", "Y", "y$")
keymap("n", "V", "v$")
keymap("v", "Y", '"+y"') -- Copys visual selction to system clipboard

-- Buffers
keymap("n", "<leader>bn", ":bn<CR>zz")
keymap("n", "<leader>bp", ":bp<CR>zz")
keymap("n", "H", ":bp<CR>zz")
keymap("n", "L", ":bn<CR>zz")
keymap("n", "<leader>bd", ":bdelete<CR>")
keymap("n", "<leader>bk", ":bdelete<CR>")

keymap("n", "<leader>cd", ":lcd %:p:h<CR>")
keymap("n", "<leader>ft", ":Oil<CR>")
-- keymap("n", "<leader>ft", ":lua MiniFiles.open()<CR>")
keymap("n", "<leader>bl", ":!black -l 80 %<CR>")
keymap("n", "<leader>p", ":pwd<CR>")

keymap("n", "<leader>md", ":lua require('render-markdown').toggle()<CR>", {silent=true})
keymap("n", "<leader>nh", ":nohlsearch<CR>", { silent = true })
-- keymap("n", "<leader>wc", "g<C-g>")
-- keymap("n", "s", "<Plug>(leap-forward)")
-- keymap("n", "S", "<Plug>(leap-backward)")
-- keymap("n", "gs", "<Plug>(leap-from-window)")
-- "some text power to surround"
