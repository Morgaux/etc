" vim: set syntax=vim:

augroup makefile_filetype
	autocmd!

	autocmd Filetype make setlocal tabstop=8
	autocmd Filetype make setlocal softtabstop=0
	autocmd Filetype make setlocal shiftwidth=8
	autocmd Filetype make setlocal noexpandtab nowrap
augroup END

