"basic configuration
set autowriteall
set backupcopy=yes
set cursorline
set expandtab
set number
set relativenumber
set shiftwidth=4
set tabstop=4

" highlight current line
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303030 ctermbg=234

" copy from vim to clipboard key mapping
vnoremap <C-c> "+y

" plugins
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'leafoftree/vim-svelte-plugin'
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()

" activate airline extension smart Tab Line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" airline symbols
let g:airline_powerline_fonts = 1

" Register CocExtensions
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-svelte', 'coc-tsserver', 'coc-rls']

" Netrw settings
map <C-t> :Lexplore<CR>
let g:netrw_liststyle = 3
let g:netrw_winsize = -32

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
