"==============================================
" Plugin Configuration
"==============================================
call plug#begin('$VIM/vimfiles/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'skywind3000/vim-terminal-help'
call plug#end()

"==============================================
" Basic Settings
"==============================================
if has('gui_running')
    let $LANG = 'en_US'                 " Set message language
    set langmenu=en_US                  " Set menu's language of gvim
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    let $VIM_WORKSPACE = 'D:/Vim/workspace'
    let $LINUX_HOME = '\\wsl.localhost\Ubuntu-22.04\home\dylaris'
    cd $VIM_WORKSPACE                   " Switch to work space
    set cdpath=,,;$LINUX_HOME

    " Toggle Menu and Toolbar
    set guioptions-=m
    set guioptions-=T
    map <silent> <F2> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <bar>
        \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
        \endif<CR>
endif

set nocompatible                    " Disable Vi compatibility mode

syntax on
filetype on                         " Enable filetype detection
filetype indent on                  " Enable automatic indentation
set fileformats=unix,dos            " unix use CR(\n) as newline character, dos use CRLF(\r\n)

set guifont=Fixedsys

set belloff=all

set background=light

set clipboard=unnamedplus           " Set default operand to system clipboard

set complete+=d                     " Add auto complete of macro for c/c++

set tabstop=4                       " Number of spaces for a tab
set softtabstop=4                   " 4 spaces are viewed as a tab
set expandtab                       " Replace tab to spaces
set smarttab                        " Identify tab when using backspace
set shiftwidth=4                    " Number of spaces for autoindent

set showmatch                       " Highlight matching parentheses
set matchtime=4                     " Flash time of matching parenthese

set autoindent                      " Enable auto indentation
set cindent                         " Enable C-style indentation

set nobackup                        " Do not auto generate backup file
set noswapfile                      " Do not auto generate swap file
set nowritebackup                   " Do not auto generate backup file when editing
set noundofile                      " Do not auto generate file when undo

set hls                             " Highlight search matches
set ignorecase                      " Case insensitive search
set smartcase

set nocursorline                    " Highlight cursor line

" set relativenumber                " Show relative line numbers
set nonu                            " Show absolute line numbers
set termguicolors                   " Enable true color support
set laststatus=2                    " Always show status line

set updatetime=300                  " Delay for CursorHold events
set mouse=a                         " Enable mouse support

set noshowmode                      " Use lightline status bar

"==============================================
" Autocmd
"==============================================
" Format options for specific file types
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set fasm assembler syntax as default
autocmd BufReadPre *.asm let g:asmsyntax = "fasm"

"==============================================
" Functions
"==============================================
" Reverse the order of selected lines
function! ReverseLines()
    let lines = getline("'<", "'>")
    call setline("'<", reverse(lines))
endfunction
 
"==============================================
" Key Mappings
"==============================================
let mapleader = "\<Space>"           " Set leader key to Space

"----------------------------------------------
" Normal Mode Mappings
"----------------------------------------------
" Clear search highlights
nnoremap <Leader>nh :nohls<CR>

" Open/Close terminal buffer
nnoremap <Leader>bt :call TerminalToggle()<CR>
" Edit vimrc
nnoremap <Leader>br :e!<Space>$MYVIMRC<CR>
" Close current buffer
nnoremap <Leader>bd :bd!<CR>
" Go to last visited buffer
nnoremap <Leader>bv :b!<Space>#<CR>
" Switch to other buffer
nnoremap <Leader>bs :ls<CR>:b!<Space>

" Move to previous window
nnoremap <A-h> <C-w>h
" Move to next window
nnoremap <A-l> <C-w>l
" Move to previous window (up)
nnoremap <A-j> <C-w>j
" Move to next window (down)
nnoremap <A-k> <C-w>k

" Grow the size of current window (vertical)
nnoremap <C-Up> <C-w>+
" Down the size of current window (vertical)
nnoremap <C-Down> <C-w>-
" Grow the size of current window (horizontal)
nnoremap <C-Right> <C-w>>
" Down the size of current window (horizontal)
nnoremap <C-Left> <C-w><
" Equal the size of current window
nnoremap <C-=> <C-w>=

" Move to the first character of the line
nnoremap <C-h> ^
" Move to the end of the line
nnoremap <C-l> $

" Save file
nnoremap <Leader>w :w<CR>
" Exit file
nnoremap <Leader>q :q<CR>

" Insert a new line below
nnoremap <C-j> o<Esc>
" Insert a new line above
nnoremap <C-k> O<Esc>
" Break line at current position
nnoremap <C-n> i<CR><Esc>

" Delete line content before cursor
nnoremap du d^

nnoremap p ""p
nnoremap y ""y
noremap <Leader>p "+p
noremap <Leader>y "+y

" nerdtree
nnoremap <Leader>e :NERDTreeToggle .<CR>

"----------------------------------------------
" Visual Mode Mappings
"----------------------------------------------
" Move to the first character of the line
xnoremap <C-h> ^
" Move to the exd of the line (exclude '\n')
xnoremap <C-l> $h
" Find the selected text
xnoremap ;f y/<C-r>"

"----------------------------------------------
" Insert Mode Mappings
"----------------------------------------------
" Exit insert mode with 'jk'
inoremap jk <Esc>

"----------------------------------------------
" Command Mode Mappings
"----------------------------------------------
" Escape command mode
cnoremap jj <C-c>
" Send current input
cnoremap jk <Esc>

"----------------------------------------------
" Terminal Mode Mappings
"----------------------------------------------
tnoremap <Esc> <C-\><C-n>

"==============================================
" Plug Configuration
"==============================================

"----------------------------------------------
" lightline
"----------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ],
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B',
      \   'helloworld': 'Hello, world!'
      \ },
      \ }

"----------------------------------------------
" netrw
"----------------------------------------------
let g:netrw_altv = 1        " Display the netrw to left when spliting vertically
let g:netrw_alto = 1        " Display the netrw to left when spliting horizontally
let g:netrw_winsize = 75    " Set the size of window where netrw lies to 25% (1 - 75%)

"----------------------------------------------
" vim-terminal-help
"----------------------------------------------
let g:terminal_cwd=2
let g:terminal_shell="wsl"
let g:terminal_height=15
" ALT + =: toggle terminal below.
" ALT + -: paste register 0 to terminal.

colorscheme quiet
