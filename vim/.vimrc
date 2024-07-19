set number
highlight LineNr ctermfg=grey
set ruler
set showmode
set scrolloff=16

syntax on
filetype on

set autoindent expandtab tabstop=2 shiftwidth=2
set clipboard+=unnamedplus

set incsearch
set showmatch
set ignorecase
set smartcase
set wrapscan

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=64000
endif
