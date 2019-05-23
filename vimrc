"
" https://gitlab.com/morgaux/etc
" Author:	Morgaux Meyer
" License:	MIT (C) Morgaux Meyer
"

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
set nocompatible
set showtabline=2
set laststatus=2
set ignorecase



""
" Colors and highlighting
""

set t_Co=256

" prevent annoying paren matching
let loaded_matchparen = 1

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

" Ruler at 80, hard limit 120
let &colorcolumn="80,".join(range(120,999),",")

" Highlight curentline
set cursorline

colo flattened_dark

" No line numbers if the term is too narrow for 80 chars
if &columns < 85
	set nonu
endif



""
" Stuff I've shamelessly stolen
""

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

