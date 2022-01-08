" enable syntax highlighting
syntax enable
filetype plugin indent on

nnoremap <SPACE> <NOP>
let mapleader = " "

set noerrorbells
set belloff=all

" Give more space for displaying messages
set cmdheight=2

" treat all numerals as decimals regardless of leading 0's. Helpful with <C-a>
" type commands
set nrformats=

" set relativenumber
set hlsearch
set spell
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set clipboard=unnamed                                        " yank and paste with the system clipboard
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=4                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=4                                            " insert mode tab and backspace use 2 spaces
set tabstop=4                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

set noswapfile

set undodir=$VIMDATA/undodir
set undofile

set termguicolors
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey
set history=200                                              " increase history buffer.

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif


" PLUGINS
call plug#begin('$VIMCONFIG/plugged')
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim'
Plug 'flazz/vim-colorschemes'
Plug 'preservim/nerdcommenter'
call plug#end()

" set onedark overrides. Must be placed before setting colorscheme.
let g:onedark_color_overrides = {
  \ "black": {"gui": "#1C2224", "cterm": "233", "cterm16": "0" },
  \ "white": {"gui": "#DEEFEE", "cterm": "233", "cterm16": "0" },
  \ "red": {"gui": "#36F57D", "cterm": "233", "cterm16": "0" },
  \ "dark_yellow": {"gui": "#DD760A", "cterm": "233", "cterm16": "0" },
  \ "yellow": {"gui": "#DBDD0A", "cterm": "233", "cterm16": "0" },
  \ "comment_grey": {"gui": "#95BAA9", "cterm": "233", "cterm16": "0" },
\}
colorscheme onedark
