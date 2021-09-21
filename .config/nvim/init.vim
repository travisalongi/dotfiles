"  Basic Settings
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

call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'scrooloose/nerdtree' 
Plug 'airblade/vim-gitgutter'	 
Plug 'preservim/nerdcommenter'  
Plug 'vimwiki/vimwiki'
Plug 'rakr/vim-one'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'psliwka/vim-smoothie'
call plug#end()

"Comment toggle is <leader>cc

" NERDTree DEFAULT <leader> = \
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Set Light line color scheme to same as color schme
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" My Mappings
map <Leader>tt :!alacritty &<CR>
map <Leader>tp :!alacritty -e /opt/anaconda/bin/ipython& <CR>

nmap <leader>gd <Plug>(coc-definitions)
nmap <leader>gr <Plug>(coc-references)

" This makes colorschmes work in NVIM
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set background=dark " for the dark version
" set background=light " for the light version
colorscheme one


" use <tab> for trigger completion and navigate to the next complete item
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
