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
set background=dark

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
Plug 'mg979/vim-visual-multi'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rakr/vim-one'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/loremipsum'
Plug 'yggdroot/indentline'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()

" set colorscheme
colorscheme one

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
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

" Register CocExtensions
let g:coc_global_extensions = ['coc-css', 'coc-python', 'coc-tsserver', 'coc-rls']

" Short Key for Toggle NERDTree
map <C-t> :NERDTreeToggle<CR>

" show hidden files in NERDTree
let NERDTreeShowHidden=1

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
