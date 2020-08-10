augroup haskell_filetype " {{{
	autocmd!

	autocmd Filetype haskell setlocal softtabstop=4
	autocmd Filetype haskell setlocal shiftwidth=4
	autocmd Filetype haskell setlocal expandtab
	autocmd Filetype haskell setlocal nowrap
augroup END " }}}

" options for https://github.com/neovimhaskell/haskell-vim
let g:haskell_enable_quantification   = 1 " enable highlighting 'forall'
let g:haskell_enable_recursivedo      = 1 " enable highlighting 'mod' & reg'
let g:haskell_enable_arrowsyntax      = 1 " enable highlighting 'proc'
let g:haskell_enable_pattern_synonyms = 1 " enable highlighting 'pattern'
let g:haskell_enable_typeroles        = 1 " enable highlighting type roles
let g:haskell_enable_static_pointers  = 1 " enable highlighting 'static'
let g:haskell_backpack                = 1 " enable highlighting backpacks
let g:haskell_indent_if               = 3 " indent 'if then else' to condition
let g:haskell_indent_case             = 5 " indent 'case' to expression
let g:haskell_indent_let              = 4 " indent 'let' to expression
let g:haskell_indent_where            = 6 " indent 'where' to expression
let g:haskell_indent_before_where     = 0 " indent leading expression to 'where'
let g:haskell_indent_after_bare_where = 6 " indent naked 'where'
let g:haskell_indent_do               = 3 " indent 'do' to expression
let g:haskell_indent_in               = 0 " match 'in' indent to 'let'
let g:haskell_indent_guard            = 2 " indent '|' guard

