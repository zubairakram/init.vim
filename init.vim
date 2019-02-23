" basic configuration
set background=dark
set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autowriteall

" copy-paste key mapping
vnoremap <C-c> "+y
map <C-v> "+p

" vim-airline arrow setting
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''

" plugins
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/loremipsum'
call plug#end()
