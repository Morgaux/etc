" Vim syntax file
" Language: BF Assembly
" Maintainer: Morgaux Meyer

if exists("b:current_syntax")
	finish
endif

" Keywords
syn keyword BASM_MISC NOP VAR SET
syn keyword BASM_MATH INC DEC ADD DIV MUL
syn keyword BASM_USER PUT GET
syn keyword BASM_FLOW IF ENDIF LOOP ENDLOOP

" Matches
syn match BASM_CELL '\<0x\x\x\x\x\>'
syn match BASM_CELL '\<\u\>'

" Regions

let b:current_syntax = "BASM"

hi def link BASM_MISC Statment
hi def link BASM_MATH Statment
hi def link BASM_USER Statment
hi def link BASM_FLOW Statment

