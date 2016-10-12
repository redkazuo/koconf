if !exists("load_kaztags")
    finish
endif

nnoremap <silent><buffer><C-]> :call KazTag(1)<CR>
nnoremap <silent><buffer>2<C-]> :call KazTag(2)<CR>
nnoremap <silent><buffer>3<C-]> :call KazTag(3)<CR>
nnoremap <silent><buffer>4<C-]> :call KazTag(4)<CR>

setl showfulltag

setl completeopt=menu,preview,longest
setl complete=.,w,b,i

if exists("loaded_kaztags")
    finish
endif
let loaded_kaztags = 1

set nocp
filetype plugin on

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

let OmniCpp_DisplayMode = 1

function! KazTag(count)
    let tag = KazTagText(0)
    if len(tag) > 0
        let tlist = taglist("^" . tag . "$")
        if len(tlist) == 2
            " if this is prototype and declaration, go from one to the other
            let kind1 = tlist[0]['kind']
            let kind2 = tlist[1]['kind']
            if kind1 == "p" && kind2 == "f" || kind1 == "f" && kind2 == "p"
                if (a:count > 1)
                    exec 1 . " tag " . tag
                else
                    exec 2 . " tag " . tag
                endif
                return
            endif
        endif

        exec a:count . " tag " . tag
    endif
endfun

function! KazTagText(echoall)
    call omni#cpp#complete#Main(1, "")
    let selectedword = expand("<cword>")
    let scope = omni#cpp#complete#Main(0, selectedword)
    let shortest = ""
    for i in range(len(scope))
        let current = scope[i]['name']
        if len(shortest) == 0 || len(current) < len(shortest)
            let shortest = current
        endif
    endfor
    if len(selectedword) > len(shortest)
        return ""
    endif
    return shortest
endfun

