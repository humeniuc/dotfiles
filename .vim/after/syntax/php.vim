" nmap <F2> :exec ":hi " . synIDattr(synID(line("."), col("."), 1), "name")<CR>

" culoarea phpVarSelector ($) sa fie la fel cu cea a identifier-ului
" hi link phpVarSelector phpIdentifier
"

" highlight! link phpRegion Function
" $ variable
highlight! link phpVarSelector phpIdentifier
" highlight! link phpMethods Function
highlight! link phpMethodsVar Function


