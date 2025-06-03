nnoremap <buffer> <leader>pr :put='fmt.Println('. expand('<cword>'). ')'<CR>==
xnoremap <buffer> <leader>pr :<C-u>put='fmt.Println('. visual#GetSelection(). ')'<CR>==
