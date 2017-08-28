set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'chrisbra/csv.vim'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
" Plugin 'wikitopian/hardmode'
Plugin 'Chiel92/vim-autoformat'
" Plugin 'mhinz/vim-hugefile'
" Plugin 'itchyny/lightline.vim'
Plugin 'LargeFile'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
noremap <Up> ddkP
vnoremap <UP> xkP`[V`]
noremap <Down> ddjP
vnoremap <DOWN> xp`[V`]
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap jj <Esc>

syntax on
color desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set number
set relativenumber
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
set clipboard=unnamedplus

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>

"Show hidden files in NerdTree
let NERDTreeShowHidden=0

"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

set tabstop=2

set autochdir
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" For regular expressions turn magic on
set magic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "quits nerdtree if nerdtree is the only last window open

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


let loaded_netrwPlugin = 1

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" Treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk
vmap j gj
vmap k gk

set wildmenu
set lazyredraw

 " Load solarized as the default color scheme
    if filereadable(expand("$HOME/.dotfiles/vim/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        set t_Co=256 " enable 256 colors
        set background=dark
        let g:solarized_termcolors=16
        if !has('gui_running')
            let g:solarized_termtrans=1
        endif
        colorscheme solarized

        " Fix background color for vim-gitgutter
        highlight SignColumn ctermbg=NONE
endif

let g:airline_theme='molokai'
set laststatus=2
let g:airline_powerline_fonts = 1


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Python make Code look Pretty:
let python_highlight_all=1

" Recommendede Settings for syntastic - see: https://github.com/vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
