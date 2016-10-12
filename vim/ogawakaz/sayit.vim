
function! SaySelection(type, ...)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    " :h map-operator
    if a:0
        exe "normal! `<" . a:type . "`>y"
    elseif a:type == 'line'
        exe "normal! '[V']y"
    elseif a:type == 'block'
        exe "normal! `[\<C-V>`]y"
    else
        exe "normal! `[v`]y"
    endif

    if $sayitnowait
        call SayTextNoWait(substitute(@@, '\n', ' newline ', 'g'))
    else
        call SayTextAndWait(substitute(@@, '\n', ' newline ', 'g'))
    endif

    let &selection = sel_save
    let @@ = reg_save
endfunction

function! ReplaceUnspokenSymbols(text)
    let mytext = a:text
    let mytext = substitute(mytext, "c\\(t\\|[^aeiouAEIOU][^aeiouAEIOU]\\)", " see \\1", "g")
    let mytext = substitute(mytext, "\'", " singlequote ", "g")
    let mytext = substitute(mytext, "==", " c compare ", "g")
    let mytext = substitute(mytext, "!", " c not ", "g")
    let mytext = substitute(mytext, ":)", " smile ", "g")
    let mytext = substitute(mytext, ":", " colon ", "g")
    let mytext = substitute(mytext, ";", " semicolon ", "g")
    let mytext = substitute(mytext, "(", " begin paren ", "g")
    let mytext = substitute(mytext, ")", " end paren ", "g")
    let mytext = substitute(mytext, "->", " arrow ", "g")
    let mytext = substitute(mytext, "-", " minus ", "g")
    let mytext = substitute(mytext, "\\\.", " dot ", "g")
    let mytext = substitute(mytext, "\"\\(.\\{-1,}\\)\"", " begin quote \\1 end quote ", "g")
    let mytext = substitute(mytext, "#", " hash ", "g")
    let mytext = substitute(mytext, "%", " percent ", "g")
    return mytext
endfunction

function! SayTextNoWait(text)
    exe ":silent !echo \'" . ReplaceUnspokenSymbols(a:text) . "\' \| sayin & "
endfunction

function! SayTextAndWait(text)
    exe ":silent !echo \'" . ReplaceUnspokenSymbols(a:text) . "\' \| sayin "
endfunction

" map alt-d and alt-s to voice functions
nmap <buffer><silent>δ :let $sayitnowait=1:set opfunc=SaySelectiong@
nmap <buffer><silent>σ :let $sayitnowait=0:set opfunc=SaySelectiong@
vmap <silent><buffer>σ :<C-U>call SaySelection(visualmode(), 1)

nmap <buffer><silent>σσ :call SayTextAndWait(getline(line('.')))

