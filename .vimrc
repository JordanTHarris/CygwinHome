set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()

"===============================================================================
" Vundle settings

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required

"===============================================================================
" Plugin settings:

" vim-airline plugin configuration
set laststatus=2
let g:airline_powerline_fonts = 1

" NERD Tree plugin configuration
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" NERD Tree settings:
" Map Ctrl-Alt-n to open NERDTree
map <C-A-n> :NERDTreeToggle<CR>   
"===============================================================================
" Vim 'look and feel' settings
set colorcolumn=81
set number
syntax on
set mouse=a
"colorscheme vim-brogrammer-theme/colors/brogrammer
"colorscheme neon

" Use the temorary directory to store vim files (undo, switch, etc.)
set undodir=$TEMP,$TMP,.
set backupdir=$TEMP,$TMP,.
set directory=$TEMP,$TMP,.

" Setup copy/paste to the system keyboard
set clipboard=unnamed
" Enable copying to the system clipboard with Ctrl-Shift-C"
"vnoremap <silent> <C-S-c> :'<,'>w !cat > /dev/clipboard <CR> \n
"nnoremap <silent> <C-S-c> :'<,'>w !cat > /dev/clipboard <CR> \n
" Enable pasting to the system clipboard with Ctrl-Shift-V"
"vnoremap <silent> <C-v> :r !cat /dev/clipboard <CR>
"nnoremap <silent> <C-v> :r !cat /dev/clipboard <CR>
"vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!/dev/clipboard -selection c<CR>u
"map <Insert> :set paste<CR>i<CR><CR><Esc>k:.!/dev/clipboard -o<CR>JxkJx:set nopaste<CR>
vnoremap <C-c> "*y

set tabstop=4 shiftwidth=4 expandtab
