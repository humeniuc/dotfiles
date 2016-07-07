" from here https://github.com/romainl/dotvim/blob/master/bundle/languages/after/ftplugin/javascript.vim
nnoremap <buffer> <leader>cl :put='console.log(\"<C-r><C-w>\", <C-r><C-w>);'<CR>==
xnoremap <buffer> <leader>cl y:<C-u>put='console.log(\"<C-r>"\", <C-r>");'<CR>==
