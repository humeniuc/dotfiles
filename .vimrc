let mapleader ="\<Space>"

filetype off
call pathogen#infect()
call pathogen#helptags()

if !exists('myruntime')
    let myruntime = split(&rtp, ',')[0]
endif

" plugin: checksyntax
let g:checksyntax#async_runner = ''

" plugin: indent-guides
let g:indent_guides_indent_levels = 30
let g:indent_guides_auto_colors = 1
let g:indent_guides_color_change_percent = 5
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 0

" plugin; unite
let g:unite_source_history_yank_enable = 1
"call unite#filters#matcher_default#use(['matcher_fuzzy'])

"nnoremap [unite] <Nop>
"nmap <space> [unite]

nnoremap <leader>f :<C-u>Unite -buffer-name=files   -start-insert file<CR>
nnoremap <leader>l :<C-u>Unite -buffer-name=line   -start-insert line<CR>
nnoremap <leader>y :<C-u>Unite -buffer-name=yank    history/yank<CR>
nnoremap <leader>b :<C-u>Unite -buffer-name=buffer -start-insert buffer<CR>
nnoremap <leader>tf :<C-u>Unite -buffer-name=tagfiles -start-insert tag/file<CR>
nnoremap <leader>t :<C-u>Unite -buffer-name=tags -start-insert tag<CR>
nnoremap <leader>g :<C-u>Unite grep:.<CR>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

"implicit este dezactivat.se activeaza la nivel de proiect
let g:gutentags_enabled=0
let g:gutentags_generate_on_missing=0
let g:gutentags_generate_on_new=0
let g:gutentags_generate_on_write=0
let g:gutentags_define_advanced_commands=1

" localvimrc
let g:localvimrc_sandbox=0
let g:localvimrc_ask=0
let g:localvimrc_name=['.myproject.lvimrc']
" let g:localvimrc_event=['BufWinEnter']
let g:localvimrc_event=['BufEnter']

"snipmate
let g:snippets_dir = myruntime . '/bundle/gabi/snippets/'


set nocompatible " explicitly get out of vi-compatible mode
syntax on " syntax highlighting on

" General {

filetype plugin indent on
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac
set hidden
set mouse=a
set noerrorbells
set wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*/CVS/**
set wildmode=list:longest
set history=500
set cscopequickfix=s-,c-,d-,i-,t-,e-

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" }

" Vim UI {
    set nocursorcolumn
    set nocursorline
    set incsearch           " BUT do highl " don't use a pop up menu for completion " don't use a pop up menu for completionssight as you type you
                            " search phrase
    set laststatus=2        " always show the status line
    set lazyredraw          " do not redraw while running macros
    set linespace=0         " don't insert any extra pixel lines betweens rows
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
" }

" Text Formatting/Layout {
set completeopt=longest,menuone
set ignorecase
set infercase " case inferred by default
set nowrap
set smartcase " if there are caps, go case-sensitive
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 7 (3 + 4)
set expandtab
" }

" Maps
nnoremap <F1> <NOP>
inoremap <F1> <NOP>
nnoremap <F2> :exec ":hi " . synIDattr(synID(line("."), col("."), 1), "name")<CR>
nnoremap <F3> <ESC>:set paste!<RETURN>
nnoremap <F4> <ESC>:IndentGuidesToggle<RETURN>


" in 'proiecte' leader-u este pentru a deschide unite cu lista de fisiere
" daca nu sunt intr-un fisier din proiecte ar insemna undo.
" pentru a preveni undo-urile inutile dezactivez <u> cand este prefixat de
" <leader>
nnoremap <leader>u <NOP>
nnoremap <leader>w <ESC>:w<CR><ESC>

" current word, make-it uppercase
inoremap <C-u> <ESC>mzgUiw`za

nnoremap / /\v\c
vnoremap / /\v\c
nnoremap Q <Nop>
nnoremap <leader>/l /\%=line('.')l\v\c

" changed from romainl; from here: https://github.com/romainl/dotvim/blob/master/vimrc
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%' ]
    execute 'xnoremap i'. char. ' :<C-u>normal! T'. char. 'vt'. char. '<CR>'
    execute 'onoremap i'. char. ' :<C-u>normal! T'. char. 'vt'. char. '<CR>'
    execute 'xnoremap a'. char. ' :<C-u>normal! F'. char. 'vf'. char. '<CR>'
    execute 'onoremap a'. char. ' :<C-u>normal! F'. char. 'vf'. char. '<CR>'
endfor

" autogroup
augroup ft
    autocmd!
    autocmd BufNewFile,BufRead *.less setlocal filetype=less
    autocmd BufNewFile,BufRead *.js setlocal softtabstop=2 shiftwidth=2 softtabstop=2 tabstop=2

    " remove trailing spaces
    autocmd BufWritePre * :%s/\s\+$//e
    " cand se paraseste modul insert se renunta la paste
    au InsertLeave * set nopaste

    "de debug
    "autocmd BufEnter * echom "enter ". expand('%')
    "autocmd BufLeave * echom "leave ". expand('%')
augroup END

" GUI Settings {
set t_Co=256 "suport pentru 256 de culori
" colorscheme mustangg
colorscheme apprentice
set guifont=DejaVu\ Sans\ Mono\ 8
set guioptions=ci " meniu simplu; icon vizibil; aegimrLtT default
" }
"
" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowritefile (is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
augroup END
endif



