"map function to a key sequence in visual mode
vmap ,t :call Deasciify()<CR>

if !exists("g:turkish_decision_list")
    source turkish_decision_list.vim
endif

let g:turkish_pattern_table = {
}

let g:turkish_char_alist = {
    'c': 'ç',
    'C': 'Ç',
    'ç': 'c',
    'Ç': 'C',

    'g': 'ğ',
    'G': 'Ğ',
    'ğ': 'g',
    'Ğ': 'G',

    'i': 'ı',
    'I': 'İ',
    'ı': 'i',
    'İ': 'I',

    'o': 'ö',
    'O': 'Ö',
    'ö': 'o',
    'Ö': 'O',

    's': 'ş',
    'S': 'Ş',
    'ş': 's',
    'Ş': 'S',

    'u': 'ü',
    'U': 'Ü'
    'ü': 'u',
    'Ü': 'U'
}

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
    let tr = get(g:turkish_char_alist, a:char, a:char)
endfunction

function! Deasciify_toggle_accent(char)
    return a:char
endfunction
