" .vimrc file
" Maintainer: Mikhail Wolfson <mywolfson@gmail.com>
" Last Change:  2015-04-09

scriptencoding utf-8

""" Device-independent settings


"" Basics
" Use Vim defaults, rather than Vi-compatible ones
unlet! g:skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set nocompatible
set autowrite

" More easily accessible leaders
let g:mapleader = ','
let g:maplocalleader = ','


"" Common indentation settings

set autoindent    " always set autoindenting on

set linebreak     " break at words - MYW 12/27/05

set softtabstop=4 " each shift is 4 spaces
set shiftwidth=4  " each shift is 4 spaces
set smarttab
set tabstop=4     " tabs turn into 4 spaces
set backspace=2   " allow backspacing over everything in insert mode
set modeline

set ruler         " show the cursor position all the time
set number        " show line numbers
set expandtab     " default to soft tabs


"" Text formatting options

" Set what things vim can do when it auto-formats lines:
" c - auto format comments
" b - auotwrap lines that cross over textwidth (start short and get long)
" l - long lines are ignored
" n - recognize numbered lists
" j - remove comment leaders when joining lines
set formatoptions+=c,r,b,l,n,j
" t - do not automatically wrap all text to textwidth.
set formatoptions-=t

set nojoinspaces " do not insert extra spaces after the ends of sentences
set laststatus=2

set viminfo='100,<200 " read/write a .viminfo file, don't store more
                      " than 200 lines of registers

set history=1000 " keep 1000 lines of command line history
set updatetime=100 " more frequent UI updates, shorter delays


"" Convenience features to enable, courtesy of Steven Bach

set hidden                   " deal with hidden buffers effectively
set wildchar=<TAB>           " do more reasonable, bash-like filename completion
set wildmenu
set wildmode=longest:full,full

set completeopt=menu,preview " set richer UI options for the completion window

set ignorecase               " ignore case in search
set smartcase                " unless I have varying cases in my search terms

set notitle                  " in terminals, do not set the title of the terminal

set scrolloff=3              " scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set shortmess=at             " shorten messages
set visualbell               " visual bell
set report=0                 " aggressive reporting

set gdefault                 " default to global substitution in a line
set wrapscan                 " searches wrap around the end of a file

"" Custom special charascters
set listchars=tab:▶—,trail:␣,eol:↵,extends:»,precedes:« " hidden characters
set showbreak=»                                         " line wraps


"" Encoding settings

set encoding=utf-8
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set fileencodings=ucs-bom,utf-8,default,latin1
endif


"" Backups and swap files

set bdir=~/.vim/bak,~/.tmp,/tmp " organize backups in one place
set directory=~/.vim/swap,.,~/.tmp,/var/tmp,/tmp


""" Plugins


"" Core filetype plugins
filetype off
filetype plugin indent on
runtime ftplugin/man.vim " man plugin must be run on its own to get :Man
runtime macros/matchit.vim " matchit plugin must be run on its own
syntax enable

"" Plugin helpers

" Rebuild YCM on installation and update
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
    !./install.py
  endif
endfunction

"" Load plugins (run by vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'chrisbra/NrrwRgn'
Plug 'dearrrfish/vim-applescript'
Plug 'dhruvasagar/vim-table-mode'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'ervandew/ag'
Plug 'fs111/pydoc.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'godlygeek/tabular'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'hdima/python-syntax'
Plug 'honza/vim-snippets'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'justincampbell/vim-eighties'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'lambdatoast/elm.vim'
Plug 'lazywei/vim-matlab'
Plug 'lokikl/vim-ctrlp-ag'
Plug 'machakann/vim-swap'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mhinz/vim-startify'
Plug 'michaeljsmith/vim-indent-object'
Plug 'monokrome/vim-lazy-obsession'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-visual-star-search'
Plug 'noc7c9/vim-iced-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'roryokane/detectindent'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vinarise.vim'
Plug 'SirVer/ultisnips'
Plug 'sjl/gundo.vim'
Plug 'syngan/vim-vimlint'
Plug 'thinca/vim-localrc'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'    " Change cases
Plug 'tpope/vim-commentary' " Comment lines with 'gcc'
Plug 'tpope/vim-dispatch'   " Async
Plug 'tpope/vim-fugitive'   " Git support
Plug 'tpope/vim-git'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-obsession'  " Session management
Plug 'tpope/vim-repeat'     " More powerful .
Plug 'tpope/vim-rhubarb'    " GitHub support for vim-fugitive
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'      " Tmux interaction
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'vernonrj/vim-lasttab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-latex/vim-latex'
Plug 'vim-scripts/Modeliner'
Plug 'vim-scripts/taglist.vim'
Plug 'w0rp/ale'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ynkdir/vim-vimlparser'
Plug 'zaiste/tmux.vim'

"" Personal plugins
Plug '~/.vim/plugged_custom/personal'
Plug '~/.vim/plugged_custom/ginkgo'
Plug '~/.vim/plugged_custom/vim-polymer'

call plug#end()



""" Capability or device-dependent settings

"" Only once

if !exists("g:vimrc_loaded") " only run once

  "" GUI output

  if has("gui_running")
    set columns=200      " set default window size
    set lines=80
    set winaltkeys=no    " kill windows altkeys in for TeX Macros
    set guioptions-=T    " autohide toolbar
    set antialias        " smooth fonts by default
  endif


  "" Mouse functionality in terminal

  if !has("gui_running")
    set mouse=a          " most functional mouse mode when in a terminal
  endif
end


"" Run every time


"" Persistent undo

if has("persistent_undo")
  set undofile
  set undodir=~/.vim/undo
endif


"" Colored output

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set incsearch

  set cursorline
  if exists('+colorcolumn')
    set colorcolumn=+1
  endif

endif


"" XTerm-compatible output

if &term=="xterm"
  set t_Co=8
  set t_Sb=[4%dm
  set t_Sf=[3%dm
  syntax on
endif


"" Screen and tmux

if &term=="screen"
  let &term="screen-256color" " use all available colors
  set ttymouse=xterm2         " full mouse capability
endif


"" MacVim GUI

if has("gui_running") && has("gui_macvim")
  " Special font for Vim DevIcon symbols
  set guifont=Knack\ Regular\ Nerd\ Font\ Complete:h12

  set transparency=3 " transparent, blurry bg
  set blurradius=15

  " maximize on fullscreen and make bg solid
  set fuoptions=maxvert,maxhorz,background:#FFE8E1CB
endif



""" Automatic Commands

if has("autocmd") && !exists("autocommands_loaded") " only run once
  let g:autocommands_loaded = 1

  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif

  " Treat notes in my notes directory as markdown, even though they're .txt
  autocmd BufNewFile,BufRead *Dropbox/Notes/*.txt
  \ if &ft =~# '^\%(conf\|modula2\)$' |
  \   set ft=markdown |
  \ else |
  \   setf markdown |
  \ endif

  " Delete fugitive buffers when you close them
  autocmd BufReadPost fugitive://* set bufhidden=delete

  " Run DetectIndent on file load
  autocmd FileType,BufReadPost * DetectIndent
endif



"""" Plugin settings


"" Filetype-plugin-specific settings

" Python
let g:python_highlight_all = 1
let g:python_version_2 = 1
let g:python_print_as_function = 1

" Perl
let g:perl_sync_dist = 2000 " look far back in perl files
let g:perl_extended_vars=1
let g:perl_include_pod = 1

" HTML
let g:html_extended_events=1

" JavaScript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
" let g:javascript_conceal_function       = '𝒇'
" let g:javascript_conceal_null           = '∅'
" let g:javascript_conceal_this           = '⬥'
" let g:javascript_conceal_return         = '↤'
" let g:javascript_conceal_undefined      = '⸮'
" let g:javascript_conceal_NaN            = '무'
" let g:javascript_conceal_prototype      = '¶'
" let g:javascript_conceal_static         = '◇'
" let g:javascript_conceal_super          = '𝝮'
" let g:javascript_conceal_arrow_function = '⇒'

" Solarized colorscheme

if !exists("g:vimrc_loaded") " only run once
  set background=light
  colorscheme solarized
  nmap <Leader>bg <Plug>ToggleBackground
end


"" Ag

let g:AgSmartCase=1

" Use ag as greppgrg as well
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
end



"" LaTeX-Suite

" IMPORTANT: grep skips displaying the file name if there is only one file.
" This confuses LaTeX-Suite
set grepprg=grep\ -nH\ $* " always show the filename


"" Man plugin

" We set MANPAGER in the shell externally Vim so we have to give it a trivial value
" inside Vim
let $MANPAGER='cat'
set keywordprg=:Man
let g:ft_man_open_mode = 'vert'
let g:ft_man_folding_enable = 1

"" ALE
let g:ale_sign_error = "\u00A0"        " better :sign interface symbols
let g:ale_sign_warning = "\u00A0"

let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['eslint'],
\ }

"" CSV

" Make the columns look good in solarized
highlight CSVColumnEven       term=NONE cterm=NONE ctermfg=12 ctermbg=NONE gui=NONE guibg=NONE
highlight CSVColumnOdd        term=NONE cterm=NONE ctermfg=12 ctermbg=7    gui=NONE
highlight CSVColumnHeaderEven term=bold cterm=bold ctermfg=12 ctermbg=NONE gui=bold guibg=NONE
highlight CSVColumnHeaderOdd  term=bold cterm=bold ctermfg=12 ctermbg=7    gui=bold


"" vim-table-mode

" ReST-style tables by default
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='


"" Slime for tmux

let g:slime_target = 'tmux'
let g:slime_paste_file = tempname()


"" Airline

let g:airline_mode_map = {
\   '__': '-',
\   'n':  'N',
\   'i':  'I',
\   'R':  'R',
\   'c':  'C',
\   'v':  'V',
\   'V':  'VL',
\   '': 'VB',
\   's':  'S',
\   'S':  'S',
\   '': 'S',
\ }
let g:airline_highlighting_cache = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.branch = ''
let g:airline_symbols.crypt = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.spell = ''
let g:airline_symbols.whitespace = '⬚'

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = "\u00A0"        " better :sign interface symbols
let g:airline#extensions#ale#warning_symbol = "\u00A0"
let g:airline#extensions#ale#open_lnum_symbol = '(L'
let g:airline#extensions#ale#close_lnum_symbol = ')'

let g:airline#extensions#branch#sha1_len = 5

let g:airline#extensions#csv#enabled = 1

let g:airline#extensions#ctrlp#show_adjacent_modes = 1

let g:airline#extensions#eclim#enabled = 0

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['', '▲', '']

let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = ''

let g:airline#extensions#quickfix#quickfix_text = 'Qfix'
let g:airline#extensions#quickfix#location_text = 'Loc'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#close_symbol = ''

let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#ycm#error_symbol = ' '
let g:airline#extensions#ycm#warning_symbol = ' '

"" CtrlP

let g:ctrlp_extensions = ['buffertag', 'mixed', 'quickfix', 'dir', 'line', 'ag']
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = {
\   'types': {
\      1: ['.git', 'git -C %s ls-files --cached --modified --others .'],
\      2: ['.hg', 'hg --cwd %s locate -I .'],
\   },
\   'fallback': 'find %s -type f -maxdepth 3',
\   'ignore': 1
\ }
let g:ctrlp_switch_buffer='Et'
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*\|.*\.tmp/.*' " MacOSX/Linux
let g:ctrlp_mruf_max = 10
let g:ctrlp_abbrev = {
\   'gmode': 't',
\   'abbrevs': [
\     {
\       'pattern': '^proj ',
\       'expanded': '@cd ~/Projects/',
\       'mode': 'pfrz',
\     },
\   ]
\ }

" Use ag in CtrlP as a fallback for listing files in ctrlp
if executable('ag')
  let g:ctrlp_user_command.fallback = 'ag %s -l --depth=3 --nocolor -g ""'
endif

"" TagList

let g:Tlist_Show_One_File = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Close_On_Select = 1
let g:Tlist_WinWidth = 35


"" NERDCommenter

let g:NERDSpaceDelims = 1 " add extra space around delimiters
let g:NERDTrimTrailingWhitespace = 1 " add extra space around delimiters
let g:NERDCompactSexyComs = 1 " compact sexy comments
let g:NERDCustomDelimiters = {
\   'html': { 'left': '<!--',  'right': '-->', 'leftAlt': '/*', 'rightAlt': '*/' },
\ }

"" NERDTree

let g:nerdtree_tabs_open_on_gui_startup = 0


"" easytags

let g:easytags_by_filetype = '~/.vim/tags/'
let g:easytags_async = 1
let g:easytags_on_cursorhold = 1
" XXX keep auto_highlight off: it's too slow and messes with YCM
let g:easytags_auto_highlight = 0
let g:easytags_syntax_keyword = 'auto'
let g:easytags_resolve_links = 1


"" YouCompleteMe

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1


"" UltiSnips

let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger = "<C-L>"
let g:UltiSnipsJumpForwardTrigger = "<C-J>"
let g:UltiSnipsJumpBackwardTrigger = "<C-K>"


"" Markdown

let g:vim_markdown_math=1
let g:vim_markdown_folding_disabled=1


"" Solarized

let g:solarized_menu=0


"" Vim-Eighties

let g:eighties_extra_width = 5
let g:eighties_bufname_additional_patterns = ['fugitiveblame']


"" vim-editorconfig

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


"" Rooter

let g:rooter_use_lcd = 1


"" GitGutter

let g:gitgutter_terminal_reports_focus = 0
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = '▲'
let g:gitgutter_sign_removed = '▂'
let g:gitgutter_sign_modified_removed = ''

highlight link GitGutterAdd DiffAdd
highlight link GitGutterDelete DiffDelete
highlight link GitGutterChange DiffChange
highlight GitGutterChangeDelete term=bold ctermfg=9 ctermbg=11 gui=bold guifg=#cb5b16 guibg=#eee8d5


"" DetectIndent

let g:detectindent_preferred_indent = 2
let g:detectindent_max_lines_to_analyse = 1024
let g:detectindent_min_indent = 2
let g:detectindent_max_indent = 8


"" JSX

let g:jsx_ext_required = 0



""" Custom shortcuts and keybindings


"" Split buffer vertically, like vsp

cnoreabbrev vsb vert sb
cnoreabbrev vsbn vert sbn
cnoreabbrev vsbN vert sbN
cnoreabbrev vsbp vert sbp
cnoreabbrev vsbr vert sbr
cnoreabbrev vsbf vert sbf
cnoreabbrev vsbl vert sbl
cnoreabbrev vsun vert sun
cnoreabbrev vsba vert sba


"" Fugitive

nnoremap <silent> <Leader>gc :Gcommit --verbose<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gd :Gvdiff<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
nnoremap <silent> <Leader>gr :Gread<CR>


"" Airline

nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9
nmap <Leader>- <Plug>AirlineSelectPrevTab
nmap <Leader>+ <Plug>AirlineSelectNextTab


"" LastTab

nmap <Leader>` <Plug>LastTabLastUsedTab
nmap g^        <Plug>LastTabLastUsedTab
nmap <Leader>~ <Plug>LastTabLastUsedBuffer
nmap <Leader>W :tabclose<CR>

"" Call plugins

nnoremap <silent> <Leader>nt :NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>tl :TlistToggle<CR>
if v:version >= 703
  nnoremap <silent> <Leader>gu :GundoToggle<CR>
endif

" CtrlP
nnoremap <silent> <Leader>q :CtrlPQuickfix<CR>
nnoremap <silent> <Leader>g :CtrlPTag<CR>
nnoremap <silent> <Leader>t :CtrlPBufTagAll<CR>

nnoremap <silent> <C-f>      :CtrlPag<CR>
vnoremap <silent> <C-f>      :CtrlPagVisual<CR>
nnoremap          <Leader>ll :CtrlPagLocate<Space>
nnoremap <silent> <Leader>lp :CtrlPagPrevious<CR>

" Tabularize
vnoremap <silent> <Leader>tp :Tabularize ellipses<CR>
vnoremap <silent> <Leader>tc :Tabularize comma<CR>

" YAPF
map <C-Y> :call yapf#YAPF()<cr>
imap <C-Y> <c-o>:call yapf#YAPF()<cr>


"" Common actions
nnoremap <silent> <Leader>n :silent :nohlsearch<CR> " turn off highlighting
nnoremap <silent> <Leader>w :set nowrap!<CR>        " word wrapping
nnoremap <silent> <Leader>s :set nolist!<CR>        " show hidden chars
nnoremap <silent> <Leader>f :set columns=400<CR>    " full screen full-width
nnoremap <silent> <Leader>m :Make<CR>               " run :Make
nnoremap <silent> <Leader>bd :bufdo diffoff<CR>     " diff off for all buffers

nnoremap <silent> <Leader>! :!"%:p"<CR>             " execute current file in shell

nnoremap <silent> <Leader>erc :vsp $MYVIMRC<CR>      " .vimrc edits
nnoremap <silent> <Leader>src :source $MYVIMRC<CR>

" Toggle expand-tab for a region
vnoremap <silent> <Leader>tt :<C-u>set et! <Bar> '<,'> retab! <Bar> set et!<CR>

" Paste directly from the clipboard in insert mode
if v:version >= 703
  imap <Leader>v  <C-o>:set paste<CR><C-r>*<C-o>:set nopaste<CR>
endif


"" Functions and macros

" Work with (search for and replace) selected text
vnoremap <C-h> ""y:%s/<C-r>=escape(@", '/\')<CR>//gc<Left><Left><Left>

" Toggle relative/normal numbering
function! ToggleRelNum()
  if &number
    if v:version >= 702
      if &relativenumber
        setlocal norelativenumber
      else
        setlocal relativenumber
      endif
    else
      setlocal nonumber
    endif
  else
    setlocal number
  endif
endfunction

nnoremap <silent> <Leader>r :call ToggleRelNum()<CR>

" Toggle conceal level
" default to non-concealed
function! ToggleConceal()
  if &conceallevel > 0
    setlocal conceallevel=0
  else
    setlocal conceallevel=1
  endif
endfunction

nnoremap <silent> <Leader>c :call ToggleConceal()<CR>


"" Set flag allowing content to only run once

let g:vimrc_loaded = 1
" vim: sw=2 sts=2 ts=2 et
"
