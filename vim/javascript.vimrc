augroup javascript_filetype
	autocmd!

	autocmd Filetype javascript setlocal softtabstop=4
	autocmd Filetype javascript setlocal shiftwidth=4
	autocmd Filetype javascript setlocal expandtab
	autocmd Filetype javascript setlocal nowrap
	autocmd Filetype javascript setlocal foldmethod=syntax
augroup END

" options for https://github.com/pangloss/vim-javascript
let g:javascript_plugin_jsdoc           = 1
let g:javascript_conceal_function       = 'ƒ'
let g:javascript_conceal_arrow_function = '→'

