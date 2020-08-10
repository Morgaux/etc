" options for https://github.com/vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Misc set up toggles
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 1
let g:syntastic_aggregate_errors         = 1

" C/C++ checker options
let g:syntastic_c_checkers         = [ 'gcc',        'clang'      ]
let g:syntastic_c_include_dirs     = [ 'raycastlib', 'small3dlib' ]
let g:syntastic_c_compiler_options = join([
                                   \    '-std=c99',
                                   \    '-pedantic',
                                   \    '-Wall',
                                   \    '-Wbool-operation',
                                   \    '-Wc90-c99-compat',
                                   \    '-Wc99-c11-compat',
                                   \    '-Wc++-compat',
                                   \    '-Wcomment',
                                   \    '-Wcomments',
                                   \    '-Wconversion',
                                   \    '-Wdangling-else',
                                   \    '-Wdeclaration-after-statement',
                                   \    '-Wdeprecated',
                                   \    '-Wextra',
                                   \    '-Wformat',
                                   \    '-Wimplicit',
                                   \    '-Wimplicit-fallthrough',
                                   \    '-Wimplicit-fallthrough=4',
                                   \    '-Wlogical-op',
                                   \    '-Wmain',
                                   \    '-Wmisleading-indentation',
                                   \    '-Wmissing-declarations',
                                   \    '-Wmissing-field-initializers',
                                   \    '-Wmissing-parameter-type',
                                   \    '-Wmissing-prototypes',
                                   \    '-Wmissing-prototypes',
                                   \    '-Wno-missing-include-dirs',
                                   \    '-Wno-unused',
                                   \    '-Wno-unknown-warning-option',
                                   \    '-Wparentheses',
                                   \    '-Wstrict-prototypes',
                                   \    '-Wswitch',
                                   \    '-Wswitch-bool',
                                   \    '-Wswitch-default',
                                   \    '-Wswitch-enum',
                                   \    '-Wswitch-unreachable',
                                   \    '-Wtraditional-conversion',
                                   \    '-Wundef',
                                   \    '-Wunreachable-code',
                                   \    '-Wwrite-strings',
                                   \ ], ' ')

