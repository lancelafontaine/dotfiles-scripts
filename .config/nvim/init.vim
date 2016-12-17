"-----------------"
" NEOVIM-SPECIFIC "
"-----------------"

"Uses true colors of terminal
set termguicolors

"Sets cursor to pipe in insert, block in normal
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Define paths to Python interpreters
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

"------------------"
" GENERAL SETTINGS "
"------------------"

" Uses vim (not vi) settings. Set file encoding.
set nocompatible
set fileencoding=utf-8
set encoding=utf-8

" No code folding
set nofoldenable

"Disables the creation of swapfiles.
set nobackup
set noswapfile

"Places swap file in /tmp
set dir=/tmp
" Turns on syntax highlighting, and filetype, indentation and plugin detection.
syntax on
filetype on
filetype indent on
filetype plugin on

" Use an undo file for persistent undo's
set undofile
" set a directory to store the undo history
set undodir=/home/lancelafontaine/.vimundo/

call plug#begin('~/.config/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'dracula/vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'less', 'scss']}
Plug 'skammer/vim-css-color', {'for': ['css', 'less', 'scss']}
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript', {'for': ['js']}
"Plug 'maksimr/vim-jsbeautify'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/MatchTagAlways'
Plug 'mileszs/ack.vim'
Plug 'alvan/vim-closetag'

" Add plugins to &runtimepath
call plug#end()

"----------
" MAPPINGS "
"----------"

" Redefines mapleader key as , instead of /.
let mapleader = ","

" Allows for easier exit from insert mode.
imap jk <Esc>

" Enters new lines without entering insert mode.
nmap oo o<Esc>k
nmap OO O<Esc>j

" Allows entering spaces in normal mode.
nnoremap <space> i<space><esc>

" list all buffers to change
nnoremap <leader>b :ls<CR>:b<Space>

nnoremap <leader>f :Ack<Space>

"-------------------"
" EDITS AND INDENTS "
"-------------------"

"Automatically does smart indentation.
set autoindent

" Convert tabs to spaces in insert and normal mode. Equivalence to 4 spaces.
set expandtab
set shiftwidth=2
set softtabstop=2

" No backspace restrictions in insert mode.
set backspace=indent,eol,start

"---------"
" VISUALS "
"---------"

" Shows relative numbers in gutter.
set number
set relativenumber

" Shows matching bracket when cursor is over a bracket.
set showmatch

" ALWAYS display status bar.
set laststatus=2

" Sets the colorscheme.
colorscheme dracula

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
"--------"
" SEARCH "
"--------"
" Incremental search by default. Highlights results.
" Uses smart case sensitivity.
set incsearch
set smartcase

" Applies search and replace to all occurences in a file.
set gdefault

"-----------------"
" SYNTAX COLORING "
"-----------------"

"au BufNewFile,BufRead *.ejs set filetype=html


"---------"
" PLUGINS "
"---------"

"""NERDTree
" Auto launches NERDTree on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Show hidden files by default
let NERDTreeShowHidden=1
" Closes NERDTree after opening file
let NERDTreeQuitOnOpen = 1
" Ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

""" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-l>'
let g:multi_cursor_skip_key='<C-a>'
let g:multi_cursor_quit_key='<Esc>'

""" YouCompleteMe
""" You should install this with ./install.py --clang-complete --system-libclang
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

""" vim-airline
let g:airline#extensions#bufferline#enabled=2
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'

""" vim-gitgutter
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

""" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_cmd = 'CtrlPMixed'

""" delimitMate
" Prevent from loading in HTML files, use vim-closetag instead.
au FileType html let b:delimitMate_autoclose = 0
let g:delimitMate_expand_cr = 1

""" Ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

