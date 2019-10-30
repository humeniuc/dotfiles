function! grep#fill(s, wb)
    let l:param = a:s

    let l:param = escape(l:param, '^$\?+{}[]')

    if a:wb
        let l:param = '\b'. l:param. '\b'
    endif

    let l:param = shellescape(l:param)
    let l:param = escape(l:param, '|%#')

    let l:cmd = "\<ESC>"
    let l:cmd .= ':grep '
    let l:cmd .= l:param
    let l:cmd .= ' -r .'

    call feedkeys(cmd, 't')
endfunction

" testing
" bash echo 'controller::metoda | pipe (p) [d] ^ $var '\''simple'\'' "duble" #hash after' > sample.txt
" call grep#fill('controller::metoda | pipe (p) [d] ^ $var ''simple'' "duble" #hash')
" call grep#fill('gigi')
" call grep#fill('gigi', 0)
" call grep#fill('gigi', 1)

