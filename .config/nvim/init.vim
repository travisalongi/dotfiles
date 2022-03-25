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
set mouse=a
set ignorecase
set smartindent
set nohlsearch
set termguicolors  " May fix tmux colors
set colorcolumn=80  " Show line to limit long lines
set scrolloff=10  " So cursor doesn't go all the way to top or bottom
set autochdir  " Automatically change directory to current file
set cursorline  " Highlights current line
set splitbelow
set splitright
highlight Cursor guifg=white guibg=green

" Pluggins
call plug#begin('~/.config/nvim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'nanotee/zoxide.vim'
Plug 'ggandor/leap.nvim'  " Simplied lightspeed for fast movements
Plug 'tpope/vim-repeat'  "helper program to use . for repeat plugin things
Plug 'frazrepo/vim-rainbow'  " Color match brackets and parathesis
Plug 'airblade/vim-gitgutter'	 " Helpful for seeing git changes
Plug 'preservim/nerdcommenter'  " Comment help
Plug 'mhinz/vim-startify'  " Nvim start screen ~ doom emacs
Plug 'vimwiki/vimwiki'  " For notetaking in vim
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " color hexkeys
" Colorschmes
Plug 'rakr/vim-one'
Plug 'olimorris/onedarkpro.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" Other tools
Plug 'ptzz/lf.vim'  " Integrage w/ lf
Plug 'voldikss/vim-floaterm'  " Floating terminal
Plug 'nvim-orgmode/orgmode'  " For looking at emacs org documents
" Lua pluggins
Plug 'windwp/nvim-autopairs'  " Autopair parenthesis
Plug 'karb94/neoscroll.nvim'  " Smooth scrolling
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lualine/lualine.nvim'
 Plug 'danilamihailov/beacon.nvim'  " Highlight large jumps
" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'jvgrootveld/telescope-zoxide'
Plug 'nvim-treesitter/nvim-treesitter', {'do' : ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
" LSP
Plug 'neovim/nvim-lspconfig'  " initiate LSP and install pylsp
Plug 'hrsh7th/cmp-nvim-lsp'  " Following are required for code completion
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
" Prettier
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
call plug#end()

set completeopt=menu,menuone,noselect

" Don't allow lf file manager to map keybinds
let g:lf_map_keys = 0

" Map leader key to space
let mapleader=" "

" Comment toggle is <leader>cc
" Comment untoggle is <leader>cu

" Window navigation ala Doom Emacs
 map <leader>wh :wincmd h<CR>
 map <leader>wj :wincmd j<CR>
 map <leader>wk :wincmd k<CR>
 map <leader>wl :wincmd l<CR>
 map <leader>wH :wincmd H<CR>
 map <leader>wJ :wincmd J<CR>
 map <leader>wK :wincmd K<CR>
 map <leader>wL :wincmd L<CR>
 map <leader>wc :wincmd c<CR>
 map <leader>wo :wincmd o<CR>
 map <leader>w= :wincmd =<CR>
 map <leader>wn :vnew<CR>

" My Mappings
" Keeps searches centered in page
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap } }zzzv
nnoremap { {zzzv
" Moves lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
noremap <silent> k gk
noremap <silent> j gj
" Leader mappings
map <Leader>tt :FloatermToggle<CR>
map <Leader>r :FloatermNew ranger<CR> 
map <Leader>lf :Lf<CR>
map <Leader>gg :FloatermNew lazygit<CR> 
map <Leader>tc :tabclose<CR>
map <Leader>q :q<CR>
map <Leader>tp :w<CR> :!kitty -e $HOME/anaconda3/bin/ipython -i --no-banner &<CR><CR>
map <Leader>p :pwd<CR>
map <Leader>sz :source ~/.config/nvim/init.vim<CR>
map <Leader>gh :Startify<CR>
map <Leader>bn :bn<CR>
map <Leader>bp :bp<CR>
map <Leader>sc :set spell spelllang=en_us<CR>
map <Leader>sco :set nospell<CR>

" Run current script in a new ipython terminal and keep open
nnoremap <F5> <esc>:w<CR>:!kitty -e ipython -i --no-banner % &<CR><CR>
nnoremap <F4> <esc>:w<CR>:!tmux splitw -h ipython <CR><CR>
nnoremap <F3> <esc>:w<CR>:!tmux send-keys -t Dev:Ipython run %:p Enter<CR><CR>
nnoremap <F2> <esc>:w<CR>:FloatermNew ipython --no-banner <CR><CR>

" Abbreviation
" Datetime stamp  https://vim.fandom.com/wiki/Insert_current_date_or_time
:iab <expr> dts strftime("<%F %a>")
:iab  htt https://
":iab tfl Thinned Fault Likelihood

" Terminal
" Allows escape from float term
tnoremap <Esc> <C-\><C-n>  
let g:floaterm_width = 0.85
let g:floaterm_height = 0.85
let g:python_host_prog = '~/anaconda3/bin/python'

" Telescope keybinds
nnoremap <Leader>te <cmd>Telescope<CR>
nnoremap <leader>ff <cmd>Telescope find_files theme=ivy<cr>
nnoremap <leader>fc <cmd>Telescope find_files cwd=~/.config<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope file_browser hidden=true theme=ivy<cr>
nnoremap <leader>fr <cmd>Telescope oldfiles theme=ivy<cr>
nnoremap <Leader>bb <cmd>Telescope buffers theme=ivy<CR>
nnoremap <Leader>d <cmd>Telescope diagnostics theme=ivy<CR>
noremap <leader>ss <cmd>Telescope spell_suggest theme=ivy<cr>
noremap <leader>zz <cmd>Telescope zoxide list theme=ivy<cr>


" Go back to same place in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


" Highlight on yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="DiffText", timeout=300})
augroup END


" Set colorscheme & a hack to make work with nvim
if (empty($TMUX))
  if (has("nvim"))
    ""For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" Beacon
let g:beacon_size = 40
let g:beacon_minimal_jump = 5



lua << EOF
-- My LUA configs
require "talongi.telescope"
require "talongi.neoscroll"
require "talongi.prettier"
require "talongi.nvim-autopairs"
-- Something here is broken, not worried about fixing it
-- require "talongi.nvim-orgmode"  
require "talongi.nvim-cmp"

-- Theme
require('leap').set_default_keymaps()
require('onedark').load()
require "talongi.lualine"
-- require("luasnip.loaders.from_vscode").load()

EOF




" Startify --> switch to startup-nvim/startup.nvim at somepoint
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '/home/talongi/.config/i3/config' },
            \ { 'n': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/.config',
            \ ]

let g:startify_custom_header = [
        \ '                                      ',
        \ '     _   __         _    ___          ',
        \ '    / | / /__  ____| |  / (_)___ ___  ',
        \ '   /  |/ / _ \/ __ \ | / / / __ `__ \ ',
        \ '  / /|  /  __/ /_/ / |/ / / / / / / / ',
        \ ' /_/ |_/\___/\____/|___/_/_/ /_/ /_/  ',
        \ '                                      ',
        \ '                                      ',
        \]

set laststatus=3  " Single status line, 2 for mutli
