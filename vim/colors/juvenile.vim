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
	hi clear
	if exists('syntax_on')
		syntax reset
	endif
endif

let colors_name = 'juvenile'

if has('gui_running') || &t_Co >= 256
	hi Normal   cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=#fcfcfc guibg=#030303
	hi Comment  cterm=NONE ctermfg=246  ctermbg=NONE gui=NONE guifg=#a0a0a0 guibg=NONE
	hi NonText  cterm=NONE ctermfg=246  ctermbg=NONE gui=NONE guifg=#a0a0a0 guibg=NONE
elseif &t_Co >= 8
	hi Normal   cterm=NONE ctermfg=NONE ctermbg=NONE
	hi Comment  cterm=bold ctermfg=0    ctermbg=NONE
	hi NonText  cterm=bold ctermfg=0    ctermbg=NONE
else
	hi Normal   cterm=NONE ctermfg=NONE ctermbg=NONE
	hi Comment  cterm=NONE ctermfg=NONE ctermbg=NONE
	hi NonText  cterm=NONE ctermfg=NONE ctermbg=NONE
endif


"
" Literals
"

hi Constant  cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi String    cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Character cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Number    cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Boolean   cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Float     cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE


"
" Identifiers
"

hi Identifier cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Function   cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE


"
" Statements
"

hi Statement   cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Conditional cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Repeat      cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Label       cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Operator    cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Keyword     cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Exception   cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE


"
" Preprocessors
"

hi PreProc   cterm=NONE ctermfg=246  ctermbg=NONE gui=NONE guifg=#a0a0a0 guibg=NONE
hi Include   cterm=NONE ctermfg=246  ctermbg=NONE gui=NONE guifg=#a0a0a0 guibg=NONE
hi Define    cterm=NONE ctermfg=246  ctermbg=NONE gui=NONE guifg=#a0a0a0 guibg=NONE
hi Macro     cterm=NONE ctermfg=246  ctermbg=NONE gui=NONE guifg=#a0a0a0 guibg=NONE
hi PreCondit cterm=NONE ctermfg=246  ctermbg=NONE gui=NONE guifg=#a0a0a0 guibg=NONE


"
" Types
"

hi Type         cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi StorageClass cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Structure    cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Typedef      cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE


"
" Special Symbols
"

hi Special        cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi SpecialChar    cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi SpecialKey     cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Tag            cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Delimiter      cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi SpecialComment cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Debug          cterm=REVERSE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE


"
" Misc
"

hi Underlined   cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Ignore       cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Error        cterm=REVERSE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Todo         cterm=REVERSE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi LineNR       cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Directory    cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Search       cterm=REVERSE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi MoreMsg      cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi CursorLineNr cterm=REVERSE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Question     cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi WarningMsg   cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi WildMenu     cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Folded       cterm=REVERSE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi FoldedColumn cterm=REVERSE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Pmenu        cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi ColorColumn  cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi MatchParen   cterm=NONE    ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE

