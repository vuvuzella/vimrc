set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" _vimrc premade settings
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" My custom settings
color torte
set number
" The following settings were from derekwyatt.com/vim/the-vimrc-file/*
" filetype stuff
filetype on
filetype plugin on
filetype indent on
" syntax highlighting
syntax on
" not sure what this is
set hidden
" Don't update the display when executing the macros
set lazyredraw
" let me know what mode I'm in
set showmode
" enhanced command-line completion
set wildmenu
" When page starts to scroll , keep the cursor 8 lines from 
" the top and 8 lines from the bottom
set scrolloff=8
" shiftwidth and softtabstop settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" indentation settings
set autoindent
" set smartindent
" column width highlighting
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%\>78v.\+/
set colorcolumn=78
" set font face
" Begin
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
" End
" Set visualbell to do nothing
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" Set maximized window on open
if has ("gui_running")
    "GUI is running
    set lines=50 columns=100
    autocmd GUIEnter * simalt ~x
else
    " Console vim
    if exists ("+lines")
	set lines=50
    endif
    if exists ("+columns")
	set columns=100
    endif
endif
" set guioptions to be hidden
set guioptions=acg
" unset the showcmd
set showcmd
" enable search highlighting
set hlsearch
" incrementally match the search
set incsearch
" cd into the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
if has ("gui_win32")
  nmap <silent> ,md :!mkdir "%:p:h"<CR>
else
 " nmap <silent> ,md :!mkdir -p %:p:h<CR>
endif
" Do not write backup files everytime vim opens the file.
set nobackup
set nowritebackup
" Maintains the highlight settings when a new file is opened in BufNew/Create
" Autocmd BufRead,BufAdd,BufEnter * match OverLength /\%\>78v.\+/
" Autocmd BufRead,BufAdd,BufEnter * highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
" Autocmd BufRead,BufAdd,BufEnter * highlight ColorColumn guibg=red ctermbg=red
autocmd VimEnter * autocmd WinEnter * let w:created=1
autocmd WinEnter * if !exists('w:created') | match OverLength /\%\>78v.\+/ | endif 
" Turn off highlight on search
nmap <silent> ,n :nohls<CR>
"set fileencodings=utf8,iso-2022-jp,euc-jp,cp932,default.latin1
set fileencodings=iso-2022-jp,euc-jp,cp932,default.latin1
"set listchars=tab:>-,trail:.,eol:$,extends:>,precedes:<,nbsp:_
"set listchars=...

"PTMGW Specific font settings
set gfn=MS_Gothic:h14:cANSI
set enc=utf8
set fenc=utf8
set tenc=utf8
