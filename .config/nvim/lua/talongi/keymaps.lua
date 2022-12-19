local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Movement with wrapped text
keymap("n", "j", "gj", { silent = true })
keymap("n", "k", "gk", { silent = true })

vim.g.mapleader = ' '
-- jk to escape
-- keymap("i", "jk", "<esc>", { silent = true })

-- Replace word below cursor?
keymap("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Window motions
keymap("n", "<leader>wh", ":wincmd h<CR>")
keymap("n", "<leader>wj", ":wincmd j<CR>")
keymap("n",  "<leader>wk", ":wincmd k<CR>")
keymap("n",  "<leader>wl", ":wincmd l<CR>")
keymap("n",  "<leader>wH", ":wincmd H<CR>")
keymap("n",  "<leader>wJ", ":wincmd J<CR>")
keymap("n",  "<leader>wK", ":wincmd K<CR>")
keymap("n",  "<leader>wK", ":wincmd K<CR>")
keymap("n",  "<leader>wL", ":wincmd L<CR>")
keymap("n",  "<leader>wc", ":wincmd c<CR>")
keymap("n",  "<leader>wo", ":wincmd o<CR>")
keymap("n",  "<leader>w=", ":wincmd =<CR>")
keymap("n",  "<leader>wn", ":vnew<CR>")

-- To the end of the line
keymap("n","Y", "y$")
keymap("n","V", "v$")

-- Keep searches centered
keymap("n","n","nzzzv")
keymap("n","N","Nzzzv")
keymap("n","}","}zzzv")
keymap("n","{","{zzzv")
keymap("n","G","Gzz")

-- Move lines up and down
-- keymap("v", "J", ":m '>+1<CR>gv=gv")
-- keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("i", "<C-j", "<esc>:m .+1<CR>==")
keymap("i", "<C-k", "<esc>:m .-2<CR>==")
keymap("n", "<leader>j", ":m .+1<CR>==")
keymap("n", "<leader>k", ":m .-2<CR>==")

-- Telescope
keymap("n", "<leader>te", ":Telescope<CR>")
keymap("n", "<leader>ff", ":Telescope find_files theme=ivy<CR>")
keymap("n", "<leader>fg", ":Telescope live_grep theme=ivy<CR>")
keymap("n", "<leader>fb", ":Telescope file_browser hidden=true theme=ivy<CR>")
keymap("n", "<leader>fr", ":Telescope oldfiles theme=ivy<CR>")
keymap("n", "<leader>bb", ":Telescope buffers theme=ivy<CR>")
keymap("n", "<leader>d", ":Telescope diagnostics theme=ivy<CR>")
keymap("n", "z=", ":Telescope spell_suggest theme=ivy<CR>")
keymap("n", "<leader>zz", ":Telescope zoxide list theme=ivy<CR>")
keymap("n", "<leader>de", ":lua require('telescope').extensions.dict.synonyms()<CR>")

-- Harpoon
keymap("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true })
keymap("n", "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>zz", { silent = true })
keymap("n", "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>zz", { silent = true })
keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { silent = true })

-- Terminal 
keymap("n", "<leader>tt", ":ToggleTerm size=95<CR>")
keymap("n", "<leader>1", ":1ToggleTerm size=95<CR>")
keymap("n", "<leader>2", ":2ToggleTerm size=95<CR>")
keymap("n", "<leader>tf", ":ToggleTerm direction=float float_opts.border=double<CR>")
keymap("n", "<leader>lf", ":TermExec cmd='lf' direction=float<CR>")
keymap("n", "<leader>gg", ":TermExec cmd='lazygit' direction=float<CR>")
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Commands
keymap("n", "<leader>gh", ":Alpha<CR>", { silent = true })
keymap("n", "<leader>q", ":q<CR>")
keymap("n", "<leader>p", ":pwd<CR>")
keymap("n", "<leader>sz", ":so ~/.config/nvim/init.vim<CR>")
-- Buffers
keymap("n", "<leader>bn", ":bn<CR>zz")
keymap("n", "<leader>bp", ":bp<CR>zz")
keymap("n", "H", ":bp<CR>zz")
keymap("n", "L", ":bn<CR>zz")

keymap("n", "<leader>bd", ":bdelete<CR>")
keymap("n", "<leader>bk", ":bdelete<CR>")
-- Tabs
keymap("n", "<leader>tp", ":tabNext<CR>zz")
keymap("n", "<leader>tn", ":tabprevious<CR>zz")
keymap("n", "<leader>tc", ":tabclose<CR>")
-- Other
keymap("n", "<leader>bs", ":Beacon<CR>")
keymap("n", "<leader>zm", ":ZenMode<CR>")
keymap("n", "<leader>f", ":!black -l 80 %<CR>")

keymap('n', '<leader>K', '<cmd>lua vim.lsp.buf.hover()<CR>', {buffer=0})
keymap("n", "<leader>coh", ":w !pandoc -f markdown -t html | xclip -sel clip<CR>")
keymap("n", "<leader>ft", ":NvimTreeToggle<CR>")
keymap("n", "<leader>cd", ":lcd %:p:h<CR>")

-- Python stuff
-- keymap("n", " tp", ":TermExec cmd='ipython' direction=vertical size=80 <CR>")
keymap("n", "<F5>", "<esc>:terminal ipython -i --no-banner %<CR><CR>")
keymap("n", "<F8>", "<esc>:ToggleTermSendVisualLines<CR>")
keymap("n", "<F9>", "<esc>:ToggleTermSendCurrentLine<CR><CR>")

-- Remap for leap plugin
keymap("n", "s", "<Plug>(leap-forward)")

-- LSP stuff -- not sure the problem
-- local opts = { noremap = true, silent = true }
-- keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- keymap('n', '<leader>dh', '<cmd> lua vim.diagnostic.hide()<CR>', opts)
-- keymap('n', '<leader>ds', '<cmd> lua vim.diagnostic.show()<CR>', opts)

-- -- Mappings.
-- -- See `:help vim.lsp.*` for documentation on any of the below functions
-- keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- -- keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

