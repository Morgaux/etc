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

"
" juvenile.vim -- Show comments in grey if colour available, in defiance of
" Commander Pike, but nothing else, in deference to Commander Pike.
"
" <https://groups.google.com/forum/#!msg/golang-nuts/hJHCAaiL0so/kG3BHV6QFfIJ>
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
" License: Same as Vim itself
"
set background=dark
if v:version > 580
	highlight clear
	if exists('syntax_on')
		syntax reset
	endif
endif
let colors_name = 'juvenile'

if has('gui_running') || &t_Co >= 256
	hi Normal	cterm=NONE ctermfg=NONE	ctermbg=NONE gui=NONE guifg=#fcfcfc guibg=#030303
	hi Comment	cterm=NONE ctermfg=246	ctermbg=NONE gui=NONE guifg=#a0a0a0 guibg=NONE
	hi NonText	cterm=NONE ctermfg=246	ctermbg=NONE gui=NONE guifg=#a0a0a0 guibg=NONE
elseif &t_Co >= 8
	hi Normal	cterm=NONE ctermfg=NONE ctermbg=NONE
	hi Comment	cterm=bold ctermfg=0 ctermbg=NONE
	hi NonText	cterm=bold ctermfg=0 ctermbg=NONE
else
	hi Normal	cterm=NONE ctermfg=NONE ctermbg=NONE
	hi Comment	cterm=NONE ctermfg=NONE ctermbg=NONE
	hi NonText	cterm=NONE ctermfg=NONE ctermbg=NONE
endif

hi Constant	cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Identifier	cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Function	cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Statement	cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi PreProc	cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Title	cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Type		cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Special	cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Delimiter	cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE

" colors are nice sometimes, this is basically solarized
autocmd Filetype java colo flattened_dark
autocmd Filetype python colo flattened_dark
autocmd Filetype scala colo flattened_dark

