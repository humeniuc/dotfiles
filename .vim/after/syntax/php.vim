" nmap <F2> :exec ":hi " . synIDattr(synID(line("."), col("."), 1), "name")<CR>

" hi link phpIdentifier phpVarSelector

" culoarea phpVarSelector ($) sa fie la fel cu cea a identifier-ului
hi link phpVarSelector phpIdentifier

