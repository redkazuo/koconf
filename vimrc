set nobackup "should i really do this?
set hidden

"set shortmess=a
set title
set titleold=""

set background=light
set noruler
set nocul
set cpo+=$
set noshowmode

colo mine

set scrolloff=7

set sw=4  "shiftwidth
set ts=4  "tabstop
set tw=0 "textwidth=80
set nu
set et "expandtab
set ai "autoindent
set wrapmargin=0

set ic "ignorecase
set scs "smartcase
set is "incsearch
set nohlsearch

filetype on
filetype indent on
au!

" check to create motion based operators
" :h map-operator

augroup clike
    au!
    au FileType c,cc,cpp,java,h,hpp ru ogawakaz/clike.vim
augroup END

autocmd FileType java,py,perl,make setl smartindent

autocmd FileType py,make setl noet ts=4 sw=4

augroup ruby
    au!
    au FileType ruby ru ogawakaz/ruby.vim
augroup END

au BufRead *.erb ru! ogawakaz/erb.vim

ru ogawakaz/kbuf.vim


" map alt-i filter via astyle K&R style and go back to the start 
autocmd FileType c,cc,h,hpp map <buffer>é m':0,$!astyle --style=kr --one-line=keep-blocks --brackets=linux``zz

" astyle java filter
autocmd FileType java map <buffer>é m':0,$!astyle --mode=java --style=java``zz

" map tabs vimperator style, since CTRL-P and CTRL-N are pretty useless
nnoremap <silent> <C-n> :Kbufnext<CR>
nnoremap <silent> <C-tab> :Kbufnext<CR>
nnoremap <silent> <C-p> :Kbufprev<CR>
nnoremap <silent> <C-S-tab> :Kbufprev<CR>
nnoremap <silent> <A-n> :Kbufmovedown<CR>
nnoremap <silent> <A-p> :Kbufmoveup<CR>
nnoremap <A-N> :bn
nnoremap <A-P> :bp
nnoremap  q:

nnoremap ZZ :wqa<Enter>

"ru plugin/sayit.vim "runtime

syntax on

"to make Kbuftabline work you must use .vim/after/plugin/kazrc.vim
"

inoremap <S-kInsert> *

