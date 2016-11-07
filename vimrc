" .vimrc file
" Maintainer: Mikhail Wolfson <mywolfson@gmail.com>
" Last Change:  2015-04-09

scriptencoding utf-8

""" Device-independent settings


"" Basics

" Use Vim defaults, rather than Vi-compatible ones
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


"" Convenience features to enable, courtesy of Steven Bach

set hidden                   " deal with hidden buffers effectively
set wildchar=<TAB>           " do more reasonable, bash-like filename completion
set wildmenu
set wildmode=longest:full

set completeopt=menu,preview " set richer UI options for the completion window

set ignorecase               " ignore case in search
set smartcase                " unless I have varying cases in my search terms

set title                    " in terminals, set the title of the terminal

set scrolloff=3              " scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set shortmess=at             " shorten messages
set visualbell               " visual bell
set report=0                 " aggressive reporting


"" Custom special charascters
set listchars=tab:▶—,trail:_,eol:¬,extends:»,precedes:« " hidden characters
set showbreak=»                                         " line wraps


"" Encoding settings

set encoding=utf-8
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set fileencodings=utf-8,latin1
endif


"" Backups

set bdir=~/.vim/bak,~/.tmp,/tmp " organize backups in one place



""" Plugins


"" Core filetype plugins
filetype off
filetype plugin indent on
runtime ftplugin/man.vim " man plugin must be run on its own to get :Man
syntax enable

"" Load plugins (run by vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'django.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/ag'
Plug 'fs111/pydoc.vim'
Plug 'godlygeek/tabular'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'hdima/python-syntax'
Plug 'honza/vim-snippets'
Plug 'jmcantrell/vim-virtualenv'
Plug 'justincampbell/vim-eighties'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'lazywei/vim-matlab'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'matchit.zip'
Plug 'mlint.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'noc7c9/vim-iced-coffee-script'
Plug 'nelstrom/vim-visual-star-search'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Shougo/vinarise.vim'
Plug 'SirVer/ultisnips'
Plug 'sjl/gundo.vim'
Plug 'SmartCase'
Plug 'taglist.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-latex/vim-latex'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'zaiste/tmux.vim'

"" Personal plugins
Plug '~/.vim/plugged_custom/personal'
Plug '~/.vim/plugged_custom/ginkgo'

call plug#end()



""" Capability or device-dependent settings


if !exists("g:vimrc_loaded") " only run once


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
    if v:version >= 703
      set colorcolumn=80
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


  "" GUI output

  if has("gui_running")
    set columns=165      " set default window size
    set lines=50
    set winaltkeys=no    " kill windows altkeys in for TeX Macros
    set guioptions-=T    " autohide toolbar
    set antialias        " smooth fonts by default

    " Mac GUI output
    if has("gui_macvim")
      " set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h12
      set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
      set transparency=1 " allow transparent bg
    endif
  endif


  """ Mouse functionality in terminal
  if !has("gui_running")
    set mouse=a          " most functional mouse mode when in a terminal
  endif
end


"" Automatic Commands

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

  " Check *.jsx files with JSXhint by default
  autocmd BufNewFile,BufRead *.jsx let b:syntastic_checkers = ['jsxhint']

  " Delete fugitive buffers when you close them
  autocmd BufReadPost fugitive://* set bufhidden=delete

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
  call togglebg#map("<leader>bg")
end


"" LaTeX-Suite

" IMPORTANT: grep skips displaying the file name if there is only one file.
" This confuses LaTeX-Suite
set grepprg=grep\ -nH\ $* " always show the filename


"" Syntastic

let g:syntastic_enable_signs=1             " use the sidebar for signs
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=2

let g:syntastic_error_symbol = ''        " better :sign interface symbols
let g:syntastic_warning_symbol = ''
let g:syntastic_style_error_symbol = 's◆'
let g:syntastic_style_warning_symbol = 's◇'

let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_polymerhtml_checkers = ['gulplint']
" let g:syntastic_python_checkers = ['flake8', 'pylint']

"" CSV

" Make the columns look good in solarized
hi CSVColumnEven       term=NONE cterm=NONE ctermfg=12 ctermbg=NONE gui=NONE guibg=NONE
hi CSVColumnOdd        term=NONE cterm=NONE ctermfg=12 ctermbg=7    gui=NONE
hi CSVColumnHeaderEven term=bold cterm=bold ctermfg=12 ctermbg=NONE gui=bold guibg=NONE
hi CSVColumnHeaderOdd  term=bold cterm=bold ctermfg=12 ctermbg=7    gui=bold


"" Slime for tmux

let g:slime_target = 'tmux'
let g:slime_paste_file = tempname()


"" Airline

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number


"" CtrlP

let g:ctrlp_extensions = ['buffertag', 'mix', 'quickfix', 'dir', 'line']
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'git -C %s ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'find %s -type f'
\ }


"" TagList

let g:Tlist_Show_One_File = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Close_On_Select = 1
let g:Tlist_WinWidth = 35


"" NERDCommenter

let g:NERDSpaceDelims = 1 " add extra space around delimiters


"" easytags

let g:easytags_by_filetype = '~/.vim/tags'
let g:easytags_async = 1
let g:easytags_on_cursorhold = 1
let g:easytags_auto_highlight = 0
let g:easytags_syntax_keyword = 'always'


"" YouCompleteMe

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1


"" UltiSnips

let g:UltiSnipsExpandTrigger="<C-L>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"


"" Markdown

let g:vim_markdown_math=1
let g:vim_markdown_folding_disabled=1


"" Solarized

let g:solarized_menu=0

"" Vim-Eighties
let g:eighties_extra_width = 5
let g:eighties_bufname_additional_patterns = ['fugitiveblame']


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

nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gd :Gvdiff<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
nnoremap <silent> <Leader>gr :Gread<CR>


"" Call plugins

nnoremap <silent> <Leader>nt :NERDTreeToggle %:p:h<CR>
nnoremap <silent> <Leader>tl :TlistToggle<CR>
if v:version >= 703
  nnoremap <silent> <Leader>gu :GundoToggle<CR>
endif

nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <Leader>q :CtrlPQuickfix<CR>
nnoremap <silent> <Leader>t :CtrlPBufTagAll<CR>

" Tabularize
vnoremap <silent> <Leader>tp :Tabularize ellipses<CR>
vnoremap <silent> <Leader>tc :Tabularize comma<CR>


"" Common actions
nnoremap <silent> <Leader>n :silent :nohlsearch<CR> " turn off highlighting
nnoremap <silent> <Leader>w :set nowrap!<CR>        " word wrapping
nnoremap <silent> <Leader>s :set nolist!<CR>        " show hidden chars
nnoremap <silent> <Leader>f :set columns=400<CR>    " full screen full-width
nnoremap <silent> <Leader>m :Make<CR>               " run :Make
nnoremap <silent> <Leader>bd :bufdo diffoff<CR>     " diff off for all buffers

nnoremap <silent> <Leader>erc :sp $MYVIMRC<CR>      " .vimrc edits
nnoremap <silent> <Leader>src :so $MYVIMRC<CR>

" Toggle expand-tab for a region
vnoremap <silent> <Leader>tt :<C-U>set et! <Bar> '<,'> retab! <Bar> set et!<CR>

" Paste directly from the clipboard in insert mode
if v:version >= 703
  imap <Leader>v  <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>
endif

"" Functions and macros

" Work with (search for and replace) selected text
vnoremap <C-h> ""y:%s/<C-R>=escape(@", '/\')<CR>//gc<Left><Left><Left>

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
