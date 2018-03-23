let mapleader ="\<Space>"

filetype off
call pathogen#infect()
call pathogen#helptags()

if !exists('myruntime')
    let myruntime = split(&rtp, ',')[0]
endif

" plugin: ale
let g:ale_lint_delay=1000
let g:ale_lint_on_enter=0
let g:ale_lint_on_insert_leave=0
let g:ale_lint_on_text_changed='never'
let g:ale_php_phpcs_standard='PSR2'

" plugin: unite
let g:unite_source_history_yank_enable = 1
nnoremap <leader>f :<C-u>Unite -buffer-name=files   -start-insert file<CR>
nnoremap <leader>l :<C-u>Unite -buffer-name=line   -start-insert line<CR>
nnoremap <leader>y :<C-u>Unite -buffer-name=yank    history/yank<CR>
nnoremap <leader>b :<C-u>Unite -buffer-name=buffer -start-insert buffer<CR>
" nnoremap <leader>tf :<C-u>Unite -buffer-name=tagfiles -start-insert tag/file<CR>
nnoremap <leader>t :<C-u>Unite -buffer-name=tags -start-insert tag<CR>
nnoremap <leader>g :<C-u>Unite grep:.<CR>

" plugin: vdebug
let g:vdebug_options= {
\    "break_on_open" : 0,
\    "watch_window_style" : 'compact'
\}


" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" localvimrc
let g:localvimrc_sandbox=0
let g:localvimrc_ask=0
let g:localvimrc_name=['.myproject.lvimrc']
let g:localvimrc_event=['BufEnter']

"snipmate
" let g:snippets_dir = myruntime . '/bundle/gabi/snippets/'
let g:snippets_dir = myruntime . '/snippets/'

" gutentags
" pentru CVS nu exista "root dir", nu se poate folosi "CVS" pentru ca apare in
" toate directoarele. este necesar director custom
let g:gutentags_project_root = ['.myproject']
let g:gutentags_generate_on_missing = 0
let g:gutentags_generate_on_new = 0

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
set wildignore+=.git/*
set wildignore+=.svn/*
set wildignore+=tags

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
    set cursorline
    set incsearch           " BUT do highl " don't use a pop up menu for completion " don't use a pop up menu for completionssight as you type you
                            " search phrase
    set laststatus=2        " always show the status line
    set lazyredraw          " do not redraw while running macros
    set linespace=0         " don't insert any extra pixel lines betweens rows
    set nolist
    set listchars=tab:» ,eol:¶,extends:›,precedes:‹,nbsp:·,trail:·
    set matchtime=5         " how many tenths of a second to blink
                            " matching brackets for
    set nohlsearch          " o data ce s-a cautat ceva si se highlight-uiesc potrivirile
                            " cand se iese din cautare, ascunde highlight-urilek
    set nostartofline       " leave my cursor where it was
    set visualbell          " don't blink
    set number              " turn on line numbers
    " set numberwidth=5       " We are good up to 99999 lines
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


" in 'proiecte' leader-u este pentru a deschide unite cu lista de fisiere
" daca nu sunt intr-un fisier din proiecte ar insemna undo.
" pentru a preveni undo-urile inutile dezactivez <u> cand este prefixat de
" <leader>
nnoremap <leader>u <NOP>
nnoremap <leader><CR> <ESC>:update<CR><ESC>

" current word, make-it uppercase
inoremap <C-u> <ESC>mzgUiw`za

" dezactivat intrarea in ex mode
nnoremap Q <Nop>
" cautarea automata sa fie cu regular expressions, si case insensitive
nnoremap / /\v\c

" cautare restrictionata la linia curenta. ex daca esti pe linia 150 cu regular expression, case insensitive: /\%150\v\c
nnoremap <leader>/l /\%<C-R>=line('.')<CR>\vc
" search and replace cu cuvantul de sub cursor
nnoremap <leader>% :%s/\<<C-R>=expand('<cword>')<CR>\>/

if ! has('clipboard') && executable('xclip')
    " copierea in clipboard
    " identific selectia, o escape-uiesc pentru shell + corectia de newline pe
    " care shellescape o adauga inainte de fiecare newline
    " creez si apelez o comanda care paseaza stringul catre xclip
    vnoremap <silent> "+y :<C-u>call system(
        \'echo '.
        \substitute(shellescape(visual#GetSelection()), '\\\n', '\n', 'g').
        \' \| xclip -i -selection clipboard')<CR>

    noremap <silent> "+p :<C-u>set paste<CR>a<C-R>=system('xclip -o -selection clipboard')<CR><ESC>
    noremap <silent> "+P :<C-u>set paste<CR>i<C-R>=system('xclip -o -selection clipboard')<CR><ESC>
endif

" changed from romainl; from here: https://github.com/romainl/dotvim/blob/master/vimrc
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '-' ]
    execute 'xnoremap i'. char. ' :<C-u>normal! T'. char. 'vt'. char. '<CR>'
    execute 'onoremap i'. char. ' :<C-u>normal! T'. char. 'vt'. char. '<CR>'
    execute 'xnoremap a'. char. ' :<C-u>normal! F'. char. 'vf'. char. '<CR>'
    execute 'onoremap a'. char. ' :<C-u>normal! F'. char. 'vf'. char. '<CR>'
endfor

" autogroup
augroup ft
    autocmd!
    autocmd BufNewFile,BufRead *.less setlocal filetype=less
    " autocmd BufNewFile,BufRead *.js setlocal softtabstop=2 shiftwidth=2 softtabstop=2 tabstop=2

    " remove trailing spaces
    autocmd BufWritePre * let b:winview=winsaveview() | %s/\s\+$//e | call winrestview(b:winview)

    " on leaving insert mode, drop nopaste
    autocmd InsertLeave * set nopaste

    " show cursorline only in active window
    autocmd WinEnter * :setlocal cursorline
    autocmd WinLeave * :setlocal nocursorline

    "test pentru evenimente
    "autocmd BufEnter * :call system('echo "$(date) BufEnter" >> /tmp/vim_events_test')
    "autocmd BufLeave * :call system('echo "$(date) BufLeave" >> /tmp/vim_events_test')

    "de debug
    "autocmd BufEnter * echom "enter ". expand('%')
    "autocmd BufLeave * echom "leave ". expand('%')

    " autoopen quickfix on :grep
    " https://stackoverflow.com/questions/39009792/vimgrep-pattern-and-immediately-open-quickfix-in-split-mode
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow

augroup END


" GUI Settings {
set t_Co=256 "suport pentru 256 de culori
colorscheme apprentice
set guifont=Roboto\ Mono\ Bold\ 10
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

command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction
