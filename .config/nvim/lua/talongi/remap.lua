local keymap = vim.keymap.set
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>te", vim.cmd.Telescope)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Toggle term
keymap("n", "<leader>1", ":1ToggleTerm size=95<CR>")
keymap("n", "<leader>2", ":2ToggleTerm size=95<CR>")
keymap("n", "<leader>tf", ":ToggleTerm direction=float float_opts.border=double<CR>")
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

-- Buffers
keymap("n", "<leader>bn", ":bn<CR>zz")
keymap("n", "<leader>bp", ":bp<CR>zz")
keymap("n", "H", ":bp<CR>zz")
keymap("n", "L", ":bn<CR>zz")
keymap("n", "<leader>bd", ":bdelete<CR>")
keymap("n", "<leader>bk", ":bdelete<CR>")

keymap("n", "<leader>cd", ":lcd %:p:h<CR>")
keymap("n", "<leader>ft", ":NvimTreeToggle<CR>")
keymap("n", "<leader>bl", ":!black -l 80 %<CR>")
keymap("n", "<leader>p", ":pwd<CR>")

keymap("n", "s", "<Plug>(leap-forward)")

