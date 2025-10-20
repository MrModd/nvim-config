" ------------------------------
" -- Generic Vim configurations -
" ------------------------------

set encoding=utf-8
" Line numbers
set ruler
set number
" Use more prompt when listing options that take the full screen
set more
" Watch for file changes
set autoread
" Keep abandoned buffers in memory
set hidden
" Automatically write when changing buffer
set autowrite
" Don't redraw when not needed
set lazyredraw
" Show current mode and pending command
set showmode
set showcmd
" Vim, not vi
set nocompatible
" Indentation
set autoindent
set smartindent
" Always use spaces instead of tabs
"set expandtab
" (alternative) convert spaces to tabs when possible
set nosmarttab noexpandtab
" How many columns a tab character is
set tabstop=4
" How many spaces a shift or backspace key inserts or removes
set softtabstop=2
" How many columns a >> operation adds
set shiftwidth=4
" Increase history of last commands
set history=200
" Increase undo buffer
set undolevels=1000
set updatecount=100
" Allow backspace to delete indent, end of lines and start of insert
set backspace=indent,eol,start
" Break too long lines on end of words characters
set linebreak
" Don't wrap lines when they are too long (makes previous command useless)
set nowrap
" Open the new splts on the right and below
set splitbelow
set splitright
" Be smart when searching in the file
set ignorecase
set smartcase
" Fold blocks delimited by {{{ and }}}
set foldmethod=marker
" Allow usage of the mouse
set mouse=a
" Use the system clipboard as buffer for yank (on ssh it requires X forwarding)
" It also requires +clipboard on Vim
set clipboard+=unnamedplus
" Invisible characters configurations (eg. trailing spaces and tabs)
set listchars=tab:▸\ ,eol:¬,trail:·
set list
" Set leader character (used in some keybindings)
let mapleader = ' '
" Reduce update time to 100ms to be more reactive
set updatetime=100

" -------------------------
" -- General keybindings --
" -------------------------

" Show/hide invisible characters
nnoremap <F3> :set list!<bar>set number!<CR>
" Effequattro, basito (cit.)
nnoremap <F4> aBasito<Esc>
" Search-highlight word under cursor without moving the cursor
nnoremap <silent> <F5> :let @/ = expand('<cword>')<bar>set hlsearch<CR>
" Move one window of the split to a new tab
nnoremap <F6> <C-w>T
" Jump list back (like your mapping)
nnoremap <C-o> :pop<CR>
" Open a new tab
nnoremap <C-t> :tabnew<CR>
" Go to tab on the left
nnoremap <C-Left> gT
" Go to tab on the right
nnoremap <C-Right> gt
" Go to split on the left
nnoremap <C-h> <C-w>h
" Go to split on the bottom
nnoremap <C-j> <C-w>j
" Go to split on the top
nnoremap <C-k> <C-w>k
" Go to split on the right
nnoremap <C-l> <C-w>l
