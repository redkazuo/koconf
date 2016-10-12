ru ogawakaz/helper.vim

" format cc comments nicely
setl fo=croql comments=sr:/*,mb:*,ex:*/,://
setl cindent

nmap <silent><buffer><A-/> :call KOComment('//')
vmap <silent><buffer><A-/> :call KOComment('//')

"show end of line whitespace
highlight extrawhitespace guifg=#FF9696 gui=undercurl
highlight tabindent guifg=#FF9696 gui=underline

if exists("load_kaztags")
    ru plugin/kaztag.vim
endif

if exists("loaded_clike")
    finish
endif
let loaded_clike = 1

function! UseCScope() 
    if has("cscope")
        "set csprg=/usr/local/bin/cscope
        "set csto=0
        "set cst
        set nocsverb
        " add any database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
            cs reset
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
        set csverb

        nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    endif
endfunction

call UseCScope()

