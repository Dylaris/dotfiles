if !exists('g:load_plugins')
    let g:load_plugins = 0
endif

"==============================================
" Plugin Configuration
"==============================================
if g:load_plugins
    if has('win32') || has('win64')
        " Windows system
        let s:plug_dir = '$VIM/vimfiles/plugged'
    else
        " Linux/Unix system
        let s:plug_dir = '~/.vim/plugged'
    endif

    call plug#begin(s:plug_dir)
        " UI Enhancements
        Plug 'itchyny/lightline.vim'
        Plug 'preservim/nerdtree'
        
        " Utilities
        Plug 'skywind3000/vim-terminal-help'
    call plug#end()

    "----------------------------------------------
    " NetRW (Built-in File Explorer)
    "----------------------------------------------
    let g:netrw_altv = 1                " Open splits to the right
    let g:netrw_alto = 1                " Open splits to the bottom
    let g:netrw_winsize = 75            " Explorer width (25% of window)

    "----------------------------------------------
    " vim-terminal-help
    "----------------------------------------------
    let g:terminal_cwd = 2              " Open terminal in current file's directory
    " let g:terminal_shell = "wsl"        " Use WSL as default shell
    let g:terminal_shell = "powershell" " Use PowerShell as default shell
    let g:terminal_height = 15          " Terminal window height

    "----------------------------------------------
    " lightline.vim (Status Line)
    "----------------------------------------------
    let g:lightline = {
          \ 'colorscheme': 'PaperColor',
          \ 'active': {
          \   'left': [
          \     ['mode', 'paste'],
          \     ['readonly', 'filename', 'modified']
          \   ],
          \   'right': [
          \     ['lineinfo'],
          \     ['percent'],
          \     ['fileformat', 'fileencoding', 'filetype']
          \   ]
          \ },
          \ 'component': {
          \   'charvaluehex': '0x%B',
          \   'helloworld': 'Hello, World!'
          \ },
          \ }
endif

"==============================================
" Basic Settings
"==============================================
" Disable Vi compatibility
set nocompatible

" Interface & Display
syntax on
filetype on
filetype indent on
set termguicolors                   " Enable true color support
colorscheme darkblue
set nocursorline                    " No highlight current line
set background=dark
" set guifont=Fixedsys
set laststatus=2                    " Always show status line
set showmode                        " Use lightline instead of default mode indicator
set belloff=all                     " Disable all beeps
set guicursor=n-v-c-i:block         " Cursor style

" Line Numbers
set nonumber                        " No show absolute line numbers
set norelativenumber                " No show relative line numbers

" Search & Highlighting
set hls                             " Highlight search matches
set ignorecase                      " Case insensitive search
set smartcase                       " Smart case sensitivity

" File Handling
set fileformats=unix,dos            " Handle both Unix and DOS line endings
set nobackup                        " Disable backup files
set noswapfile                      " Disable swap files
set nowritebackup                   " Disable write backup
set noundofile                      " Disable undo files

" Indentation & Tabs
set tabstop=4                       " Visual spaces per tab
set softtabstop=4                   " Spaces in edit operation
set expandtab                       " Convert tabs to spaces
set shiftwidth=4                    " Autoindent width
set autoindent                      " Enable auto indentation
set smartindent                     " Smart indent handling
set smarttab                        " Smart tab handling

" Matching & Navigation
set showmatch                       " Highlight matching brackets
set matchtime=4                     " Matching highlight duration

" Clipboard Integration
set clipboard=unnamedplus           " Use system clipboard by default

" Completion
set complete+=d                     " Include dictionary completion

" Mouse Support
set mouse=a                         " Enable mouse in all modes

" Performance
set updatetime=300                  " Shorter update time for better responsiveness


"==============================================
" GUI-specific Settings
"==============================================
if has('gui_running')
    " Language settings
    let $LANG = 'en_US'
    set langmenu=en_US
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    " Workspace setup
    let $VIM_WORKSPACE = 'D:/Vim/workspace'
    let $LINUX_HOME = '\\wsl.localhost\Ubuntu-22.04\home\dylaris'
    cd $VIM_WORKSPACE
    set cdpath=,,;$LINUX_HOME

    " GUI options
    set guioptions-=m               " Hide menu bar
    set guioptions-=T               " Hide toolbar
    
    " Toggle GUI elements with F2
    map <silent> <F2> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <Bar>
        \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
        \endif<CR>
endif


"==============================================
" Autocommands
"==============================================
" Disable automatic comments on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set FASM syntax for assembly files
autocmd BufReadPre *.asm let g:asmsyntax = "fasm"

" Set filetype=c for C header files
autocmd BufNewFile,BufRead *.h set filetype=c

" Set PHP indentation settings
autocmd FileType php setlocal indentexpr= autoindent smartindent


"==============================================
" Custom Functions
"==============================================
" Reverse selected lines
function! ReverseLines()
    let lines = getline("'<", "'>")
    call setline("'<", reverse(lines))
endfunction


"==============================================
" Key Mappings
"==============================================
let mapleader = "\<Space>"          " Leader key

"----------------------------------------------
" Normal Mode
"----------------------------------------------
""""""""""""""""""""""""""""""
" UI Toggles
""""""""""""""""""""""""""""""

" Clear search highlights
nnoremap <Leader>nh :nohls<CR>
" Toggle file explorer
nnoremap <Leader>e :NERDTreeToggle .<CR>

""""""""""""""""""""""""""""""
" Buffer Management
""""""""""""""""""""""""""""""

" Edit vimrc
nnoremap <Leader>br :e! $MYVIMRC<CR>
" Close current buffer
nnoremap <Leader>bd :bd!<CR>
" Switch to last buffer
nnoremap <Leader>bv :b#<CR>
" List and switch buffers
nnoremap <Leader>bs :ls<CR>:b<Space>

""""""""""""""""""""""""""""""
" Window Navigation
""""""""""""""""""""""""""""""

" Move to left window
nnoremap <A-h> <C-w>h
" Move to right window
nnoremap <A-l> <C-w>l
" Move to lower window
nnoremap <A-j> <C-w>j
" Move to upper window
nnoremap <A-k> <C-w>k

""""""""""""""""""""""""""""""
" File Operations
""""""""""""""""""""""""""""""

" Save file
nnoremap <Leader>w :w<CR>
" Quit
nnoremap <Leader>q :q<CR>

""""""""""""""""""""""""""""""
" Line Navigation
""""""""""""""""""""""""""""""

" Start of line
nnoremap <C-h> ^
" End of line
nnoremap <C-l> $
" Next paragraph
nnoremap <C-j> }
" Previous paragraph
nnoremap <C-k> {

""""""""""""""""""""""""""""""
" Editing
""""""""""""""""""""""""""""""

" Break line at cursor
nnoremap <C-n> i<CR><Esc>
" Delete to line start
nnoremap du d^

""""""""""""""""""""""""""""""
" Terminal
""""""""""""""""""""""""""""""

" Toggle terminal
nnoremap <Leader>bt :call TerminalToggle()<CR>

""""""""""""""""""""""""""""""
" Clipboard
""""""""""""""""""""""""""""""

" Paste from default register
nnoremap p ""p
" Yank to default register
nnoremap y ""y
" Paste from system clipboard
nnoremap <Leader>p "+p
" Yank to system clipboard
nnoremap <Leader>y "+y

"----------------------------------------------
" Visual Mode
"----------------------------------------------
" Start of line
xnoremap <C-h> ^
" End of line (exclude newline)
xnoremap <C-l> $h
" Next paragraph
xnoremap <C-j> }
" Previous paragraph
xnoremap <C-k> {

" Search for selected text
xnoremap <Leader>f y/<C-r>"
" Apply macro 'a'
xnoremap <Tab> :normal @a<CR>

"----------------------------------------------
" Insert Mode
"----------------------------------------------
" Escape insert mode
inoremap jk <Esc>

"----------------------------------------------
" Command Mode
"----------------------------------------------
" Exit command mode
cnoremap jj <C-c>
" Execute command
cnoremap jk <Esc>

"----------------------------------------------
" Terminal Mode
"----------------------------------------------
" Exit terminal mode
tnoremap <Esc> <C-\><C-n>
