"
" I've shamelessly stolen this stuff, although it's quite good so I don't mind
"
" http://github.com/jcs/dotfiles
" Author: Joshua Stein
" License: none
"
" Don't pollute directories with swap files, keep them in one place
silent !mkdir -p ~/.vim/backup/
silent !mkdir -p ~/.vim/swp/
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" ...except crontab, which will complain that it can't see any changes
augroup jcs_autocmds
	autocmd!

	autocmd FileType crontab setlocal bkc=yes
augroup END

