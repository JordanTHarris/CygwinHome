" SYSTEM CONFIG DEFAULTS:

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" SYNTAX HIGHLIGHTING:
set t_Co=256
syntax on
colorscheme ir_black
set bs=2
set nocompatible              " be iMproved, required
filetype off                  " required

"===============================================================================
execute pathogen#infect()

"===============================================================================
" VUNDLE SETTINGS:

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
Plugin 'ryanoasis/vim-webdevicons'

call vundle#end()            " required
filetype plugin indent on    " required

"===============================================================================
" PLUGIN SETTINGS:

" vim-airline plugin configuration
set laststatus=2
let g:airline_powerline_fonts = 1

" Set the theme used
let g:airline_theme='hybridline'

"let g:airline#extensions#tabline#enabled = 1

" Configure which mode colors should be used in tmux statusline
"let airline#extensions#tmuxline#color_template = 'normal'
"let airline#extensions#tmuxline#color_template = 'insert'
"let airline#extensions#tmuxline#color_template = 'visual'
"let airline#extensions#tmuxline#color_template = 'replace'

" Trigger writing to the file whenever airline theme is applied
"let airline#extensions#tmuxline#snapshot_file = "~/.tmux-statusline-colors.conf"

" change status of Tmuxline when Vim mode changes
if exists('$TMUX')
    function! AddTmuxlineStatus()
        if exists(':Tmuxline')
            augroup airline_tmuxline
                au!
                au InsertEnter * call SetInsert()
                autocmd InsertLeave * call SetNormal()
                vnoremap <silent> <expr> <SID>SetVisual SetVisual()
                nnoremap <silent> <script> v v<SID>SetVisual
                nnoremap <silent> <script> V V<SID>SetVisual
                nnoremap <silent> <script> <C-v> <C-v><SID>SetVisual
                autocmd CursorHold * call SetNormal()
            augroup END
        endif
    endfunction
    function! SetInsert()
        Tmuxline airline_insert
    endfunction
    function! SetVisual()
        set updatetime=0
        Tmuxline airline_visual
        return ''
    endfunction
    function! SetNormal()
        set updatetime=4000
        Tmuxline airline
    endfunction
    au VimEnter * :call AddTmuxlineStatus()
endif

"-------------------------------------------------------------------------------

" tmuxline plugin configuration
"let g:tmuxline_theme = 'powerline'
"let g:tmuxline_preset = 'powerline'

"-------------------------------------------------------------------------------

"vim-devicons plugin settings
filetype plugin indent on " required

"let g:airline_powerline_fonts=1
set guifont=DroidSansMonoPLNerd:h12
set encoding=utf-8
"-------------------------------------------------------------------------------

" NERD Tree plugin configuration
" Open NerdTree when no file is opened
"autocmd StdinReadPre * let s:std_in=2
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" NERD Tree settings:
" Map Ctrl-Alt-n to open NERDTree
map <F2> :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

autocmd VimEnter * call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('cpp', 'Magenta', 'none', '#686868', '#151515')
autocmd VimEnter * call NERDTreeHighlightFile('h', 'Yellow', 'none', '#686868', '#151515')

"===============================================================================
" File Locations (backup, temp, undo)
set backupdir=~/.vim/.backup
set directory=~/.vim/.tmp
" Persistent Undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/.undo
endif

"===============================================================================
" VIM LOOK AND FEEL SETTINGS:

" Column is at 81 instead of 80 so the left edge is at 80
set colorcolumn=81
" Hybrid line number (normal on current line; relative on others)
set relativenumber
set number
syntax on
set smartcase

" Disable default mode indicator
set noshowmode

" Autocomplete commands with suggestions bar
"set wildmode=longest,full
"set wildmode=longest,list,full
set wildmenu

" Disable 'auto comments' when pressing enter or 'o' when on a commented
"au FileType vim setlocal fo-=r fo-=o       " Vim files
au FileType * setlocal fo-=r fo-=o          " All files

colorscheme ir_black        " my usual default theme
"colorscheme vim-brogrammer-theme/colors/brogrammer
"colorscheme neon
"colorscheme brocode

" Use the temorary directory to store vim files (undo, switch, etc.)
"set undodir=$TEMP,$TMP,.
"set backupdir=$TEMP,$TMP,.
"set directory=$TEMP,$TMP,.

" Setup copy/paste to the system keyboard
"set clipboard=unnamed

" Set dd to delete to black hole registry
"nnoremap dd "_d
"vnoremap dd "_d

set tabstop=4 shiftwidth=4 expandtab

" Lessen the delay when pressing ESC key
set timeoutlen=1000 ttimeoutlen=50
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
" KEY MAPPINGS:

" Map the <leader> to comma ','
let mapleader=","

" Source .vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
"-------------------------------------------------------------------------------

"if has("unix") && !has("gui_running")
"" <Esc>x maps to <M-x>
"set <M-j>=^[j
"set <M-k>=^[k
"set <M-*>=^[*
"endif
"-------------------------------------------------------------------------------

" Move line up/down by 1 line
"execute "set <M-j>=[j"
"execute "set <M-k>=[k"
"
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv
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

"-------------------------------------------------------------------------------
" Yank to the system clipboard
nnoremap <leader>y "*y
vnoremap <leader>y "*y
nnoremap <leader>yy "*yy
vnoremap <leader>yy "*yy

" Paste from the system clipboard
nnoremap <leader>p "*p
vnoremap <leader>p "*p

" Delete to the system clipboard
nnoremap <leader>d "*d
vnoremap <leader>d "*d
nnoremap <leader>dd "*dd
vnoremap <leader>dd "*dd

"===============================================================================
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

"===============================================================================
" SOURCE FUNCTIONS:

" Inserts a newline after each specified string (or before using '!')
source ~/.vim/scripts/linebreakat.vim

"===============================================================================
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif
