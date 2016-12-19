" implicit este /*%s*/
" cand comentez linii este dubios
setlocal commentstring=//\ %s
setlocal iskeyword+=$

nnoremap <buffer> <leader>vd :put='var_dump('. expand('<cword>'). ');'<CR>==
xnoremap <buffer> <leader>vd :<C-u>put='var_dump('. visual#getSelection(). ');'<CR>==
nnoremap <buffer> <leader>db :put='debug('. expand('<cword>'). ');'<CR>==
xnoremap <buffer> <leader>db :<C-u>put='debug('. visual#getSelection(). ');'<CR>==
nnoremap <buffer> <leader>dd :put='dd('. expand('<cword>'). ');'<CR>==
xnoremap <buffer> <leader>dd :<C-u>put='dd('. visual#getSelection(). ');'<CR>==
