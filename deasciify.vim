"map function to a key sequence in visual mode
vmap ,t :call Deasciify()<CR>

if !exists("g:turkish_decision_list")
    source turkish_decision_list.vim
endif

function! Deasciify()
    normal gv"xy
    let @x = Deasciify_text(@x)
    normal gvdh
    normal "xp
endfunction

function! Deasciify_text(text)
    let deasciified = a:text
    let len = strlen(deasciified)

    for i in range(len)
        let char = deasciified[i]
        if Deasciify_needs_correction(char)
            let deasciified[i] = Deasciify_toggle_accent(char)
        endif
    endfor

    return deasciified
endfunction

function! Deasciify_needs_correction(char)
    return 0
endfunction

function! Deasciify_toggle_accent(char)
    return a:char
endfunction
