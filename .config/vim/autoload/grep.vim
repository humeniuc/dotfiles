" Fill command line with a grep command based on the search parameter
function! grep#fill(search, wb)
    " Normalization of params to 'list' type
    if type(a:search) == 1 " string
        let l:params = [a:search]
    elseif type (a:search) == 3 " list
        let l:params = a:search
    else
        throw 'Search by string or list'
    endif

    " Regexp build: Every search tokens is escaped.
    for k in range(0, len(l:params) - 1)
        let l:params[k] = escape(l:params[k], '^$\*?+-{}[]()|')
    endfor

    " Regexp build: Join params to build regexp string: "
    " (search_param_1|search_param2|...)
    let l:search = '('. join(l:params, '|'). ')'

    " Regexp build: If is a word-boundry search, add the \b meta
    " \b(search_param_1|search_param2|...)\b
    if a:wb
        let l:search = '\b'. l:search. '\b'
    endif

    " Because I build a shell command, I need to properly escape the search string
    let l:search = shellescape(l:search)
    " Because the shell command is run through a vim command, I need to escape for vim command.
    let l:search = escape(l:search, '|%#')
 
    let l:cmd = "\<ESC>"
    let l:cmd .= ':grep -E '
    let l:cmd .= l:search
    let l:cmd .= ' -r .'

    call feedkeys(cmd, 't')
endfunction

" fill command line with a grep command searching for getters
" ex: dacă apelez cu oricare dintre string-urile
" 'update'|'getUpdate'|'actionUpdate' va genera command-ul pentru a căuta după toate variantele:
" :grep -E '\b(update\|getUpdate\|actionUpdate)\b' -r .
function! grep#searchMagicMethods(search)
    let base = a:search
    if strchars(base) > 3 && base =~# '^get' && strcharpart(base, 3, 1) ==# toupper(strcharpart(base, 3, 1))
        let base = tolower(strcharpart(base, 3, 1)). strcharpart(base, 4)
    elseif strchars(base) > 6 && base =~# '^action' && strcharpart(base, 6, 1) ==# toupper(strcharpart(base, 6, 1))
        let base = tolower(strcharpart(base, 6, 1)). strcharpart(base, 7)
    endif

    call grep#fill([
                \ base, 
                \ 'get'. toupper(strcharpart(base, 0, 1)). strcharpart(base, 1),
                \ 'action'. toupper(strcharpart(base, 0, 1)). strcharpart(base, 1) 
                \ ], 1);
endfunction



" testing
" bash echo 'controller::metoda | pipe (p) [d] ^ $var '\''simple'\'' "duble" #hash after' > sample.txt
" call grep#fill('controller::metoda | pipe (p) [d] ^ $var ''simple'' "duble" #hash * star + plus ? question - dash', 1)
" call grep#fill('gigi')
" call grep#fill('gigi', 0)
" call grep#fill('gigi', 1)

