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
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-sensible'
Plugin 'wakatime/vim-wakatime'
Plugin 'edkolev/tmuxline.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"===============================================================================
" Plugin settings:

" vim-airline plugin configuration
set laststatus=2
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tmuxline#enabled = 1
" Disable default mode indicator
set noshowmode

" Set the theme used
let g:airline_theme='hybridline'

"let g:airline#extensions#tabline#enabled = 1

" Configure which mode colors should be used in tmux statusline
let airline#extensions#tmuxline#color_template = 'normal'
"let airline#extensions#tmuxline#color_template = 'insert'
"let airline#extensions#tmuxline#color_template = 'visual'
"let airline#extensions#tmuxline#color_template = 'replace'

" Trigger writing to the file whenever airline theme is applied
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-statusline-colors.conf"

"-------------------------------------------------------------------------------

" tmuxline plugin configuration
"let g:tmuxline_theme = 'powerline'
"let g:tmuxline_preset = 'powerline'

"-------------------------------------------------------------------------------

" NERD Tree plugin configuration
" Open NerdTree when no file is opened
"autocmd StdinReadPre * let s:std_in=2
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
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
set mouse=a

" Autocomplete commands with suggestions bar
"set wildmode=longest,full
"set wildmode=longest,list,full
set wildmenu

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

" Set dd to delete to black hole registry
"nnoremap dd "_d
"vnoremap dd "_d

set tabstop=4 shiftwidth=4 expandtab

" Lessen the delay when pressing ESC key
set timeoutlen=1000 ttimeoutlen=10
"-------------------------------------------------------------------------------

" Make the cursor a block when in cursor mode and beam in insert mode
" Changing cursor shape per mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
    autocmd VimEnter * silent !echo -ne "\e[Ptmux;\e[\e[1 q\e[\\"
    autocmd VimLeave * silent !echo -ne "\e[Ptmux;\e[\e[5 q\e[\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[1 q"
    autocmd VimEnter * silent !echo -ne "\e[1 q"
    autocmd VimLeave * silent !echo -ne "\e[5 q"
endif

"===============================================================================
" Key mappings:

" Map the <leader> to comma ','
let mapleader=","

" Source .vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
"-------------------------------------------------------------------------------

if has("unix") && !has("gui_running")
" <Esc>x maps to <M-x>
set <M-j>=^[j
set <M-k>=^[k
set <M-*>=^[*
endif
"-------------------------------------------------------------------------------

" Move line up/down by 1 line
"execute "set <M-j>=[j"
"execute "set <M-k>=[k"
"
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
"-------------------------------------------------------------------------------

" Surround selected text with characters ', ", (, {, (:
vnoremap sw' o<esc>i'<esc>gvol<esc>a'<esc>
vnoremap sw" o<esc>i"<esc>gvol<esc>a"<esc>
vnoremap sw[ o<esc>i[<esc>gvol<esc>a]<esc>
vnoremap sw{ o<esc>i{<esc>gvol<esc>a}<esc>
vnoremap sw( o<esc>i(<esc>gvol<esc>a)<esc>

nnoremap sw' I'<esc>A'<esc>
nnoremap sw" I"<esc>A"<esc>
nnoremap sw[ I[<esc>A]<esc>
nnoremap sw{ I{<esc>A}<esc>
nnoremap sw( I(<esc>A)<esc>
"-------------------------------------------------------------------------------

" Enable copying to the system clipboard with Ctrl-Shift-C"
"vnoremap <silent> <C-S-c> :'<,'>w !cat > /dev/clipboard <CR> \n
"nnoremap <silent> <C-S-c> :'<,'>w !cat > /dev/clipboard <CR> \n
" Enable pasting to the system clipboard with Ctrl-Shift-V"
"vnoremap <silent> <C-v> :r !cat /dev/clipboard <CR>
"nnoremap <silent> <C-v> :r !cat /dev/clipboard <CR>
"vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!/dev/clipboard -selection c<CR>u
"map <Insert> :set paste<CR>i<CR><CR><Esc>k:.!/dev/clipboard -o<CR>JxkJx:set nopaste<CR>
vnoremap <C-c> "*y
"===============================================================================
