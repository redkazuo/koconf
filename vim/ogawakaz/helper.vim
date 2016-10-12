if exists("loaded_ogawakazhelper")
    finish
endif
let loaded_ogawakazhelper = 1


function! KOComment(comment) range
    let turnon = match(getline(a:firstline), "^\\s*\\(" . a:comment . "\\)\\+")
    let replacement = ""
    if turnon
        let replacement = a:comment . "\\1"
    else
        let replacement = "\\1"
    endif

    let linenum = a:firstline
    while linenum <= a:lastline
        let line = getline(linenum)
        let line = substitute(line, "^\\(\\s*\\)\\(".a:comment."\\)*", replacement, "")
        call setline(linenum, line)
        let linenum = linenum + 1
    endwhile
endfunction

