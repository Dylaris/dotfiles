"==============================================
" Plugin Configuration
"==============================================
call plug#begin('$VIM/vimfiles/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'sheerun/vim-polyglot'
    Plug 'luochen1990/rainbow'
    Plug 'qpkorr/vim-bufkill'
    Plug 'skywind3000/vim-terminal-help'
    Plug 'menisadi/kanagawa.vim'
    Plug 'junegunn/goyo.vim'
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

" set guifont=Monaco_Nerd_Font_Mono:h10:cANSI:qDRAFT
" set guifont=Fixedsys
set guifont=Consolas:h12

set belloff=all

set background=dark

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

set cursorline                      " Highlight cursor line

" set relativenumber                " Show relative line numbers
set nonu                            " Show absolute line numbers
set termguicolors                   " Enable true color support
set laststatus=2                    " Always show status line

set updatetime=300                  " Delay for CursorHold events
set mouse=a                         " Enable mouse support

set noshowmode                      " Use lightline status bar

"==============================================
" Functions
"==============================================
autocmd BufNewFile,BufRead *.h setfiletype c

" Format options for specific file types
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set fasm assembler syntax as default
autocmd BufReadPre *.asm let g:asmsyntax = "fasm"

" Reverse the order of selected lines
function! ReverseLines()
    let lines = getline("'<", "'>")
    call setline("'<", reverse(lines))
endfunction
 
" Insert copyright
command! -nargs=1 InsertCopyright call InsertCopyrightFunc(<f-args>)

function! InsertCopyrightFunc(style)
    let author = "Dylaris"
    let license = "MIT"
    let date = strftime('%Y-%m-%d')
    let year = strftime('%Y')

    if a:style == 'c'
        execute 'normal! i' . '/*' . "\n"
        execute 'normal! 0'

        execute 'normal! i' . ' * Author: ' . author . "\n"
        execute 'normal! 0'

        execute 'normal! i' . ' * Copyright (c) ' . year . "\n"
        execute 'normal! 0'

        execute 'normal! i' . ' * License: ' . license . "\n"
        execute 'normal! 0'

        execute 'normal! i' . ' * Date: ' . date . "\n"
        execute 'normal! 0'

        execute 'normal! i' . ' *' . "\n"
        execute 'normal! 0'

        execute 'normal! i' . ' * All rights reserved' . "\n"
        execute 'normal! 0'

        execute 'normal! i' . ' */' . "\n"
        execute 'normal! 0'
    elseif a:style == 'lua'
        execute 'normal! i' . '-- ' . 'Author: ' . author . "\n"
        execute 'normal! 0'

        execute 'normal! i' . '-- ' . 'Copyright (c) ' . year . "\n"
        execute 'normal! 0'

        execute 'normal! i' . '-- ' . 'License: ' . license . "\n"
        execute 'normal! 0'

        execute 'normal! i' . '-- ' . 'Date: ' . date . "\n"
        execute 'normal! 0'

        execute 'normal! i' . '--' . "\n"
        execute 'normal! 0'

        execute 'normal! i' . '-- All rights reserved' . "\n"
        execute 'normal! 0'
    else
        echo "Invalid style. Use 'c' for C-style or 'lua' for Lua-style comments."
    endif
endfunction

"==============================================
" Key Mappings
"==============================================
let mapleader = "\<Space>"           " Set leader key to Space

"----------------------------------------------
" Normal Mode Mappings
"----------------------------------------------

nnoremap <Leader>g  :Goyo<CR>
nnoremap <Leader>ng :Goyo!<CR>

" Clear search highlights
nnoremap <Leader>nh :nohls<CR>

" Open a terminal (horizontal)
nnoremap <Leader>t :term<Space>
" Open a terminal (vertical)
nnoremap <Leader>vt :vert term<Space>

" Split window vertically
nnoremap <Leader>sv <C-w>v
" Split window horizontally
nnoremap <Leader>sh <C-w>s

" Open/Close terminal buffer
nnoremap <Leader>bt :call TerminalToggle()<CR>
" Edit vimrc
nnoremap <Leader>br :e!<Space>$MYVIMRC<CR>
" Close current buffer
nnoremap <Leader>bd :BD!<CR>
" Go to last visited buffer
nnoremap <Leader>bv :b!<Space>#<CR>
" Switch to other buffer
nnoremap <Leader>bs :ls<CR>:b!<Space>
" Go to modified buffer
nnoremap <Leader>bm :bmodified!<CR>
" Move backwards through recently accessed buffers
nnoremap <Leader>bb :BB<CR>
" Move forwards through recently accessed buffers
nnoremap <Leader>bf :BF<CR>

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

" Abort file
nnoremap <Leader>e :q!<CR>
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
nnoremap ;n :NERDTreeFocus<CR>
nnoremap ;m :NERDTree<CR>
nnoremap ;t :NERDTreeToggle .<CR>
nnoremap ;f :NERDTreeFind<CR>

"----------------------------------------------
" Visual Mode Mappings
"----------------------------------------------
" Move to the first character of the line
xnoremap <C-h> ^
" Move to the exd of the line
xnoremap <C-l> $
" Find the selected text
xnoremap <Leader>f y/<C-r>"

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
tnoremap <A-n> <C-\><C-n>
tnoremap <A-r> <C-W>"
tnoremap <A-p> <C-W>""

"----------------------------------------------
" All Mode Mappings
"----------------------------------------------
noremap <A-r> <C-r>
noremap! <A-r> <C-r>

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
" nerdtree
"----------------------------------------------

"----------------------------------------------
" rainbow
"----------------------------------------------
let g:rainbow_conf = {
    \   'guifgs': ['#FF6347', '#FFD700', '#32CD32', '#1E90FF'],
    \   'operators': ''
    \}
let g:rainbow_active = 1    "set to 0 if you want to enable it later via :RainbowToggle

"----------------------------------------------
" jellybeans
"----------------------------------------------
let g:jellybeans_use_gui_italics = 0
" colorscheme jellybeans              " Colorscheme

"----------------------------------------------
" ayu
"----------------------------------------------
" let ayucolor="light"
" let ayucolor="mirage"
let ayucolor="dark"
" colorscheme ayu                     " Colorscheme

"----------------------------------------------
" vim-bufkill
"----------------------------------------------
" Unloading a file from the buffer while keeping the window/split intact "      :BUN
" Deleting a file from the buffer while keeping the window/split intact "       :BD
" Wiping a file from the buffer while keeping the window/split intact "         :BW
" Move backwards through recently accessed buffers "                            :BB
" Move forwards through recently accessed buffers "                             :BF
" Move to an alternate buffer and keep the cursor in the same column "          :BA

"----------------------------------------------
" vim-terminal-help
"----------------------------------------------
let g:terminal_cwd=2
let g:terminal_shell="wsl"
let g:terminal_height=15
" ALT + =: toggle terminal below.
" ALT + -: paste register 0 to terminal.

"----------------------------------------------
" goyo & limelight
"----------------------------------------------
function! s:goyo_enter()
    " Limelight
endfunction

function! s:goyo_leave()
    colorscheme kanagawa
    " Limelight!
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd! User GoyoEnter nested call <SID>goyo_enter()

colorscheme kanagawa
