nnoremap <buffer> <leader>vd :put='var_dump('. expand('<cword>'). ');'<CR>==
xnoremap <buffer> <leader>vd :<C-u>put='var_dump('. visual#getSelection(). ');'<CR>==


