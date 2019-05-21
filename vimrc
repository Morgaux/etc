" enable syntax
syntax on

" misc options
set belloff=all
set showcmd
set nohlsearch
set nu
set ruler
set report=1
set nowrap

" prevent annoying hilights
let loaded_matchparen = 1

set t_Co=256

" Needed for st!
set nocompatible
if &term =~ "st"
	set t_Co=16
endif

set showtabline=2
set laststatus=2
set ignorecase

" Tabs must be eight wide!!!
set tabstop=8 softtabstop=0 shiftwidth=8 noexpandtab
autocmd Filetype python setlocal tabstop=8 softtabstop=0 shiftwidth=8 noexpandtab
autocmd Filetype scala setlocal tabstop=8 softtabstop=0 shiftwidth=8 noexpandtab
autocmd Filetype java setlocal tabstop=8 softtabstop=0 shiftwidth=8 noexpandtab

" Show tabs as commented dots
set list
set listchars=tab:..
match Comment /\t/

" Catch whitespace errors
match Error /\s\+$\| \+\ze\t/
au InsertEnter * redraw!
au InsertLeave * redraw!

colo juvenile

" colors are nice sometimes, this is basically solarized
autocmd Filetype java colo flattened_dark
autocmd Filetype python colo flattened_dark
autocmd Filetype scala colo flattened_dark

" No line numbers if the term is too narrow for 80 chars
if &columns < 85
	set nonu
endif



"
" Stuff I've shamelessly stolen
"



"
" http://github.com/jcs/dotfiles
" Author: joshua stein
" License: none
"
" Don't pollute directories with swap files, keep them in one place
silent !mkdir -p ~/.vim/{backup,swp}/
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
" ...except crontab, which will complain that it can't see any changes
au FileType crontab setlocal bkc=yes


