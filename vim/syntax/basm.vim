" Vim syntax file
" Language: BF Assembly
" Maintainer: Morgaux Meyer


" Set syntax name

if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "BASM"


"
" Syntax rules
"


" Cells and Values - arguments to commands

" Match cells as addresses or names
syn match BASM_ADDR '\<0x\x\x\x\x\>' " 0x???? 1 hex word
syn match BASM_NAME '\<\u*\>'        " ANY CAPITAL WORD

" Match byte literals
syn match BASM_BYTE '\<0x\x\x\>'     " 0x??   1 hex byte


" Comments

" Match comments
syn match BASM_CMNT '\/\/.*$'        " rest of line after //


" Misc commands

" NOP takes no arguments
syn keyword BASM_MISC NOP


" Variable manipulators

" VAR takes a valid NAME
syn keyword BASM_TYPE VAR nextgroup=BASM_NAME skipwhite

" SET takes an address or variable
syn keyword BASM_MISC SET nextgroup=BASM_NAME skipwhite
syn keyword BASM_MISC SET nextgroup=BASM_ADDR skipwhite


" Arithmetic commands

" INC and DEC take a cell and a value
syn keyword BASM_MATH INC DEC nextgroup=BASM_NAME nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH INC DEC nextgroup=BASM_ADDR nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH INC DEC nextgroup=BASM_NAME nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH INC DEC nextgroup=BASM_ADDR nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH INC DEC nextgroup=BASM_NAME nextgroup=BASM_BYTE skipwhite
syn keyword BASM_MATH INC DEC nextgroup=BASM_ADDR nextgroup=BASM_BYTE skipwhite

" ADD SUB DIV and MUL take another value after that
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_NAME nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_NAME nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_NAME nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_NAME nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_NAME nextgroup=BASM_BYTE skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_NAME nextgroup=BASM_BYTE skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_NAME nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_NAME nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_NAME nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_NAME nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_NAME nextgroup=BASM_BYTE skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_NAME nextgroup=BASM_BYTE skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_ADDR nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_ADDR nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_ADDR nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_ADDR nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_ADDR nextgroup=BASM_BYTE skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_ADDR nextgroup=BASM_BYTE skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_ADDR nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_ADDR nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_ADDR nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_ADDR nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_ADDR nextgroup=BASM_BYTE skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_ADDR nextgroup=BASM_BYTE skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_BYTE nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_BYTE nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_BYTE nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_BYTE nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_BYTE nextgroup=BASM_BYTE skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_NAME nextgroup=BASM_BYTE nextgroup=BASM_BYTE skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_BYTE nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_BYTE nextgroup=BASM_NAME skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_BYTE nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_BYTE nextgroup=BASM_ADDR skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_BYTE nextgroup=BASM_BYTE skipwhite
syn keyword BASM_MATH ADD SUB DIV MUL nextgroup=BASM_ADDR nextgroup=BASM_BYTE nextgroup=BASM_BYTE skipwhite


" IO commands

syn keyword BASM_USER PUT GET nextgroup=BASM_NAME skipwhite
syn keyword BASM_USER PUT GET nextgroup=BASM_ADDR skipwhite


" Control flow commands

" IF and LOOP take a cell argument
syn keyword BASM_FLOW IF LOOP nextgroup=BASM_NAME skipwhite
syn keyword BASM_FLOW IF LOOP nextgroup=BASM_ADDR skipwhite

" END statements don't take any
syn keyword BASM_FLOW ENDIF ENDLOOP


" Highlight groups

hi def link BASM_CMNT Comment

hi def link BASM_NAME Identifier
hi def link BASM_ADDR Number
hi def link BASM_BYTE Number
hi def link BASM_LEAD Type

hi def link BASM_MISC Label
hi def link BASM_TYPE Type
hi def link BASM_MATH Operator
hi def link BASM_USER Statment
hi def link BASM_FLOW Conditional

