"-------------------------------------------------------------------------------
"  Description: My personal colors
"  Deeply altered by: redkazuo@gmail.com , to be My personal colors...
"          $Id: martin_krischik.vim 458 2006-11-18 09:42:10Z krischik $
"------------------------------------------------------------------------------

" First remove all existing highlighting.

set background=light
highlight clear

if exists ("syntax_on")
    syntax reset
endif

let colors_name = "ogawakaz"

if version < 700"{{{
   " Section: works only with vim 7.0 use blue otherwise 
   "
   colorscheme blue
   "
   " 
   finish
"}}}

elseif (&term == "builtin_gui")"{{{
    " Section: Set GUI colors. 
    "
    " Subsection: User-Interface Colors "{{{
    "
    " Group: Normal Text Colors 
    "
    highlight Normal gui=none     guifg=black guibg=white
    highlight Search guibg=Yellow
    highlight SpecialKey guifg=Blue
    highlight Title	gui=bold guifg=Magenta
    highlight LineNr guifg=grey64 guibg=grey96
    highlight CursorLineNr guifg=grey55 guibg=white gui=none
    highlight ColorColumn guibg=#FFEDED
    highlight NonText		gui=bold		guifg=grey70	    guibg=white
    highlight MatchParen						    guibg=grey80
    highlight IncSearch		gui=reverse

    "
    " Group: Messages 
    "
    highlight WarningMsg				guifg=Red
    highlight ErrorMsg					guifg=White	    guibg=Red
    highlight ModeMsg		gui=bold
    highlight MoreMsg		gui=bold		guifg=#00CC33
    highlight Question		gui=bold		guifg=#00CC33

    "
    " Group: Spell Checker 
    "
    highlight SpellBad		gui=undercurl							guisp=Red
    highlight SpellCap		gui=undercurl							guisp=Blue
    highlight SpellLocal	gui=undercurl							guisp=DarkCyan
    highlight SpellRare		gui=undercurl							guisp=Magenta

    "
    " Group: Status line 
    "
    highlight StatusLine	gui=none	guibg=grey90    guifg=grey50
    highlight StatusLineNC	gui=none		guibg=grey95	    guifg=grey60
    highlight VertSplit	gui=none		guibg=grey95	    guifg=grey60

    "
    " Group: Visual selektio 
    "
    highlight Visual		gui=none guibg=grey92
    highlight VisualNOS		gui=none guibg=grey92

    "
    " Group: tab pages line 
    "
    highlight TabLine		gui=none    guifg=grey50    guibg=grey92
    highlight TabLineFill	gui=none    guifg=grey50     guibg=grey92
    highlight TabLineSel	gui=none    guifg=grey30     guibg=white

    "
    " Group: Completion (omni and otherwise) menu colors 
    "
    highlight Pmenu							    guibg=Grey
    highlight PmenuSel					guifg=White	    guibg=firebrick
    highlight PmenuSbar					guibg=LightGrey	    guibg=DarkGrey
    highlight PmenuThumb	gui=reverse
    highlight WildMenu					guifg=White	    guibg=firebrick

    "
    " Group: Diff colors 
    "
    highlight DiffAdd							    guibg=LightBlue
    highlight DiffChange						    guibg=LightMagenta
    highlight DiffDelete	gui=bold		guifg=Blue	    guibg=LightCyan
    highlight DiffText		gui=bold				    guibg=Red

    "
    " Group: Fold colors 
    "
    " what is this, anyway?
    highlight FoldColumn				guifg=blue	    guibg=blue
    highlight Folded					guifg=grey50    guibg=#f4f4f8

    "
    " Group: Other Syntax Highlight Colors 
    "
    highlight Directory		guifg=Blue
    highlight SignColumn	guifg=DarkBlue	    guibg=Grey

    "
    " Group: Motif and Athena widget colors. 
    "
    highlight Menu		guifg=Black	    guibg=LightGrey
    highlight Scrollbar		guifg=LightGrey	    guibg=DarkGrey
    highlight Tooltip		guifg=Black	    guibg=LightGrey

"}}}

    " Subsection: Syntax Colors  "{{{
    "
    " Group: Comment colors syntax-group
    "
    highlight Comment					guifg=grey50

    "
    " Group: Constant colors group 
    " 
    highlight Boolean					guifg=grey35
    highlight Character					guifg=grey35
    highlight Constant					guifg=grey35
    highlight Float						guifg=grey35
    highlight Number					guifg=grey35
    highlight String					guifg=grey35

    "
    " Group: Identifier colors group 
    "
    highlight Function					guifg=Blue
    highlight Identifier				guifg=Blue

    "
    " Group: Statement colors group 
    "
    highlight Conditional	gui=none		guifg=Blue
    highlight Exception		gui=none		guifg=Blue
    highlight Keyword		gui=none		guifg=Blue
    highlight Label			gui=none		guifg=Blue
    highlight Operator		gui=none		guifg=Blue
    highlight Repeat		gui=none		guifg=Blue
    highlight Statement		gui=none		guifg=Blue

    "
    " Group: Preprocessor colors group 
    "
    highlight Define					guifg=Blue
    highlight Include					guifg=Blue
    highlight Macro						guifg=Blue
    highlight PreCondit					guifg=Blue
    highlight PreProc					guifg=Blue 

    "
    " Group: type group 
    "
    highlight StorageClass	gui=none		guifg=#2B60DE
    highlight Structure		gui=none		guifg=#2B60DE
    highlight Type			gui=none		guifg=#2B60DE
    highlight Typedef		gui=none		guifg=#2B60DE

    "
    " Group: special symbol group 
    "
    highlight Special						guifg=SlateBlue     
    highlight SpecialChar					guifg=#2B60DE
    highlight Tag							guifg=DarkSlateBlue 
    highlight Delimiter						guifg=grey25    
    highlight SpecialComment				guifg=VioletRed     
    highlight Debug							guifg=maroon	    

    "
    " Group: text that stands out 
    "
    highlight Underlined	gui=underline		guifg=SlateBlue

    "
    " Group: left blank, hidden 
    "
    highlight Ignore					guifg=bg

    "
    " Group: any erroneous construct 
    "
    highlight Error		gui=undercurl		guifg=Red	    guibg=MistyRose

    "
    " Group: anything that needs extra attention 
    "
    highlight Todo					guifg=Blue	    guibg=Yellow

"}}}

    " Subsection: Cursor Colors "{{{
    "
    " Group: Mouse Cursor 
    "
    highlight cCursor	     guifg=bg	 guibg=Black
    highlight Cursor	     guifg=bg	 guibg=Black
    highlight CursorColumn	 guibg=Black
    highlight CursorIM	     guifg=bg	 guibg=Black
    highlight CursorLine guibg=grey98	 
    highlight lCursor	     guifg=bg	 guibg=Black
    highlight oCursor	     guifg=bg	 guibg=Black
    highlight vCursor	     guifg=bg	 guibg=Black
    "
    " Group: Text Cursor 
    "
    set guicursor=n:block-lCursor,
		 \i:ver25-Cursor,
		 \r:hor25-Cursor,
		 \v:block-vCursor,
		\ve:ver35-vCursor,
		 \o:hor50-oCursor-blinkwait75-blinkoff50-blinkon75,
		 \c:block-cCursor,
		\ci:ver20-cCursor,
		\cr:hor20-cCursor,
		\sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

   syntax enable
"}}}
   " 
   finish"}}}

elseif (&term == "xterm") || (&term == "screen.linux") || (&term == "screen") || (&term == "vt320") || (&term == "cygwin") || (&term == "linux")"{{{
    " Section: Only set colors for terminals we actualy know of 
    "
    if &term=="vt320"
        set t_Co=8
    else
        set t_Co=16
    endif

    set background=dark

    " Subsection: User Interface Colors "{{{
    "
    " Group: Normal Text Colors 
    "
    highlight Normal		term=none	    cterm=none		    ctermfg=none	ctermbg=none
    highlight Search		term=reverse							ctermbg=DarkYellow
    highlight SpecialKey	term=bold				    ctermfg=none	ctermbg=none
    highlight Title		term=bold				    ctermfg=none	ctermbg=none
    highlight LineNr		term=none				    ctermfg=none	ctermbg=none
    highlight NonText		term=none				    ctermfg=none	ctermbg=none
    highlight MatchParen	term=none cterm=none ctermbg=black ctermfg=lightgray
    highlight IncSearch		term=reverse	    cterm=reverse
    "
    " Group: Messages 
    "
    highlight WarningMsg	cterm=bold				    ctermfg=none	ctermbg=none
    highlight ErrorMsg		cterm=bold				    ctermfg=none	ctermbg=none
    highlight ModeMsg term=bold cterm=bold    cterm=bold ctermbg=none
    highlight MoreMsg term=bold	cterm=bold	    ctermfg=none	ctermbg=none
    highlight Question		cterm=bold    ctermfg=none	ctermbg=none
    "
    " Group: Spell Checker 
    "
    highlight SpellBad		term=reverse							ctermbg=LightRed
    highlight SpellCap		term=reverse							ctermbg=LightBlue
    highlight SpellLocal	term=underline							ctermbg=LightCyan
    highlight SpellRare		term=reverse							ctermbg=LightMagenta
    "
    " Group: Status line 
    "
    highlight StatusLine	term=bold,reverse   cterm=bold,reverse
    highlight StatusLineNC	term=reverse	    cterm=reverse
    highlight VertSplit		term=reverse	    cterm=reverse
    "
    " Group: Visual selection 
    "
    highlight Visual		term=reverse cterm=reverse ctermfg=DarkGray	ctermbg=White
    highlight VisualNOS		term=bold,underline cterm=bold,underline

    "
    " Group: tab pages line 
    "
    highlight TabLine		term=none	    cterm=none ctermbg=none ctermfg=none
    highlight TabLineFill	term=none	    cterm=none
    highlight TabLineSel	cterm=bold,underline
    "
    " Group: Menu colors 
    "
    highlight Pmenu										ctermbg=none
    highlight PmenuSel	    ctermfg=none	ctermbg=none
    highlight PmenuSbar	    ctermfg=none	ctermbg=none
    highlight PmenuThumb    cterm=reverse
    highlight WildMenu	term=standout	ctermfg=White	ctermbg=Red
    "
    " Group: Diff colors 
    "
    highlight DiffAdd		term=bold							ctermbg=LightBlue
    highlight DiffChange	term=bold							ctermbg=LightMagenta
    highlight DiffDelete	term=bold				    ctermfg=LightBlue	ctermbg=Blue
    highlight DiffText		term=reverse	    cterm=bold					ctermbg=LightRed
    "
    " Group: Fold colors 
    "
    highlight FoldColumn	term=standout				    ctermfg=White	ctermbg=DarkGray
    highlight Folded		term=standout				    ctermfg=White	ctermbg=DarkGray
    "
    " Group: Other Syntax Highlight Colors 
    "
    highlight Directory		term=bold				    ctermfg=DarkBlue	ctermbg=White
    highlight SignColumn	term=standout				    ctermfg=DarkBlue	ctermbg=DarkGray
"}}}

    " Subsection: Syntax Colors "{{{
    "
    " Group: Comment colors syntax-group 
    "
    highlight Comment		cterm=none				    ctermfg=none	ctermbg=none
    "
    " Group: Constant colors group 
    "
    highlight Boolean		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Character		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Constant		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Float		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Number		cterm=none				    ctermfg=none	ctermbg=none
    highlight String		cterm=none				    ctermfg=none	ctermbg=none
    "
    " Group: Identifier colors group 
    "
    highlight Function		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Identifier	cterm=bold				    ctermfg=none	ctermbg=none
    "
    " Group: Statement colors group 
    "
    highlight Conditional	cterm=bold				    ctermfg=none	ctermbg=none
    highlight Exception		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Keyword		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Label		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Operator		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Repeat		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Statement		cterm=bold				    ctermfg=none	ctermbg=none
    "
    " Group: Preprocessor colors group 
    "
    highlight Define		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Include		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Macro		cterm=bold				    ctermfg=none	ctermbg=none
    highlight PreCondit		cterm=bold				    ctermfg=none	ctermbg=none
    highlight PreProc		cterm=bold				    ctermfg=none	ctermbg=none
    "
    " Group: type group 
    "
    highlight StorageClass	cterm=bold				    ctermfg=none	ctermbg=none
    highlight Structure		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Type		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Typedef		cterm=bold				    ctermfg=none	ctermbg=none
    "
    " Group: special symbol group 
    "
    highlight Special		cterm=bold				    ctermfg=none	ctermbg=none
    highlight SpecialChar	cterm=bold				    ctermfg=none	ctermbg=none
    highlight Tag		cterm=bold				    ctermfg=none	ctermbg=none
    highlight Delimiter		cterm=bold				    ctermfg=none	ctermbg=none
    highlight SpecialComment	cterm=bold				    ctermfg=none	ctermbg=none
    highlight Debug		term=bold				    ctermfg=none	ctermbg=none
    "
    " Group: text that stands out 
    "
    highlight Underlined	term=underline	    cterm=underline	    ctermfg=none	ctermbg=none
    "
    " Group: left blank, hidden 
    "
    highlight Ignore    ctermfg=none	ctermbg=none
    "
    " Group: any erroneous construct 
    "
    highlight Error		term=underline				    ctermfg=none	ctermbg=darkred
    "
    " Group: anything that needs extra attention 
    "
    highlight Todo		term=standout				    ctermfg=Black	ctermbg=Yellow

"}}}
    " Subsection: Cursor Colors "{{{
    "
    " Group: Mouse Cursor 
    "
    "highlight Cursor term=reverse ctermfg=black ctermbg=Gray
    "highlight CursorColumn term=reverse ctermfg=black ctermbg=Gray
    "highlight CursorIM term=reverse ctermfg=black    ctermbg=gray
    "highlight CursorLine term=reverse ctermbg=gray
    "
    "highlight Cursor	     guifg=bg	 guibg=Black
    "highlight CursorColumn	 guibg=Black
    "highlight CursorIM	     guifg=bg	 guibg=Black
    "highlight CursorLine	 guibg=Black
"}}}

    syntax enable

   " 
    finish

else
   " Section: terminal is completely unknown - fallback to system default 
   "
   set t_Co=8

   " 
   finish
endif"}}}

syntax enable

