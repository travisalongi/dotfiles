set number
set path+=**	
set wildmenu
set incsearch
set t_Co=256
set clipboard=unnamedplus

call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'itchyny/lightline.vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'frazrepo/vim-rainbow'
Plug 'scrooloose/nerdtree' 
Plug 'airblade/vim-gitgutter'	 
Plug 'preservim/nerdcommenter'  
call plug#end()

" NERDTree DEFAULT <leader> = \
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

"highlight Normal           guifg=#dfdfdf ctermfg=15   guibg=#282c34 ctermbg=none  cterm=none
"highlight LineNr           guifg=#5b6268 ctermfg=8    guibg=#282c34 ctermbg=none  cterm=none
"highlight CursorLineNr     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
"highlight VertSplit        guifg=#1c1f24 ctermfg=0    guifg=#5b6268 ctermbg=8     cterm=none
"highlight Statement        guifg=#98be65 ctermfg=2    guibg=none    ctermbg=none  cterm=none
"highlight Directory        guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
"highlight StatusLine       guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
"highlight StatusLineNC     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
"highlight NERDTreeClosable guifg=#98be65 ctermfg=2
"highlight NERDTreeOpenable guifg=#5b6268 ctermfg=8
"highlight Comment          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=italic
"highlight Constant         guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
"highlight Special          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
"highlight Identifier       guifg=#5699af ctermfg=6    guibg=none    ctermbg=none  cterm=none
"highlight PreProc          guifg=#c678dd ctermfg=5    guibg=none    ctermbg=none  cterm=none
"highlight String           guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
"highlight Number           guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
"highlight Function         guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
"highlight Visual           guifg=#dfdfdf ctermfg=1    guibg=#1c1f24 ctermbg=none  cterm=none

map <Leader>tt :vnew term://zsh<CR>
