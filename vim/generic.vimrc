" Set encoding
scriptencoding utf-8

" Misc stuff, check the commit history if you care about the rationale
set ambiwidth=double
set belloff=all
set showcmd
set nohlsearch
set nu
set ruler
set report=1
set nocompatible
set showtabline=2
set laststatus=2
set ignorecase
set smartindent
set backspace=indent,eol,start
set incsearch
set wildmenu
set mouse=a
set mousemodel=popup
set mouseshape=a:beam
set textwidth=80
set colorcolumn=+1
set foldmethod=marker
set whichwrap=b,s,<,>,[,]
set conceallevel=2
set updatetime=100

" use custom settings for files with special settings
set modeline modelines=5

" wrap lines that are longer than the terminal window
set wrap linebreak nolist

" Tabs must be eight wide!!!
set tabstop=8 softtabstop=0 shiftwidth=8 noexpandtab

" No line numbers if the term is too narrow for 80 chars
if &columns < 85
	set nonu
endif

