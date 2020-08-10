augroup vimscript_filetype
	autocmd!

	autocmd Filetype vim setlocal tabstop=8
	autocmd Filetype vim setlocal softtabstop=0
	autocmd Filetype vim setlocal shiftwidth=8
	autocmd Filetype vim setlocal noexpandtab
	autocmd Filetype vim setlocal nowrap

	autocmd Filetype vim abbreviate hi   highlight
	autocmd Filetype vim abbreviate au   autocmd
	autocmd Filetype vim abbreviate colo colorscheme
augroup END

