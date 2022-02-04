    "_   __                _
   "/ | / /__  ____ _   __(_)___ ___
  "/  |/ / _ \/ __ \ | / / / __ `__ \
 "/ /|  /  __/ /_/ / |/ / / / / / / /
"/_/ |_/\___/\____/|___/_/_/ /_/ /_/


" Basic Settings
set number relativenumber
set path+=**	
set wildmenu
set incsearch
set t_Co=256
set clipboard=unnamedplus
set mouse=a
set ignorecase
set smartindent
set nohlsearch
set spell spelllang=en_us
set colorcolumn=80 " Show line to limit long lines
set scrolloff=10 " So cursor doesn't go all the way to top or bottom
set autochdir " Automatically change directory to current file
highlight Cursor guifg=white guibg=green

" Pluggins
"call plug#begin('~/.vim/plugged')
call plug#begin('~/.config/nvim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'airblade/vim-gitgutter'	 
Plug 'kevinhwang91/rnvimr'
Plug 'rbgrouleff/bclose.vim' " ranger dependency for nvim
Plug 'preservim/nerdcommenter' 
Plug 'mhinz/vim-startify'
Plug 'vimwiki/vimwiki'
Plug 'rakr/vim-one'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psliwka/vim-smoothie'
Plug 'voldikss/vim-floaterm'
Plug 'nvim-orgmode/orgmode'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'unblevable/quick-scope'  " Fast horizontal movements
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " color hexkeys
call plug#end()

" Map leader key to space
let mapleader=" "

"Comment toggle is <leader>cc

" Shortcutting split Navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

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
map <Leader>tt :FloatermNew<CR>
map <Leader>r :FloatermNew ranger<CR> 
map <Leader>gg :FloatermNew lazygit<CR> 
map <Leader>tc :tabclose<CR>
map <Leader>q :q<CR>
map <Leader>tp :w<CR> :!alacritty -e /home/talongi/anaconda3/bin/ipython &<CR>
map <Leader>p :pwd<CR>
map <Leader>wc :!wc %<CR>
map <Leader>sz :source ~/.config/nvim/init.vim<CR>
map <Leader>st :QuickScopeToggle<CR>
map <Leader>gh :cd ~<CR><CR>
map <Leader>dt :r !date ~<CR><CR>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <F5> <esc>:w<CR>:!/home/talongi/anaconda3/bin/python %:p<CR><CR>

" Datetime stamp  https://vim.fandom.com/wiki/Insert_current_date_or_time
:iab <expr> dts strftime("<%F %a>")

let g:floaterm_width = 0.85
let g:floaterm_height = 0.85
let g:python_host_prog = '~/anaconda3/bin/python'

" Telescope keybinds
map <Leader>t <cmd>Telescope<CR>
nnoremap <leader>ff <cmd>Telescope find_files theme=ivy<cr>
nnoremap <leader>fc <cmd>Telescope find_files cwd=~/.config<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope file_browser hidden=true theme=ivy<cr>
nnoremap <leader>fr <cmd>Telescope oldfiles theme=ivy<cr>
nnoremap <Leader>b <cmd>Telescope buffers theme=ivy<CR>
noremap <leader>sc <cmd>Telescope spell_suggest theme=ivy<cr>


" Requirement to run lua stuff in nvim
lua << EOF
require('telescope').setup{
  -- change some default behavior
  defaults = {
	  prompt_prefix = ">>> ",
	  selection_caret = "* "
	  }
}
require('telescope').load_extension("file_browser")
require('telescope').load_extension("fzf")
 -- require('telescope').load_extension("fzy_native")
require('telescope').load_extension('media_files')
require('telescope').load_extension('coc')

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/Zephyrus_share/Org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Zephyrus_share/Org/refile.org',
})
EOF


" Quickscope Stuff
highlight QuickScopePrimary guibg='#afff5f' gui=bold ctermfg=green cterm=bold
highlight QuickScopeSecondary guibg='#5fffff' gui=bold ctermfg=cyan cterm=bold
let g:qs_max_chars=100 " max characters in line to use QS


" Go back to same place in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


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


"Standard Vim-one color scheme
set background=dark " for the dark version
colorscheme one

" Set Light line color scheme to same as color schme
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }


" Use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Startify stuff
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
