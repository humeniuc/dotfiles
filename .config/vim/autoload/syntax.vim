" Show what syntax highlighting group is under cursor.
" From https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
" TODO: To investigate better output.
function! syntax#queryCursor()
    echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction
