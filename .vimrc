" SYSTEM CONFIG DEFAULTS:

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Only do this part when compiled with support for autocommands.

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
"===============================================================================

" SYNTAX HIGHLIGHTING:

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    set t_Co=256
    syntax on
endif

colorscheme ir_black
"colorscheme vim-brogrammer-theme/colors/brogrammer
"colorscheme neon
"colorscheme brocode

set nocompatible              " be iMproved, required
filetype off                  " required
"===============================================================================

" VUNDLE SETTINGS:

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'wakatime/vim-wakatime'
Plugin 'ryanoasis/vim-webdevicons'
Plugin 'guns/xterm-color-table.vim'
Plugin 'rking/ag.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'bruno-/vim-man'
Plugin 'jez/vim-superman'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'mhinz/vim-startify'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'habamax/vim-skipit'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'

" For SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/genutils'
Plugin 'Chiel92/vim-autoformat'

" Plugins I like but can't/won't use for now
"Plugin 'vim-scripts/closetag.vim'
"Plugin 'jaxbot/browserlink.vim'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'tpope/vim-sensible'
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/vimproc.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"===============================================================================
" PLUGIN SETTINGS:

" vim-airline plugin configuration
set laststatus=2
let g:airline_powerline_fonts = 1

" Set the theme used
let g:airline_theme='hybridline'

" Use airline's tabline when ore than 1 tab or buffer is open
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
"let g:airline#extensions#tabline#buffer_min_count = 2

let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

" Numbers will be displayed in tabline and mappings will be exposed to allow
" to select buffer directly
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
"-------------------------------------------------------------------------------

" Airline Extensions Settings:

" Airline-TmuxLine extension:

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
                "au InsertChange * call SetInsert()
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
        if v:insertmode == 'i'
            Tmuxline airline_insert
        else
            Tmuxline airline_replace
        endif
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
endif   " exists('$TMUX')

"Airline-Hunks extension (GitGutter):

" Show only non-zero hunks
let g:airline#extensions#hunks#non_zero_only = 1

"-------------------------------------------------------------------------------

" tmuxline plugin configuration
"let g:tmuxline_theme = 'powerline'
"let g:tmuxline_preset = 'powerline'
let g:tmuxline_theme = 'tmuxline_theme'
let g:tmuxline_preset = {
      \'a'    : ['#S'],
      \'b'    : ['#W'],
      \'c'    : ['#H'],
      \'win'  : ['#I #W'],
      \'cwin' : ['│ #I #W │'],
      \'y'    : ['%I:%M %p', '%a', '%m/%d/%Y'],
      \'z'    : ['#H']}

"let g:tmuxline_preset = {
"      \'a'    : ['#S'],
"      \'b'    : ['#W'],
"      \'c'    : ['#H'],
"      \'win'  : ['#I #W'],
"      \'cwin' : ['#I #W'],
"      \'y'    : ['%r', '%a', '%d/%m/%Y'],
"      \'z'    : ['#H']}

"-------------------------------------------------------------------------------

"vim-devicons plugin settings
filetype plugin indent on " required

"let g:airline_powerline_fonts=1
set guifont=DroidSansMonoPLNerd:h12
set encoding=utf-8
"-------------------------------------------------------------------------------

" Ctrl-P plugin settings:
  let g:ctrlp_show_hidden = 1

" Use The Silver Searcher (ag) over grep
"if executable('ag')
"  " Use ag over grep
"  set grepprg=ag\ --nogroup\ --nocolor
"
"  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"
"  " ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0
"endif
"-------------------------------------------------------------------------------

" Unite plugin settings:

" Use ag for search
"if executable('ag')
"  let g:unite_source_grep_command = 'ag'
"  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
"  let g:unite_source_grep_recursive_opt = ''
"endif
"
""let g:unite_source_grep_command = 'find'
"
"let g:unite_data_directory='~/.vim/.cache/unite'
"let g:unite_enable_start_insert=1
"let g:unite_source_history_yank_enable=1
"let g:unite_prompt='» '
"let g:unite_split_rule = 'botright'
"
"let g:unite_source_codesearch_ignore_case = 1
""let g:unite_source_grep_command = 'ack'
""let g:unite_source_grep_default_opts = '--no-heading --no-color -k -H'
"
""nnoremap <C-p> :Unite file_rec/async<CR>
"nnoremap <space>/ :Unite grep:.<CR>
"nnoremap <silent> <C-p> :Unite -auto-resize file_rec<CR>
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
"-------------------------------------------------------------------------------

" Vim Startify plugin settings:

" Center the header
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = s:filter_header([
\ '        ________ ══     ________ ',
\ '       /▒▒▒▒▒▒▒▒\════  /▒▒▒▒▒▒▒▒\ ',
\ '       \▒▒▒▒▒▒▒▒/══════\▒▒▒▒▒▒▒▒/ ',
\ '        |▒▒▒▒▒▒|════════/▒▒▒▒▒/ ',
\ '        |▒▒▒▒▒▒|══════/▒▒▒▒▒/ ',
\ '       ═|▒▒▒▒▒▒|════/▒▒▒▒▒/══ ',
\ '     ═══|▒▒▒▒▒▒|══/▒▒▒▒▒/══════ ',
\ '   ═════|▒▒▒▒▒▒|/▒▒▒▒▒/══════════ ',
\ '     ═══|▒▒▒▒▒▒▒▒▒▒▒/══════════ ',
\ '       ═|▒▒▒▒▒▒▒▒▒/══════════ ',
\ '        |▒▒▒▒▒▒▒/══════════ ',
\ '        |▒▒▒▒▒/══════════ ',
\ '        |▒▒▒/══════════ ',
\ '        |▒/   ══════ ',
\ '                ══ ',
\ ])

" Set the color of the header to green
highlight StartifyHeader    ctermfg=2
highlight StartifyBracket   ctermfg=240
highlight StartifyFile      ctermfg=255
highlight StartifyFooter    ctermfg=240
highlight StartifyNumber    ctermfg=208
highlight StartifyPath      ctermfg=245
highlight StartifySlash     ctermfg=240
highlight StartifySpecial   ctermfg=240
"-------------------------------------------------------------------------------

"Rainbow Parentheses plugin settings:

" Always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" The colors of the parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Max number of colors to cycle through
let g:rbpt_max = 6
"-------------------------------------------------------------------------------

" YouCompleteMe plugin settings:
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'html' : 1
      \}
"-------------------------------------------------------------------------------

" Vim-Skipit plugin settings:

" Jump out of things like parentheses with Shift+Tab
"imap <S-Tab> <Plug>SkipIt
"-------------------------------------------------------------------------------

" Vim GitGutter plugin settings:
nmap <F6> :GitGutterSignsToggle<CR>
"-------------------------------------------------------------------------------

" Tagbar plugin settings:
nmap <F3> :TagbarToggle<CR>
"-------------------------------------------------------------------------------

" Emmet-vim plugin settings: (not working until sourced)
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
"imap <C-y>y, <plug>(emmet-expand-abbr)
"let g:user_emmet_expandabbr_key = '<C-y>,'


" Use custom snippets
"let g:user_emmet_settings = webapi#json#decode(
"  \  join( readfile( expand( '~/.snippets_custom.json' ) ), "\n" ) )

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

" Switch on highlighting the last used search pattern (when terminal has colors)
if &t_Co > 2 || has("gui_running")
    set hlsearch
    nohlsearch      " when vimrc is sourced, last search won't be highlighted
    " Use green search highlighting with black text
    highlight Search ctermbg=2 ctermfg=black term=none
    " Toggle search highlighting
    noremap <F8> :set hlsearch! hlsearch?<CR>
endif

" Other search settings
set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

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
set smartcase
set ignorecase
set nowrap

" Set tabs to 4 spaces and use spaces instead of tab characters
set tabstop=4 shiftwidth=4 expandtab

set textwidth=80
filetype indent on

" Column is 1 past textwidth so the left edge is at the end
set colorcolumn=+1
" Color Column is 81 so the left edge is at 80
"set colorcolumn=81

" Hybrid line number (normal on current line; relative on others)
set relativenumber
set number
set smartcase
set spelllang=en_us

" Disable default mode indicator
set noshowmode

set bs=2    " Backspace everything (same as :set backspace=indent,eol,start).

" Autocomplete commands with suggestions bar
"set wildmode=longest,full
"set wildmode=longest,list,full
set wildmenu
"set wildmode=list:longest,full
"set wim=longest:full,full

" Disable 'auto comments' when pressing enter or 'o' when on a commented
"au FileType vim setlocal fo-=r fo-=o       " Vim files
au FileType * setlocal fo-=r fo-=o          " All files


" Use the temorary directory to store vim files (undo, switch, etc.)
"set undodir=$TEMP,$TMP,.
"set backupdir=$TEMP,$TMP,.
"set directory=$TEMP,$TMP,.

" Setup copy/paste to the system keyboard
"set clipboard=unnamed

" Set dd to delete to black hole registry
"nnoremap dd "_d
"vnoremap dd "_d


" Lessen the delay when pressing ESC key
set timeoutlen=1000 ttimeoutlen=50

if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

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

" File Type Specefic Settings:

" HTML:
" HTML tags that need to be indented
let g:html_indent_inctags = "dt,dd,dd"

autocmd FileType html setlocal textwidth=80
autocmd FileType html setlocal wrap
autocmd FileType html setlocal breakindent

"===============================================================================
" KEY MAPPINGS:

" Map the <leader> to comma ','
let mapleader=","

" Source .vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
"-------------------------------------------------------------------------------

" General key mappings:

" Visual select all
nnoremap <leader>sa ggVG

" Use tidy to format whole document
map <F12> :%!tidy -q --tidy-mark 0 2>/dev/null<CR>

" Open this file with the default application | refresh screen
if exists('$TMUX')
    nnoremap <leader>op :exe ':silent !cygstart % & '<CR> <bar> :exe ":silent !tmux send-keys 'C-l'"<CR>
endif

"-------------------------------------------------------------------------------

"if has("unix") && !has("gui_running")
"" <Esc>x maps to <M-x>
"set <M-j>=^[j
"set <M-k>=^[k
"set <M-*>=^[*
"endif
"-------------------------------------------------------------------------------

" Move line up/down by 1 line
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
nnoremap <leader>P "*P
vnoremap <leader>P "*P

" Delete to the system clipboard
nnoremap <leader>d "*d
vnoremap <leader>d "*d
nnoremap <leader>dd "*dd
vnoremap <leader>dd "*dd
"-------------------------------------------------------------------------------

" Jump over next character (like parentheses) with Shift+Tab
"inoremap <S-Tab> <esc>la


"===============================================================================
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

"===============================================================================
" Toggle spell checking and print whether it's on or off:
function! ToggleSpell()
    setlocal spell!
    echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)
endfunction

nnoremap <F7> :call ToggleSpell()<CR>
inoremap <F7> :setlocal spell! spell?<CR>
"===============================================================================
" Highlight current line with slightly lighter background:
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

hi CursorLine cterm=NONE ctermbg=236

"===============================================================================
" SOURCE FUNCTIONS:

" Inserts a newline after each specified string (or before using '!')
source ~/.vim/scripts/linebreakat.vim

"===============================================================================
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif
