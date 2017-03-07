" implicit este /*%s*/
" cand comentez linii este dubios
setlocal commentstring=//\ %s
setlocal iskeyword+=$

nnoremap <buffer> <leader>vd :put='var_dump('. expand('<cword>'). ');'<CR>==
xnoremap <buffer> <leader>vd :<C-u>put='var_dump('. visual#GetSelection(). ');'<CR>==
nnoremap <buffer> <leader>db :put='debug('. expand('<cword>'). ');'<CR>==
xnoremap <buffer> <leader>db :<C-u>put='debug('. visual#GetSelection(). ');'<CR>==
nnoremap <buffer> <leader>dd :put='dd('. expand('<cword>'). ');'<CR>==
xnoremap <buffer> <leader>dd :<C-u>put='dd('. visual#GetSelection(). ');'<CR>==
nnoremap <buffer> <leader>spf :put='sprintf('''. expand('<cword>'). ' %s'', '. expand('<cword>'). ');'<CR>==
xnoremap <buffer> <leader>spf :<C-u>put='sprintf('''. visual#GetSelection(). ' %s'', '. visual#GetSelection(). ');'<CR>==
