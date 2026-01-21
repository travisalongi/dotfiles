vim.opt.nu = true
vim.opt.nuw = 1
vim.opt.relativenumber = true

-- Was costing 600 ms delay in startup
-- vim.opt.clipboard = 'unnamedplus'
vim.opt.clipboard=''
vim.opt.mouse = 'a'


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.linespace = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.ignorecase=true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "0"

vim.opt.cursorline = true

vim.opt.foldmethod = 'marker'

-- Saves folds
vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"*.*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*.*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})

vim.diagnostic.config({virtual_text=false,underline=true})


-- Use python as compiler for :make if file type is py
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.bo.makeprg = "python %"
        vim.bo.errorformat = "%f:%l:%m"
    end
})

-- Use python as compiler for :make if file type is py
vim.api.nvim_create_autocmd("FileType", {
    pattern ={ "tex"},
    callback = function()
        vim.opt_local.spell = true
        vim.keymap.set("n", "j", "gj")
        vim.keymap.set("n", "k", "gk")
        Snacks.scroll.disable()
    end
})

vim.api.nvim_create_autocmd("FileType",{
    pattern = {"markdown"},
    callback = function()
        -- Ensure Snacks is loaded and disable scrolling
        local snacks_loaded, Snacks = pcall(require, "snacks")
        if snacks_loaded and Snacks.scroll then
            Snacks.scroll.disable()
            Snacks.scroll.enabled = false
        end

        vim.opt_local.spell = true
        vim.bo.makeprg = "pandoc % -o %:r.pdf"
    end
})


