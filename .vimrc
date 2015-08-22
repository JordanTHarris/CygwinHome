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
Plugin 'Shougo/unite.vim'
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"===============================================================================
" Plugin settings:

" vim-airline plugin configuration
set laststatus=2
let g:airline_powerline_fonts = 1

" NERD Tree plugin configuration
autocmd StdinReadPre * let s:std_in=2
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" NERD Tree settings:
" Map Ctrl-Alt-n to open NERDTree
map <F2> :NERDTreeToggle<CR>   
"===============================================================================
" Vim 'look and feel' settings

" Column is at 81 instead of 80 so the left edge is at 80
set colorcolumn=81
" Hybrid line number (normal on current line; relative on others)
set relativenumber
set number
syntax on
"set mouse=a
"
" Disable 'auto comments' when pressing enter or 'o' when on a commented
"au FileType vim setlocal fo-=r fo-=o       " Vim files
au FileType * setlocal fo-=r fo-=o          " All files

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

" Set dd to delete to black hole registry
nnoremap dd "_d
vnoremap dd "_d

set tabstop=4 shiftwidth=4 expandtab

" Lessen the delay when pressing ESC key
set timeoutlen=1000 ttimeoutlen=10
