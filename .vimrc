execute pathogen#infect()

syntax enable
filetype plugin indent on
set number
set rnu
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
set cursorline

set background=dark
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='dark'
let g:gruvbox_hls_cursor='blue'
colorscheme gruvbox

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent

set incsearch

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

set wildmenu
set wildmode=list:longest,full
set wildignore+=**/virtualenv_run/**,*.pyc,*.pyo,__pycache__
set path=$PWD/**
