execute pathogen#infect()

syntax enable
filetype plugin indent on

" Line number improvements
set number
set rnu
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
set cursorline

" Make netrw better
let g:netrw_browse_split = 2
let g:netrw_winsize = 25
let g:netrw_liststyle = 3

" Colorscheme settings
set background=dark
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='dark'
let g:gruvbox_hls_cursor='blue'
colorscheme gruvbox

" Standardize indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent

" Better search
set incsearch

" Allow folding
set incsearch
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" Make finding files more useful
set wildmenu
set wildmode=list:longest,full
set wildignore+=**/virtualenv_run/**,*.pyc,*.pyo,__pycache__
set path=$PWD/**

" Allow moving by wrapping
:noremap <Up> gk
:noremap! <Up> <C-O>gk
:noremap <Down> gj
:noremap! <Down> <C-O>gj

" Better tags (This requires Exuberant Ctags)
set tag=./tags;
if !executable('ctags')
    let g:gutentags_dont_load = 1
endif
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_ctags_exclude = [
      \ '*.svg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

" ---- Functions ----

" Magically copy yank buffer to system clipboard with Osc52
" Only works in iTerm2 - make sure to enable clipboard access
function! Osc52Yank()
  let buffer=system('base64 -w0', @0)
  let buffer=substitute(buffer, "\n$", "", "")
  let buffer='\e]52;c;'.buffer.'\x07'
  if $TMUX != ''
    let buffer='\ePtmux;\e'.buffer.'\e\\'
  endif
  silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape("/dev/tty")
endfunction
command! Osc52CopyYank call Osc52Yank()
nnoremap <leader>y :Osc52CopyYank<cr>:redr!<cr>

" Make vim automatically set paste/nopaste when pasting stuff
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
