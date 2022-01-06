""""""""""""""""""""""""""""""
""" TODO: remove this file """
""""""""""""""""""""""""""""""

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
" maybe I do want a backup? 
" set nobackup

set undodir=~/.vim/undodir
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

" use jj to escape
" inoremap jj <ESC>

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdcommenter'
" used by rust.vim
" https://github.com/preservim/tagbar

" take bits from vim-unimpaired
" https://github.com/tpope/vim-unimpaired

" consider this to go with netrw : https://github.com/tpope/vim-vinegar
" consider abolish for fancy word swapping/substitution/subverting 
"     https://github.com/tpope/vim-abolish
call plug#end()

" set background=dark
" colorscheme gruvbox
" colorscheme 3dglasses
" no need to set termcolors when vim is configured to use 24 bit color.
" let g:onedark_termcolors=256

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

" Can use onedark airline theme if you also install lightline
let g:airline_theme='onedark'

" netrw settings: https://shapeshed.com/vim-netrw/
let g:netrw_browse_split = 2
let g:netrw_banner = 0
" winsize doesn't work as expected
"let g:netrw_winsize = 25
let g:netrw_liststyle = 3
nnoremap <C-n> :Explore<CR>

" FZF mapping
nnoremap <C-p> :<C-u>FZF<CR>

" YCM The best part
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" auto close YCM preview window
let g:ycm_autoclose_preview_window_after_completion = 1

" only show popup when toggled manually
let g:ycm_auto_hover=''
nmap <leader>j <plug>(YCMHover)

" Nerd comment toggle comment
nmap <leader>k <plug>NERDCommenterToggle<CR>k
vmap <leader>k <plug>NERDCommenterToggle<CR>k

" Undotree with F5
nnoremap <F5> :UndotreeToggle<CR>

" ALE config
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Word count
nnoremap <silent> <Leader>wc :w !wc<CR>

" Set textwidth to 100 command
nnoremap <Leader>tw :set textwidth=100<CR>

" Mute highlighting for this search only
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Consider plugin for operating on last pattern match
" https://github.com/kana/vim-textobj-lastpat

" Count number of matches for current pattern
nnoremap <silent> <Leader>pc :<C-u>%s///gn<CR>

" Add entry for %% to expand the path of the active buffer.
" :% will expand but includes the current file.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"""" Other useful commands """"
" make a directory from an unsaved buffer where directory does not exist
" :!mkdir -p %:h

" Save and Cargo Run.
nnoremap <buffer><silent><leader>n :w<CR> :!clear; cargo run<CR>

" Search for current selection (overcomes limitations with special characters)
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

" nvim terminal mode mappings
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>

  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=pink guifg=white ctermbg=1 ctermfg=15
endif

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
