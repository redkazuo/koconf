if exists("loaded_kbuf")
    finish
endif
let loaded_kbuf = 1

let s:kbufInit = 0
let s:tabline = 0
let s:bufs = []
let s:idx = -1

au BufEnter * :call KBufEnter()
au BufDelete * :call KBufDelete()
au SessionLoadPost * :call KBufReset(argc()+1)

fun! KBufReset(bufnr)
    let s:bufs = range(1, s:max(a:bufnr, argc()))
    let s:idx = -1
    let s:idx = s:nextValidIndex(1)
endfun

fun! KBufInit()
    if (s:kbufInit == 0)
        call KBufReset(bufnr("$"))
        let s:kbufInit = 1
    endif
endfun

fun! s:max(a, b)
    if (a:a > a:b)
        return a:a
    endif
    return a:b
endfun

fun! s:Min(a, b)
    if (a:a < a:b)
        return a:a
    endif
    return a:b
endfun

fun! s:isBufModifiable(buf)
    return getbufvar(a:buf, "&ma")
endfun

fun! s:isBufModifiableNr(bufnr)
    return getbufvar(bufname(a:bufnr), "&ma")
endfun

fun! s:isBufModifiable()
    return s:isBufModifiableNr(winbufnr(0))
endfun

fun! s:isHelpFileNr(bufnr)
    return match(bufname(a:bufnr), $VIM) == 0
endfun

fun! s:isHelpFile()
    return s:isHelpFileNr(winbufnr(0))
endfun

fun! KBufEnter()
    call KBufInit()
    if !s:isBufModifiable()
        call KBufTablineUpdate()
        return
    endif
    let idx = KBufFindIdx(winbufnr(0))
    if idx == -1
        let newidx = s:Min(s:idx+1, len(s:bufs))
        let s:bufs = insert(s:bufs, "", newidx)
        let idx = KBufFindIdx(winbufnr(0))
    else
        normal `"
    endif
    let s:idx = idx
    call KBufTablineUpdate()
endfun

fun! KBufDelete()
    if !s:isBufModifiable()
        call KBufTablineUpdate()
        return
    endif
    call remove(s:bufs, s:idx)
endfun

fun! KBufNext()
    echon ""
    if !s:isBufModifiable() || len(s:bufs) == 1
        call KBufTablineUpdate()
        return
    endif
"    normal m"
    let idx = s:nextValidIndex(1)
    if idx == s:idx
        return
    endif
    let s:idx = idx
    exec "buffer" . get(s:bufs, s:idx)
"    exec "e #" . get(s:bufs, s:idx)
    call KBufTablineUpdate()
endfun

fun! KBufPrevious()
    let &ro = &ro "clear statusline
    if !s:isBufModifiable() || len(s:bufs) == 1
        call KBufTablineUpdate()
        return
    endif
"    normal m"
    let idx = s:nextValidIndex(-1)
    if idx == s:idx
        return
    endif
    let s:idx = idx
    exec "buffer" . get(s:bufs, s:idx)
"    exec "e #" . get(s:bufs, s:idx)
    call KBufTablineUpdate()
    echon ""
endfun

fun! s:moveTab(direction)
    let nidx = s:nextValidIndex(a:direction)
    call insert(s:bufs, remove(s:bufs, s:idx), nidx)
    let s:idx = nidx
    call KBufTablineUpdate()
    echo ""
endfun

fun! s:nextValidIndex(direction)
    let idx = s:idx
    while 1
        "increment and wrap index around
        let idx = idx + a:direction
        if (idx >= len(s:bufs))
            let idx = 0
        endif
        if (idx < 0)
            let idx = len(s:bufs)-1
        endif
        if bufexists(s:bufs[idx]) && s:isBufModifiableNr(s:bufs[idx])
            return idx
        endif
    endwhile
endfun

fun! KBufFindIdx(bufidx)
    for i in range(len(s:bufs))
        let curitem = s:bufs[i]
        if a:bufidx == curitem || curitem == ""
            let s:bufs[i] = a:bufidx
            return i
        endif
    endfor
    return -1
endfun

fun! KBufListText()
    call KBufInit()
    let left = ""
    let right = ""
    let center = ""
    let side = -1
    for i in range(len(s:bufs))
        let buf = get(s:bufs, i)
        if !bufexists(buf) || !s:isBufModifiableNr(buf)
            continue
        endif
        if i == s:idx || side == 0
            let side += 1
        endif
        let text = s:GetTabText(buf)
        if side == -1
            let left .= text
        elseif side == 1
            let right .= text
        else
            let center .= text
        endif
    endfor
    let textsize = strlen(center)
    let leftsize = 0
    let rightsize = 0
    let leftstrlen = strlen(left)
    let rightstrlen = strlen(right)
    for i in range(textsize, &columns)
        if leftsize < leftstrlen && textsize < &columns
            let leftsize += 1
            let textsize += 1
        endif
        if rightsize < rightstrlen && textsize < &columns
            let rightsize += 1
            let textsize += 1
        endif
    endfor
    let left = strpart(left, leftstrlen-leftsize, leftsize)
    let right = strpart(right, 0, rightsize)

    if get(s:bufs, s:idx) == winbufnr(0) "if the window is showing my buffer (it might be showing a help file)
        return left . '%#TabLineSel#' . center . '%#TabLine#' . right . '%#TabLine#' "mark the current tab in a different color
    else
        return left . center . right . '%#TabLine#'
    endif
endfun

fun! s:GetTabText(buf)
    let buf = a:buf
    if !bufexists(buf)
        return ""
    endif
    return " " . buf . (s:isBufModified(buf)?'*':':') .  s:shortenBufName(bufname(buf)) . " "
endfun

fun! s:isBufModified(buf)
    return getbufvar(a:buf, "&mod")
endfun

fun! s:shortenBufName(bufname)
    return substitute(a:bufname, ".*/", "", "")
endfun

fun! KBufList()
    echo KBufListText()
    call KBufTablineUpdate()
endfun

fun! KBufTabline()
    let s:tabline = 1
    call KBufTablineUpdate()
endfun

fun! KBufTablineUpdate()
    call KBufInit()
    if s:tabline
        exec "set tabline=%!KBufListText()"
        if s:ValidBufs() > 1
            exec "set showtabline=2"
        else
            exec "set showtabline=0"
        endif
    endif
endfun

fun! s:ValidBufs()
    let result = 0
    for i in range(len(s:bufs))
        let buf = get(s:bufs, i)
        if bufexists(buf) && s:isBufModifiableNr(buf)
            let result += 1
        endif
    endfor
    return result
endfun

command! Kbufnext call KBufNext()
command! Kbufprev call KBufPrevious()
command! Kbufmoveup call s:moveTab(-1)
command! Kbufmovedown call s:moveTab(1)
command! Kbufreset call KBufReset()
command! Kbuftabline call KBufTabline()

