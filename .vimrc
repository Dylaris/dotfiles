"==============================================
" Plugin Configuration
"==============================================
if !exists('g:load_plugins')
    let g:load_plugins = 0
endif

if g:load_plugins
    if has('win32') || has('win64')
        " Windows system
        let s:plug_dir = '$VIM/vimfiles/plugged'
    else
        " Linux/Unix system
        let s:plug_dir = '~/.vim/plugged'
    endif

    call plug#begin(s:plug_dir)
        " Plug 'something'
    call plug#end()
endif

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
    set guioptions-=T               " Hide tool bar
    set guioptions-=r               " Hide scroll bar

    " Toggle GUI elements with F2
    map <silent> <F2> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <Bar>
            \set guioptions-=r <Bar>
        \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
            \set guioptions+=r <Bar>
        \endif<CR>
endif

"==============================================
" Settings
"==============================================
" Basic setttings configuration
set nocompatible                    " Disable vi compatibility mode
syntax on                           " Enable syntax highlighting
filetype on                         " Enable filetype detection
filetype indent on                  " Enable auto indentation
set fileformats=unix,dos            " Handle both Unix and DOS line endings

" Appearance and interface settings
set background=dark
set termguicolors                   " Enable true color support
colorscheme darkblue
set laststatus=2                    " Always show status line

" Clipboard and autocompletion settings
set clipboard=unnamedplus           " Set clipboard to use the system clipboard
set complete+=d                     " Include dictionary completion

" Tab and indentation settings
set tabstop=4                       " Visual spaces per tab
set softtabstop=4                   " Spaces in edit operation
set expandtab                       " Convert tabs to spaces
set shiftwidth=4                    " Autoindent width
set autoindent                      " Enable auto indentation
set cindent                         " C indent handling
set smarttab                        " Smart tab handling

" Search settings
set hls                             " Highlight search matches
set ignorecase                      " Case insensitive search
set smartcase                       " Smart case sensitivity
set showmatch                       " Highlight matching brackets

" File management settings
set nobackup                        " Disable backup files
set noswapfile                      " Disable swap files
set nowritebackup                   " Disable write backup
set noundofile                      " Disable undo files

" Search path for builtin-command find
set path=~/project/personal/aris/**,~/project/personal/json/**

" Line Numbers
set number                          " Show absolute line numbers
set relativenumber                  " Show relative line numbers
set nocursorline                    " No highlight current line

" Other settings
set belloff=all                     " Disable bell
set mouse=a                         " Enable mouse in all modes
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
" Set filetype=c for C header files
autocmd BufNewFile,BufRead *.h set filetype=c
" Set filetype=fasm for asm/inc file
autocmd BufReadPre *.asm,*.inc let g:asmsyntax = "fasm"
" Disable automatic comments on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Automatically remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"==============================================
" Util Functions
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
" core
"----------------------------------------------
" Exit insert mode
inoremap jk <Esc>
" Run command
cnoremap jk <Esc>
" Exit terminal mode
tnoremap <Esc> <C-\><C-n>
" Save file
nnoremap <Leader>s :w<CR>
" Quit file
nnoremap <Leader>q :q<CR>
" Clear search highlight
nnoremap <Leader>nh :nohl<CR>
" Run macro 'a'
vnoremap <Tab> :normal @a<CR>
" Paste from system clipboard
nnoremap <Leader>p "+p
" Yank to system clipboard
vnoremap <Leader>y "+y

"----------------------------------------------
" line operations
"----------------------------------------------
" Split line
nnoremap <Enter> i<CR><Esc>
" Delete to line start
nnoremap du d^

"----------------------------------------------
" buffer operations
"----------------------------------------------
" Edit vimrc
nnoremap <Leader>br :e! $MYVIMRC<CR>
" Close buffer
nnoremap <Leader>bd :bd<CR>
" Force close buffer
nnoremap <Leader>bD :bd!<CR>
" Unload buffer
nnoremap <Leader>bu :bun<CR>
" Switch to last visited buffer
nnoremap <Leader>bv :b#<CR>
" Search selected text
vnoremap <Leader>bf y/<C-r>0<CR>
" Show file path
" nnoremap <Leader>bp :echo expand('%:p:h')<CR>

"----------------------------------------------
" window operations
"----------------------------------------------
" Horizontal split window
nnoremap <Leader>wh :split<CR>
" Vertical split window
nnoremap <Leader>wv :vsplit<CR>
" Close window
nnoremap <Leader>wd :close<CR>
" Close other windows
nnoremap <Leader>wo :only<CR>

"----------------------------------------------
" navigation
"----------------------------------------------
" Go to left window
nnoremap <A-h> <C-w>h
" Go to right window
nnoremap <A-l> <C-w>l
" Go to bottom window
nnoremap <A-j> <C-w>j
" Go to top window
nnoremap <A-k> <C-w>k
" Go to line start
nnoremap <C-h> ^
vnoremap <C-h> ^
" Go to line end
nnoremap <C-l> $
" Go to line end (no newline)
vnoremap <C-l> $h
