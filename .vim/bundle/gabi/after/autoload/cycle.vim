" cycle common words
function! cycle#Cycle()
    let words = [
                \ ["TRUE", "FALSE"],
                \ ["True", "False"],
                \ ["true", "false"],
                \ ["top", "right", "bottom", "left", "center"],
                \ ["none", "block", "inline-block"],
                \ ["capitalize", "uppercase", "lowercase", "none"],
                \ ["margin-top", "margin-right", "margin-bottom", "margin-left"],
                \ ["padding-top", "padding-right", "padding-bottom", "padding-left"],
                \ ["padding", "margin"],
                \ ["border-top", "border-right", "border-bottom", "border-left"],
                \ ["first", "last"],
                \ ["||", "&&"],
                \ ["gif", "jpg", "png"],
                \ ["slow", "fast"]
                \ ]
    if exists("g:cycle_words")
        let words += g:cycle_words
    endif
    if exists("b:cycle_words")
        let words += b:cycle_words
    endif
    let current_word = expand("<cword>")
    let new_word = ""
    for pair in words
        for word in pair
            if current_word ==# word
                if index(pair, word) < len(pair) - 1
                    let new_word = pair[index(pair, word) + 1]
                elseif index(pair, word) == len(pair) - 1
                    let new_word = pair[0]
                endif
            endif
        endfor
    endfor
    if new_word != ""
        execute 'normal "_ciw' . new_word
    else
        return
    endif
endfunction
