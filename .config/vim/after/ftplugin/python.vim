nnoremap <buffer> <leader>pr :put='print('. expand('<cword>'). ')'<CR>==
xnoremap <buffer> <leader>pr :<C-u>put='print('. visual#GetSelection(). ')'<CR>==
