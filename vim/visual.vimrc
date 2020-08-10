" enable syntax
syntax on

" Colours and highlighting
set t_Co=256                  " use 256 colors
set t_ut=""                   " disable background erase
set t_8f=[38;2;%lu;%lu;%lum " set foreground color
set t_8b=[48;2;%lu;%lu;%lum " set background color
set t_Co=256                  " Enable 256 colors
set termguicolors             " Enable GUI colors for the terminal for truecolor
set background=dark           " ahhhhhh my eyes!!
let g:loaded_matchparen=1     " prevent annoying paren matching

" Catch whitespace errors
match Error /\s\+$\| \+\ze\t/
augroup whitespace_errors
	autocmd!

	autocmd InsertEnter * redraw!
	autocmd InsertLeave * redraw!
augroup END

" Show tabs as comments
set list
set listchars=tab:\|\ 
match Comment /\t/

" Set colorscheme (after other highlight settings)
colorscheme PaperColor

