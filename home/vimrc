" SHEBANG LINE
"
" gitlab.com/morgaux.com/etc
"

syntax on

let loaded_matchparen = 1

set belloff=all
set showcmd
set cul
set nohlsearch
set nu
set ruler
set verbose
set leftright
set extended
set iclower
set searchincr
set report=1

" Needed for st!
set t_8f=[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=[48;2;%lu;%lu;%lum        " set background color
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the term truecolor

set showtabline=2
set laststatus=2
set ignorecase

" Tabs must be eight wide!!!
set tabstop=8 softtabstop=0 shiftwidth=8 noexpandtab

" No line numbers if the term is too narrow for 80 chars
if &columns < 85
	set nonu
endif

"
" juvenil.vim
" Show comments in grey if color available, in defiance Commander Pike
" But nothing else, in deference to Commander Pike.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
" License: Same as Vim itself
"
set background=dark
if v:version > 580
	hi clear
	if exists('g:syntax_on')
		syntax reset
	endif
endif
let g:colors_name = 'juvenile'
if has('gui_running') || &t_Co == 256
	hi Comment	cterm=NONE ctermfg=256	ctermbg=NONE gui=NONE guifg=#a0a0a0	guibg=NONE
	hi NonText	cterm=NONE ctermfg=256	ctermbg=NONE gui=NONE guifg=#a0a0a0	guibg=NONE
	hi Constant	cterm=NONE ctermfg=NONE	ctermbg=NONE gui=NONE guifg=NONE	guibg=NONE
	hi Identifier	cterm=NONE ctermfg=NONE	ctermbg=NONE gui=NONE guifg=NONE	guibg=NONE
	hi Function	cterm=NONE ctermfg=NONE	ctermbg=NONE gui=NONE guifg=NONE	guibg=NONE
	hi Statement	cterm=NONE ctermfg=NONE	ctermbg=NONE gui=NONE guifg=NONE	guibg=NONE
	hi PreProc 	cterm=NONE ctermfg=NONE	ctermbg=NONE gui=NONE guifg=NONE	guibg=NONE
	hi Title	cterm=NONE ctermfg=NONE	ctermbg=NONE gui=NONE guifg=NONE	guibg=NONE
	hi Type		cterm=NONE ctermfg=NONE	ctermbg=NONE gui=NONE guifg=NONE	guibg=NONE
	hi Special	cterm=NONE ctermfg=NONE	ctermbg=NONE gui=NONE guifg=NONE	guibg=NONE
	hi Delimiter	cterm=NONE ctermfg=NONE	ctermbg=NONE gui=NONE guifg=NONE	guibg=NONE
	" Line number colors
	hi LineNr	cterm=NONE ctermfg=NONE	ctermbg=NONE gui=NONE guifg=NONE	guibg=NONE
	hi CursorLineNr	cterm=NONE ctermfg=NONE	ctermbg=NONE gui=NONE guifg=NONE	guibg=NONE

endif

