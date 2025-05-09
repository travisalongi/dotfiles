local keymap = vim.keymap.set
local cmd = vim.cmd
local notify = Snacks.notify.notify

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>te", vim.cmd.Telescope)
keymap("n", ";", ':lua MiniJump2d.start(MiniJump2d.builtin_opts.word_start)<CR>')
keymap("n", "<leader>mf", ':Pick files<CR>')
keymap("n", "<leader>mb", ':Pick buffers<CR>')
keymap("n", "<leader>mt", ':lua MiniFiles.open()<CR>')


keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Keep things centered
-- keymap("n", "J", "mzJ`z")
keymap("n", "j", "jzz")
keymap("n", "k", "kzz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "G", "Gzz")
keymap("n", "{", "{zz")
keymap("n", "}", "}zz")

keymap("n", "<leader>f", function()
    vim.lsp.buf.format()
    notify("Formatting File", { title = "LSP", style = "fancy" })
end, { silent = true })
keymap({ "n", "v" }, "<leader>y", [["+y]])

keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>n", ":set rnu<CR>")
keymap("n", "<F5>", ":!python %<CR> &")

-- OS Specific stuff
keymap("n", "<leader>o", function()
    cmd("!open <cfile>")
    notify("Opening file with system default", { title = "OS" })
end)
keymap("n", "<leader>fm", ":!open .<CR>")


-- Toggle term
keymap("n", "<leader>1", ":1ToggleTerm direction=vertical size=80<CR>")
keymap("n", "<leader>2", ":2ToggleTerm direction=vertical size=80<CR>")
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

-- Run make on current buffer
keymap("n", "<leader>mk", ":make %<CR>")

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

-- Change directory
keymap("n", "<leader>cd", function()
    cmd("lcd %:p:h")
    notify('Changing directory to current file', { title = "KEYMAP" })
end, { silent = true })

keymap("n", "<leader>ft", ":Oil<CR>", { silent = true })
keymap("n", "<leader>bl", ":!black -l 80 %<CR>")


keymap("n", "<leader>md", ":lua require('render-markdown').toggle()<CR>", { silent = true })
keymap("n", "<leader>nh", function()
    cmd("nohlsearch")
    notify('Turnoff search highlighting', { title = "KEYMAP" })
end, { silent = true })
-- keymap("n", "<leader>wc", "g<C-g>")

-- Overseer
keymap("n", "<leader>or", function()
    cmd("OverseerRunCmd ipython %")
    notify('RUNNING FILE in Ipython Asynchronously', { title = "OVERSEER", style = 'fancy' })
end, { silent = true })
keymap("n", "<leader>ot", function()
    cmd("OverseerToggle")
    notify('Overseer Processes Viewer', { title = "OVERSEER", style = "fancy", timeout = 5000 })
end, { silent = true })

keymap("n", "<leader>p", function()
    local cwd = vim.fn.getcwd() -- Get the current working directory
    -- Snacks.notify.notify("Current directory: " .. cwd)
    notify("Current directory: " .. cwd, { title = 'OS' })
end, { silent = true })

-- local oil_open = false
-- keymap("n", "<leader>ft", function()
--     if oil_open then
--         vim.cmd("bd") -- Close buffer
--     else
--         vim.cmd("topleft 40vs")
--         require("oil").open()
--     end
--     oil_open = not oil_open
-- end, { desc = "Toggle Oil file tree" })
