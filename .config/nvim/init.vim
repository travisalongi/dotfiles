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
set t_ut=
set clipboard=unnamedplus
set mouse=a
set ignorecase
set termguicolors
set smartindent
set nohlsearch
set spell spelllang=en_us
set colorcolumn=80

" Pluggins
call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'scrooloose/nerdtree' 
Plug 'airblade/vim-gitgutter'	 
"Plug 'francoiscabrol/ranger.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'rbgrouleff/bclose.vim' " ranger dependency for nvim
Plug 'preservim/nerdcommenter' 
Plug 'vimwiki/vimwiki'
Plug 'rakr/vim-one'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'psliwka/vim-smoothie'
Plug 'jpalardy/vim-slime'
Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

"Comment toggle is <leader>cc

" NERDTree DEFAULT <leader> = \
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Shortcutting split Navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" My Mappings
map <Leader>/ :w<CR>:FZF<CR>
map <Leader>m :w<CR>:Marks<CR>
map <Leader>b :w<CR>:Buffers<CR>
"map <Leader>h :w<CR>:History<CR>
map <Leader>rg :w<CR>:Rg<CR>   
"map <Leader>tt :!alacritty &<CR>
map <Leader>tt :FloatermToggle<CR>
map <Leader>tc :tabclose<CR>

" ranger stuff
"let g:python3_host_prog=/home/talong/anaconda3/bin/python
map <leader>r :RnvimrToggle<CR>
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
" Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 70
" Map Rnvimr action
let g:rnvimr_action = {
            \ '<CR>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

" Telescope stuff
map <Leader>t :Telescope<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>h <cmd>Telescope oldfiles<cr>
nnoremap <leader>sc <cmd>Telescope spell_suggest<cr>

map <Leader>tp :!alacritty -e /home/talongi/anaconda3/bin/ipython&<CR>i<CR>ipython
map <Leader>tr :!alacritty -e ranger %:p:h&<CR><CR>
map <Leader>p :pwd<CR>
map <Leader>s :source ~/.config/nvim/init.vim<CR>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <F5> <esc>:w<CR>:!/home/talongi/anaconda3/bin/python %:p<CR><CR>

" setup for media files in telescope
"require('telescope').load_extension('media_files')

" go back to same place in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Control the terminal within nvim
"map <leader>t :vnew<CR>:terminal<CR>
:tnoremap <ESC> <C-\><C-n>

" Vim-slime send to vim-terminal
let g:slime_target = "neovim"
"let g:slime_python_ipython = 1

" Set Light line color scheme to same as color schme
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" Set colorscheme & a hack to make work with nvim
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark " for the dark version
colorscheme one


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
