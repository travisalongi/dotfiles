    "_   __          
   "/ | / /__  ____ _   __(_)___ ___
  "/  |/ / _ \/ __ \ | / / / __ `__ \
 "/ /|  /  __/ /_/ / |/ / / / / / / /
"/_/ |_/\___/\____/|___/_/_/ /_/ /_/


" Basic Settings
set number relativenumber
set path+=**	
set wildmenu
set incsearch
set clipboard=unnamedplus
set t_Co=256
set background=dark
set mouse=a
set ignorecase
set smartindent
set wrap  " Wraps next
set linebreak  " makes wrap aware of words
set nohlsearch  " don't highlight all results
set termguicolors  " May fix tmux colors
" set colorcolumn=80  " Show line to limit long lines
set scrolloff=5  " So cursor doesn't go all the way to top or bottom
" set autochdir  " Automatically change directory to current file
set cursorline  " Highlights current line
set completeopt=menu,menuone,noselect
set splitbelow
set splitright
highlight Cursor guifg=white guibg=green

" Stop auto comment on next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Pluggins
call plug#begin('~/.config/nvim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'nanotee/zoxide.vim'
Plug 'ggandor/leap.nvim'  " Fast movement through document
Plug 'tpope/vim-repeat'  "helper program to use . for repeat plugin things
Plug 'frazrepo/vim-rainbow'  " Color match brackets and parathesis
Plug 'airblade/vim-gitgutter'	 " Helpful for seeing git changes
"Plug 'preservim/nerdcommenter'  " switch to lua version
Plug 'mhinz/vim-startify'  " Nvim start screen ~ doom emacs
Plug 'vimwiki/vimwiki'  " For notetaking in vim
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " color hexkeys

" Colorschme
Plug 'rakr/vim-one'
Plug 'olimorris/onedarkpro.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'shaunsingh/nord.nvim'
Plug 'rose-pine/neovim'

" Lua pluggins
Plug 'windwp/nvim-autopairs'  " Autopair parenthesis
Plug 'ur4ltz/surround.nvim'
Plug 'karb94/neoscroll.nvim'  " Smooth scrolling
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'terrortylor/nvim-comment'
" Plug 'danilamihailov/beacon.nvim'  " The below is better
Plug 'rainbowhxch/beacon.nvim'  " Highlight jump"
Plug 'folke/zen-mode.nvim'  " Distraction free writting plugin
Plug 'goolord/alpha-nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-orgmode/orgmode'  " For looking at emacs org documents
Plug 'akinsho/org-bullets.nvim'
Plug 'akinsho/toggleterm.nvim'  " A better floatterm
Plug 'akinsho/bufferline.nvim', {'tag' : 'v3.*'}  " Trying this out over tabline
Plug 'lukas-reineke/headlines.nvim'  " Adds formatting for headlines-- buggy
Plug 'nvim-tree/nvim-tree.lua'  " Trying out using filetree
" Plug 'kdheepak/tabline.nvim'  " Trying this out shows all buffers as tabs
Plug 'ThePrimeagen/harpoon'  " Useful for switching between files 
Plug 'lukas-reineke/indent-blankline.nvim'

" Telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do' : ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'jvgrootveld/telescope-zoxide'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'rudism/telescope-dict.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'  " initiate LSP and install pylsp
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'  " Following are required for code completion
Plug 'hrsh7th/cmp-nvim-lua'  " Following are required for code completion
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-git'
Plug 'f3fora/cmp-spell'
Plug 'uga-rosa/cmp-dictionary'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'VonHeikemen/lsp-zero.nvim'

" Prettier
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
call plug#end()


" Abbreviations
:iab <expr> dts strftime("<%F %a>")
:iab  htt https://

" Go back to same place in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


" Highlight on yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="DiffText", timeout=200})
augroup END


lua << EOF
-- My LUA configs
require "talongi.keymaps"
require "talongi.telescope"
require "talongi.neoscroll"
require "talongi.prettier"
require "talongi.nvim-autopairs"
require "talongi.nvim-cmp"
require "talongi.toggleterm"
require "talongi.surround"
require "talongi.lualine"
require "talongi.cmp_dictionary"
require "talongi.zen-mode"
require "talongi.nvim-orgmode"
require "talongi.beacon"
require "talongi.nvim-tree"
require "talongi.cmp-nvim-lsp"
-- require("talongi.lsp")
require "talongi.bufferline"
require("talongi.treesitter")
require("luasnip.loaders.from_vscode").lazy_load()
--require "talongi.rose-pine"
-- require("bufferline").setup{}
-- require "talongi.lsp-handler"
-- require "talongi.tabline"
-- require "talongi.headlines"   * Buggy try after updates <2022-10-06 Thu> 
-- require('harpoon').setup()
--require("headlines").setup()
require('leap').set_default_keymaps()
require('org-bullets').setup()
require('nvim_comment').setup({comment_empty = false})
require'alpha'.setup(require'alpha.themes.startify'.config)
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = false,
    show_current_context_start = false,
}

EOF


colorscheme catppuccin-mocha
set laststatus=2  " Single status line, 2 for mutli

" Beacon
highlight Beacon guibg=#c4a7e7


" Black python code formatting
let g:black#settings = {
\ 'fast': 0,
\ 'line_length': 80
\}

