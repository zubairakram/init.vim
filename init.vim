" basic configuration
set background=dark
set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autowriteall

" copy from vim to clipboard key mapping
vnoremap <C-c> "+y

" vim-airline arrow setting
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''

"Smart Tab Line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail' 

" plugins
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/loremipsum'
call plug#end()


" fugitive Gpush bug solution by @tpope
" first install ssh-askpass
"
" sudo apt install ssh-askpass

if (len($SECURITYSESSIONID) || len($DISPLAY)) && empty($SSH_ASKPASS)
  let s:gui_askpass = system("git --exec-path")[0:-2] . "/git-gui--askpass"
  if executable(s:gui_askpass)
    let $SSH_ASKPASS = s:gui_askpass
  elseif executable("ssh-askpass")
    let $SSH_ASKPASS = "ssh-askpass"
  endif
endif
