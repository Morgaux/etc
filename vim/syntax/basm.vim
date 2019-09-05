" Vim syntax file
" Language: BF Assembly
" Maintainer: Morgaux Meyer

if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "BASM"

" BF Keywords in comments
syn match BASM_BF   '[,.<>[\]+-]'

" Matches
syn match BASM_ADDR '\<0x\x\x\x\x\>'           " 0x???? 1 hex word
syn match BASM_BYTE '\<0x\x\x\>'               " 0x??   1 hex byte
syn match BASM_NAME '\<\u*\>'                  " ANY CAPITAL WORD
syn match BASM_CMNT '\/\/.*$' contains=BASM_BF " the rest of the line after //

" Keywords
syn keyword BASM_MISC NOP
syn keyword BASM_MISC VAR nextgroup=BASM_NAME skipwhite
syn keyword BASM_MISC SET
syn keyword BASM_MATH INC DEC ADD DIV MUL
syn keyword BASM_USER PUT GET
syn keyword BASM_FLOW IF ENDIF LOOP ENDLOOP

" Regions

hi def link BASM_CMNT Comment
hi def link BASM_BF   TODO

hi def link BASM_NAME Identifier
hi def link BASM_ADDR Number
hi def link BASM_BYTE Number

hi def link BASM_MISC Statment
hi def link BASM_MATH Operator
hi def link BASM_USER Statment
hi def link BASM_FLOW Conditional

