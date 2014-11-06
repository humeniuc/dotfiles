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

    if version >= 702
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
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        "versiunea initiala, preluata de pe net
        "nnoremap <leader>ut :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
        "nnoremap <leader>uf :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
        "nnoremap <leader>ur :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
        "nnoremap <leader>uo :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
        "nnoremap <leader>uy :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
        "nnoremap <leader>ue :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

        nnoremap [unite] <Nop>
        nmap <space> [unite]

        nnoremap [unite]f :<C-u>Unite -buffer-name=files   -start-insert file<CR>
        nnoremap [unite]r :<C-u>UniteResume -start-insert<CR>
        nnoremap [unite]o :<C-u>Unite -buffer-name=outline -start-insert outline<CR>
        nnoremap [unite]y :<C-u>Unite -buffer-name=yank    history/yank<CR>
        nnoremap [unite]b :<C-u>Unite -buffer-name=buffer -start-insert buffer<CR>
        nnoremap [unite]tf :<C-u>Unite -buffer-name=tagfiles -start-insert tag/file<CR>
        nnoremap [unite]t :<C-u>Unite -buffer-name=tags -start-insert tag<CR>
        nnoremap [unite]g :<C-u>Unite grep:.<CR>

        " Custom mappings for the unite buffer
        autocmd FileType unite call s:unite_settings()
        function! s:unite_settings()
            " Play nice with supertab
            let b:SuperTabDisabled=1
            " Enable navigation with control-j and control-k in insert mode
            imap <buffer> <C-j>   <Plug>(unite_select_next_line)
            imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
        endfunction

        " NERDCommenter
        " adauga un spatiu inainte si da comentariu
        " adica:
        " /* comentat */
        " // comentat
        let g:NERDSpaceDelims=1
    endif
" }

" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    syntax on " syntax highlighting on
" }

" General {
    filetype plugin indent on " load filetype plugins/indent settings
    set backspace=indent,eol,start " make backspace a more flexible
    set nobackup "++ nu vreau fisiere de backup
    set nowritebackup "++ nu vreau fisiere de backup
    " set clipboard+=unnamed " share windows clipboard
    set noswapfile "++ nu vreau swap
    set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    " set iskeyword+=_,$,@,%,# " none of these are word dividers
    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png,*/CVS/**,*/usr/img/db/**
    set wildmode=list:longest " turn on wild mode huge list
    set history=500
	set cscopequickfix=s-,c-,d-,i-,t-,e-
" }

" Vim UI {
    set nocursorcolumn      " highlight the current column
    set cursorline          " highlight current line
    set incsearch           " BUT do highl " don't use a pop up menu for completion " don't use a pop up menu for completionssight as you type you
                            " search phrase
    set laststatus=2        " always show the status line
    set lazyredraw          " do not redraw while running macros
    set linespace=0         " don't insert any extra pixel lines
                            " betweens rows
    set nolist
    set listchars=tab:» ,eol:¶,trail:· " show tabs and trailing
    set matchtime=5         " how many tenths of a second to blink
                            " matching brackets for
    set nohlsearch          " o data ce s-a cautat ceva si se highlight-uiesc potrivirile
                            " cand se iese din cautare, ascunde highlight-urilek
    set nostartofline       " leave my cursor where it was
    set visualbell          " don't blink
    set number              " turn on line numbers
    set numberwidth=5       " We are good up to 99999 lines
    set report=0            " tell us when anything is changed via :...
    set ruler               " Always show current positions along the bottom
    set scrolloff=5         " 5 linii sus-jos, pentru 'context'
    set shortmess=aOstT     " shortens messages to avoid
                            " 'press a key' prompt
    set showcmd             " show the command being typed
    set showmatch           " show matching brackets
    set sidescrolloff=5     " Keep 5 lines at the size
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
    set completeopt=longest,menuone
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

" Mappings {
    map <F3> <ESC>:set paste!<RETURN>
    map <F4> <ESC>:IndentGuidesToggle<RETURN>
    " nmap <C-h> <ESC>:bp<RETURN>
    " nmap <C-l> <ESC>:bn<RETURN>
    " imap <C-h> <ESC>:bp<RETURN>
    " imap <C-l> <ESC>:bn<RETURN>

    " in modul insert, fa textul cuvantului curent uppercase
    inoremap <C-u> <ESC>mzgUiw`za
" }

" Autocommands {
    au BufNewFile,BufRead *.ahk setf ahk
    " cand se inchide un tab sa se inchida si bufferul asociat
    "au BufNewFile,BufRead * setlocal bufhidden=delete

    " fisierele less sunt tratate ca css
    " au BufNewFile,BufRead *.less setlocal filetype=css
    au BufNewFile,BufRead *.less set filetype=less


    " fisierele *.js au indent de 2 spatii
    au BufNewFile,BufRead *.js setlocal softtabstop=2
    au BufNewFile,BufRead *.js setlocal shiftwidth=2
    au BufNewFile,BufRead *.js setlocal softtabstop=2
    au BufNewFile,BufRead *.js setlocal tabstop=2

    " eliminare automata trailing spaces
    autocmd BufWritePre * :%s/\s\+$//e
" }

" GUI Settings {
set t_Co=256 "suport pentru 256 de culori
colorscheme mustangg

if has("gui_running")
    " Basics {
        set guifont=DejaVu\ Sans\ Mono\ 8 " My favorite font
        "set guioptions=ce
        set guioptions=cei
        "              ||
        "              |+-- use simple dialogs rather than pop-ups
        "              +  use GUI tabs, not console style tabs
        " set lines=55 " perfect size for me
        set mousehide " hide the mouse cursor when typing
    " }
endif
" }
"


