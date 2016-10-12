ru ogawakaz/helper.vim

setl et ts=2 sw=2
setl tw=80
setl ai

nmap <silent><buffer><A-/> :call KOComment('#')
vmap <silent><buffer><A-/> :call KOComment('#')

highlight extrawhitespace guifg=#FF9696 gui=undercurl
highlight tabindent guifg=#FF9696 gui=underline

match extrawhitespace /\s\+\%#\@<!$/

