" Modeline and Notes {
"
"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the "   pieces you want(and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen.
"
"   If you find an obvious mistake hit me up at:
"   http://robertmelton.com/contact (many forms of communication)
" }

" Plugin Settings {
    " pathogen
    call pathogen#infect()
    call pathogen#helptags()

    " indent-guides
    let g:indent_guides_indent_levels = 30
    let g:indent_guides_auto_colors = 1
    let g:indent_guides_color_change_percent = 5
    let g:indent_guides_start_level = 2
    let g:indent_guides_enable_on_vim_startup = 0

    " Unite
    let g:unite_source_history_yank_enable = 1
    "call unite#filters#matcher_default#use(['matcher_fuzzy'])
    "versiunea initiala, preluata de pe net
    "nnoremap <leader>ut :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
    "nnoremap <leader>uf :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
    "nnoremap <leader>ur :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
    "nnoremap <leader>uo :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
    "nnoremap <leader>uy :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
    "nnoremap <leader>ue :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

    nnoremap [unite] <Nop>
    nmap <space> [unite]

    nnoremap [unite]f :<C-u>Unite -buffer-name=files   -start-insert file<cr>
    nnoremap [unite]r :<C-u>UniteResume -start-insert<cr>
    nnoremap [unite]o :<C-u>Unite -buffer-name=outline -start-insert outline<cr>
    nnoremap [unite]y :<C-u>Unite -buffer-name=yank    history/yank<cr>
    nnoremap [unite]b :<C-u>Unite -buffer-name=buffer -start-insert buffer<cr>
    nnoremap [unite]g :<C-u>Unite grep:.<cr>

    " Custom mappings for the unite buffer
    autocmd FileType unite call s:unite_settings()
    function! s:unite_settings()
        " Play nice with supertab
        let b:SuperTabDisabled=1
        " Enable navigation with control-j and control-k in insert mode
        imap <buffer> <C-j>   <Plug>(unite_select_next_line)
        imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    endfunction
" }

" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set background=dark " we plan to use a dark background
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor
    "             |||||||      between joined lines
    "             |||||||+-- When a new match is created (showmatch)
    "             ||||||      pause for .5
    "             ||||||+-- Set buffer options when entering the
    "             |||||      buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> to the last line
    "             |||      when using :@r
    "             |||+-- Searching continues at the end of the match
    "             ||      at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    syntax on " syntax highlighting on
" }

" General {
    filetype plugin indent on " load filetype plugins/indent settings
    set backspace=indent,eol,start " make backspace a more flexible
    set backup " make backup files
    set nobackup "++ nu vreau fisiere de backup
    set nowritebackup "++ nu vreau fisiere de backup
    set backupdir=~/.vim/backup " where to put backup files
    set clipboard+=unnamed " share windows clipboard
    set directory=~/.vim/tmp " directory to place swap files in
    set noswapfile "++ nu vreau swap
    set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    set iskeyword+=_,$,@,%,# " none of these are word dividers
    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png,*/CVS/**,*/usr/img/db/**
    set wildmode=list:longest " turn on wild mode huge list
    set history=500
" }

" Vim UI {
    set nocursorcolumn      " highlight the current column
    set cursorline          " highlight current line
    set incsearch           " BUT do highlight as you type you
                            " search phrase
    set laststatus=2        " always show the status line
    set lazyredraw          " do not redraw while running macros
    set linespace=0         " don't insert any extra pixel lines
                            " betweens rows
    set nolist
    set listchars=tab:» ,eol:¶,trail:· " show tabs and trailing
    set showtabline=0
    set matchtime=5         " how many tenths of a second to blink
                            " matching brackets for
    set nohlsearch          " do not highlight searched for phrases
    set nostartofline       " leave my cursor where it was
    set novisualbell        " don't blink
    set number              " turn on line numbers
    set numberwidth=5       " We are good up to 99999 lines
    set report=0            " tell us when anything is changed via :...
    set ruler               " Always show current positions along the bottom
    set scrolloff=10        " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT     " shortens messages to avoid
                            " 'press a key' prompt
    set showcmd             " show the command being typed
    set showmatch           " show matching brackets
    set sidescrolloff=10    " Keep 5 lines at the size
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in
    "              | | | | |  |   |          square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer
" }

" Text Formatting/Layout {
    set completeopt= " don't use a pop up menu for completions
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return,
                          " and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent,
                      " >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces
                       "should a tab be (see expandtab)
    set tabstop=4 " real tabs should be 8, and they will show with
                   " set list on
" }

" Folding {
" }

" Mappings {
    " space / shift-space scroll in normal mode
    map <F2> <ESC>:set paste!<RETURN>
    map <F4> <ESC>:IndentGuidesToggle<RETURN>
    "map <F5> <ESC>:bp<RETURN>
    "map <F6> <ESC>:bn<RETURN>
    nmap <C-h> <ESC>:bp<RETURN>
    nmap <C-l> <ESC>:bn<RETURN>
    imap <C-h> <ESC>:bp<RETURN>
    imap <C-l> <ESC>:bn<RETURN>
" }

" Autocommands {
    au BufNewFile,BufRead *.ahk setf ahk
    " cand se inchide un tab sa se inchida si bufferul asociat
    "au BufNewFile,BufRead * setlocal bufhidden=delete

    " fisierele less sunt tratate ca css
    au BufNewFile,BufRead *.less setlocal filetype=css
    au BufNewFile,BufRead *.js setlocal softtabstop=2
    au BufNewFile,BufRead *.js setlocal shiftwidth=2
    au BufNewFile,BufRead *.js setlocal softtabstop=2
    au BufNewFile,BufRead *.js setlocal tabstop=2

    " eliminare automata trailing spaces
    autocmd BufWritePre * :%s/\s\+$//e
" }

" GUI Settings {
set t_Co=256 "suport pentru 256 de culori
colorscheme mustang_fork_gabi
if has("gui_running")
    " Basics {
        "colorscheme hybrid
        set columns=180 " perfect size for me
        set guifont=DejaVu\ Sans\ Mono\ 8 " My favorite font
        "set guioptions=ce
        set guioptions=cei
        "              ||
        "              |+-- use simple dialogs rather than pop-ups
        "              +  use GUI tabs, not console style tabs
        set lines=55 " perfect size for me
        set mousehide " hide the mouse cursor when typing
    " }

    " Font Switching Binds {
        map <F8> <ESC>:set guifont=DejaVu\ Sans\ Mono\ 8<RETURN>
        map <F9> <ESC>:set guifont=DejaVu\ Sans\ Mono\ 10<RETURN>
        map <F10> <ESC>:set guifont=DejaVu\ Sans\ Mono\ 12<RETURN>
        map <F11> <ESC>:set guifont=DejaVu\ Sans\ Mono\ 16<RETURN>
        map <F12> <ESC>:set guifont=DejaVu\ Sans\ Mono\ 20<RETURN>
    " }
endif
" }
"


" tabularize: spatiere dupa :
" todo: executa evenimentul de addtabularpattern dupa ce s-a incarcat
" plugin-ul
" posibila solutie aici:
" http://stackoverflow.com/questions/5010162/if-existscommand-fails-on-startup-using-pathogen
if !exists(':Tabularize')
    finish " Give up here; the Tabular plugin musn't have been loaded
endif

AddTabularPattern! asterisk /*/l1
AddTabularPattern! js_semicolons /^[^:]*:\s*\zs/l1l0
AddTabularPattern! js: /^[^:]*:\zs/l1l0
