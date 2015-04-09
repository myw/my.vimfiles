" Vim color file
" Maintainer:   Mikhail Wolfson
" Last Change:  18. March, 2007
" URL:          http://web.mit.edu/wolfsonm/www
" The theme I always use, modified from DevC++, by Xi Chen

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="mcpp"

hi Normal		gui=NONE        guifg=White     guibg=Black 
hi Comment		gui=italic		guifg=DarkGreen guibg=NONE
hi Constant		gui=NONE		guifg=#FF0909 	guibg=NONE
hi Identifier	gui=NONE		guifg=Navy		guibg=NONE
hi Statement 	gui=bold		guifg=DarkBlue	guibg=NONE
hi PreProc		gui=NONE		guifg=#335EA8	guibg=NONE	
hi Type	  		gui=bold		guifg=Blue		guibg=NONE
hi Special		gui=NONE		guifg=#FF00FF	guibg=NONE
hi String 		gui=NONE		guifg=#FF0909 	guibg=NONE
hi Number 		gui=NONE		guifg=#880088	guibg=NONE
hi Boolean      gui=bold		guifg=DarkBlue	guibg=NONE
hi Gutter 		gui=NONE		guifg=Black		guibg=Grey
hi Todo	        gui=bold,NONE	guifg=Green		guibg=Pink
hi LineNr 		gui=italic		guifg=Black		guibg=#EBE9ED
hi NonText 		gui=bold 		guifg=Grey70	guibg=White
hi Visual		gui=reverse		guifg=NONE		guibg=NONE

hi Comment		ctermfg=DarkGreen	ctermbg=NONE
"hi Constant		ctermfg=#FF0909 	ctermbg=NONE
hi Identifier	ctermfg=Blue		ctermbg=NONE
hi Statement 	ctermfg=Blue		ctermbg=NONE
"hi PreProc		ctermfg=#335EA8		ctermbg=NONE	
hi Type	  		ctermfg=DarkCyan	ctermbg=NONE
hi Special		ctermfg=DarkMagenta	ctermbg=NONE
hi String 		ctermfg=DarkRed 	ctermbg=NONE
"hi Number 		ctermfg=#880088		ctermbg=NONE
hi Boolean      ctermfg=Blue 		ctermbg=NONE
"hi Gutter 		ctermfg=Black		ctermbg=NONE
hi Todo	    	ctermfg=Green		ctermbg=Magenta
"hi LineNrl		ctermfg=Black		ctermbg=NONE
"hi NonText 		ctermfg=Grey70		ctermbg=NONE
"hi Visual		ctermfg=NONE		ctermbg=NONE

" C only
hi cUserCont gui=NONE guifg=NONE guibg=LightGrey
hi cNumbersCom gui=NONE guifg=NONE guibg=NONE
hi cParen gui=bold guifg=NONE guibg=NONE
hi cCppParen gui=bold guifg=NONE guibg=NONE
hi cBracket gui=bold guifg=NONE guibg=NONE
hi cCppBracket gui=bold guifg=NONE guibg=NONE
hi cBlock gui=bold guifg=NONE guibg=NONE
hi cMulti gui=bold guifg=NONE guibg=NONE

