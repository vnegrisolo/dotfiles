syntax on

" Solarized
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" Just the encoding
set encoding=utf-8
set termencoding=utf-8

" Reload files edited outside the vim
set autoread

" Relative line numbers
set relativenumber

" When split tabs do it on right and below sides
set splitright
set splitbelow

" Command line
set history=1000
set cmdheight=2

" Show the current line and column position
set ruler

" Search Mode
set ignorecase
set smartcase
set hlsearch
set incsearch
nmap <silent> // :nohlsearch<CR>

" No vim swap or backup
set noswapfile
set nobackup
set nowb

" Persistent undo
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set nowrap
set linebreak

" Completion
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
