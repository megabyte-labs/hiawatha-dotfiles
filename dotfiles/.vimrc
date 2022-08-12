" Use Vim settings, rather then Vi settings
set nocompatible

" Set utf8 as standard encoding
set encoding=utf-8

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Use one space, not two, after punctuation.
set nojoinspaces

" No sounds
set visualbell
" Disable error bells
set noerrorbells

" Reload files changed outside vim
set autoread

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Make it obvious where 120 characters is
set textwidth=120
set colorcolumn=+1

" Respect modeline in files
set modeline
set modelines=4
" Enable line numbers
set number
" Enable syntax highlighting
syntax enable
" Highlight current line
set cursorline
" Configure indentation
set tabstop=2
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Allow Shift+Insert to paste
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Split right and below
set splitbelow
set splitright

" Turn on the Wild menu
set wildmenu

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Wrap
set nowrap
set linebreak

" Folds
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
set smartcase

" Always show status line
set laststatus=2

" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

" Scrolling
set scrolloff=5
set sidescrolloff=15
set sidescroll=1

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Security
set modelines=0
set nomodeline

" Map auto complete of (, ", ', [
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>

inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
