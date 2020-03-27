"basic configuration
set autowriteall
set backupcopy=yes
set cursorline
set expandtab
set noshowmode
set number
set relativenumber
set shiftwidth=4
set tabstop=4

" set .vue file as html
autocmd BufNewFile,BufRead *.vue set filetype=html

" highlight current line
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

" copy from vim to clipboard key mapping
vnoremap <C-c> "+y

" activate airline extension smart Tab Line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" plugins
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'peterhoeg/vim-qml'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomasr/molokai'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/loremipsum'
Plug 'yggdroot/indentline'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()

" Short Key for Toggle NERDTree
map <C-t> :NERDTreeToggle<CR>

" colorscheme setting
colorscheme molokai

" airline_theme setting
let g:airline_theme='badwolf'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" custom ignore files
let g:ctrlp_custom_ignore = 'node_modules\|dist\|target\|build\|DS_Store\|.git\'

" fugitive Gpush bug solution by @tpope
" first install ssh-askpass
" sudo apt install ssh-askpass

if (len($SECURITYSESSIONID) || len($DISPLAY)) && empty($SSH_ASKPASS)
    let s:gui_askpass = system("git --exec-path")[0:-2] . "/git-gui--askpass"
    if executable(s:gui_askpass)
        let $SSH_ASKPASS = s:gui_askpass
    elseif executable("ssh-askpass")
        let $SSH_ASKPASS = "ssh-askpass"
    endif
endif
