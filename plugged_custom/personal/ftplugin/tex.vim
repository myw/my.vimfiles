if exists("did_custom_latex")
        finish
else
        let did_custom_latex=1
endif

" Vim-LaTeX stuff
"let g:Tex_Menus = 0
let g:Tex_MenuPrefix = 'TeX.'
let g:Tex_Debug = 0
"let g:Tex_DebugLog = '/Users/misha/Desktop/tdbg.log'

" General formatting
set tw=78
set spell
