" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible
set nocompatible  " Vundle
filetype off      " Vundle

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
" if has("syntax")
"   syntax on
" endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
" if has("autocmd")
"   filetype plugin indent on
" endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" ------------------- Begin Custom configurations ----------------------------
set number
set backspace=2
set showmode
set nobackup
set nowritebackup

" set encoding
set encoding=utf-8

" Keep cursor 8 lines from the top 
" and 8 lines from the bottom
set scrolloff=8

" Column width highlighting
" Uses 68 to handle tmux horizontal splitting
" highlight Overlength ctermbg=darkred ctermfg=white guibg=#592929
highlight Overlength ctermbg=DarkRed ctermfg=white guibg=DarkRed
match Overlength /\%\>67v.\+/
highlight ColorColumn ctermbg=DarkRed
set colorcolumn=68

" Vundle specific configurations
" All config here taken from
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/#vim-extensions
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/vim-nerdtree-tabs'
Plugin 'Lokaltog/powerline', {'rtp' : 'powerline/bindings/vim/'}
" Plugin 'kien/ctrlp.vim' " Find any files and tags

Bundle 'Valloric/YouCompleteMe'

call vundle#end()

" Always display powerline status bar
set laststatus=2

filetype plugin indent on

" Split screen directions
set splitbelow
set splitright

" Split navigation
" <Shift-j, k, l, or h>
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>

" Enable code folding
set foldmethod=indent
set foldlevel=99
" Map fold/unfold to space
nnoremap <space> za

" Configuration fo SimplyFold specifically python
let g:SimplyFold_docstring_preview=1

" Python Indentation according to PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4
"    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=78
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" For full stack development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
"    \ set softtabstop=2
    \ set shiftwidth=2

" Flagging whitespaces for later removal
" au BufRead,BufNewFile *.py, *pyw, *.c, *.h match BadWhitespace /\s\+$/

" UTF-8 support
set encoding=utf-8

" YouCompleteMe specific configurations
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__ = activate_this))
EOF

" Prettify python code
let python_highlight_all=1
syntax on

" Define which scheme to use based on vim mode
" TODO: uncomment when zenburn and solarized are installed
" if has('gui_running')
"   set background=dark
"   colorscheme solarized
" else
"   colorscheme zenburn
" endif

" Toggle between dark and light themes 
" TODO: uncomment when Zenburn and
" vim-colors-solarized is installed
" call togglebg#map('<F5>')

" Hide *.pyc and files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" NERDTree Toggling
" noremap <C-E> :NERDTree<CR>
noremap <C-D> :NERDTreeToggle<CR>
" noremap <C-C> :NERDTreeClose<CR>

" Re-style split screen borders
set fillchars+=vert:\ 
" set foldcolumn=2
" hi foldcolumn guibg=bg
" hi LineNr guibg=bg
hi VertSplit guibg=bg guifg=fg


" -------------------- End Custom configurations ----------------------------
