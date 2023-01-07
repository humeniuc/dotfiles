" implicit este /*%s*/
" cand comentez linii este dubios
setlocal commentstring=//\ %s
setlocal iskeyword+=$

" var_dump
" nnoremap <buffer> <leader>vd :put='var_dump('. expand('<cword>'). ');'<CR>==
" xnoremap <buffer> <leader>vd :<C-u>put='var_dump('. visual#GetSelection(). ');'<CR>==
nnoremap <buffer> <leader>vd :put='echo PHP_SAPI == ''cli'' ? PHP_EOL : ''<pre>''; var_dump('. expand('<cword>'). '); echo PHP_SAPI == ''cli'' ? PHP_EOL : ''</pre>'';'<CR>==
xnoremap <buffer> <leader>vd :<C-u>put='echo PHP_SAPI == ''cli'' ? PHP_EOL : ''<pre>''; var_dump('. visual#GetSelection(). '); echo PHP_SAPI == ''cli'' ? PHP_EOL : ''</pre>'';'<CR>==

" print_r
nnoremap <buffer> <leader>pr :put='echo PHP_SAPI == ''cli'' ? PHP_EOL : ''<pre>''; print_r('. expand('<cword>'). '); echo PHP_SAPI == ''cli'' ? PHP_EOL : ''</pre>'';'<CR>==
xnoremap <buffer> <leader>pr :<C-u>put='echo PHP_SAPI == ''cli'' ? PHP_EOL : ''<pre>''; print_r('. visual#GetSelection(). '); echo PHP_SAPI == ''cli'' ? PHP_EOL : ''</pre>'';'<CR>==

" debug
nnoremap <buffer> <leader>db :put='debug('. expand('<cword>'). ');'<CR>==
xnoremap <buffer> <leader>db :<C-u>put='debug('. visual#GetSelection(). ');'<CR>==

" dd
nnoremap <buffer> <leader>dd :put='dd('. expand('<cword>'). ');'<CR>==
xnoremap <buffer> <leader>dd :<C-u>put='dd('. visual#GetSelection(). ');'<CR>==
nnoremap <buffer> <leader>dde :put='(new \Illuminate\Support\Debug\Dumper)->dump('. expand('<cword>'). ');'<CR>==
xnoremap <buffer> <leader>dde :<C-u>put='(new \Illuminate\Support\Debug\Dumper)->dump('. visual#GetSelection(). ');'<CR>==

" sprintf
nnoremap <buffer> <leader>spf :put='sprintf('''. expand('<cword>'). ' %s'', '. expand('<cword>'). ');'<CR>==
xnoremap <buffer> <leader>spf :<C-u>put='sprintf('''. visual#GetSelection(). ' %s'', '. visual#GetSelection(). ');'<CR>==

" debug(sprintf
nnoremap <buffer> <leader>dspf :put='debug(sprintf('''. expand('<cword>'). ' %s'', '. expand('<cword>'). '));'<CR>==
xnoremap <buffer> <leader>dspf :<C-u>put='debug(sprintf('''. visual#GetSelection(). ' %s'', '. visual#GetSelection(). '));'<CR>==
