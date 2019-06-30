" Castle.vim -- Vim color scheme.
" Author:      Morgaux (3158796-morgaux@users.noreply.gitlab.com)
" Webpage:     http://www.example.com
" Description: Based on https://gitlab.com/morgaux/dwm/raw/6e18d171/castle.png

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "castle"

if ($TERM =~ '256' || &t_Co >= 256) || has("gui_running")
    hi Normal ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE

    set background=dark

    hi NonText ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi Comment ctermbg=0 ctermfg=12 cterm=NONE guibg=#273537 guifg=#415c71 gui=NONE
    hi Constant ctermbg=0 ctermfg=9 cterm=NONE guibg=#273537 guifg=#df4b35 gui=NONE
    hi Error ctermbg=0 ctermfg=1 cterm=NONE guibg=#273537 guifg=#943a2c gui=NONE
    hi Identifier ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi Ignore ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi PreProc ctermbg=0 ctermfg=10 cterm=NONE guibg=#273537 guifg=#565d55 gui=NONE
    hi Special ctermbg=0 ctermfg=10 cterm=NONE guibg=#273537 guifg=#565d55 gui=NONE
    hi Statement ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi String ctermbg=0 ctermfg=3 cterm=NONE guibg=#273537 guifg=#efa72b gui=NONE
    hi Todo ctermbg=0 ctermfg=1 cterm=reverse guibg=#273537 guifg=#943a2c gui=reverse
    hi Type ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi Underlined ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi StatusLine ctermbg=NONE ctermfg=NONE cterm=reverse guibg=NONE guifg=NONE gui=reverse
    hi StatusLineNC ctermbg=NONE ctermfg=NONE cterm=reverse guibg=NONE guifg=NONE gui=reverse
    hi VertSplit ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi TabLine ctermbg=NONE ctermfg=NONE cterm=reverse guibg=NONE guifg=NONE gui=reverse
    hi TabLineFill ctermbg=NONE ctermfg=NONE cterm=reverse guibg=NONE guifg=NONE gui=reverse
    hi TabLineSel ctermbg=NONE ctermfg=NONE cterm=reverse guibg=NONE guifg=NONE gui=reverse
    hi Title ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi CursorLine ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi LineNr ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi CursorLineNr ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi helpLeadBlank ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi helpNormal ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi Visual ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi VisualNOS ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi Pmenu ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi PmenuSbar ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi PmenuSel ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi PmenuThumb ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi FoldColumn ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi Folded ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi WildMenu ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi SpecialKey ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi DiffAdd ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi DiffChange ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi DiffDelete ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi DiffText ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi IncSearch ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi Search ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi Directory ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi MatchParen ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi SpellBad ctermbg=1 ctermfg=15 cterm=NONE guibg=#943a2c guifg=#e9f8fd gui=NONE guisp=#df4b35
    hi SpellCap ctermbg=1 ctermfg=15 cterm=NONE guibg=#943a2c guifg=#e9f8fd gui=NONE guisp=#415c71
    hi SpellLocal ctermbg=1 ctermfg=15 cterm=NONE guibg=#943a2c guifg=#e9f8fd gui=NONE guisp=#cf9684
    hi SpellRare ctermbg=1 ctermfg=15 cterm=NONE guibg=#943a2c guifg=#e9f8fd gui=NONE guisp=#a4cbda
    hi ColorColumn ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi SignColumn ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi ErrorMsg ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi ModeMsg ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi MoreMsg ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi Question ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi Cursor ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi CursorColumn ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi QuickFixLine ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi StatusLineTerm ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE
    hi StatusLineTermNC ctermbg=0 ctermfg=15 cterm=NONE guibg=#273537 guifg=#e9f8fd gui=NONE

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16

    hi Normal ctermbg=black ctermfg=white cterm=NONE

    set background=dark

    hi NonText ctermbg=black ctermfg=white cterm=NONE
    hi Comment ctermbg=black ctermfg=blue cterm=NONE
    hi Constant ctermbg=black ctermfg=red cterm=NONE
    hi Error ctermbg=black ctermfg=darkred cterm=NONE
    hi Identifier ctermbg=black ctermfg=white cterm=NONE
    hi Ignore ctermbg=black ctermfg=white cterm=NONE
    hi PreProc ctermbg=black ctermfg=green cterm=NONE
    hi Special ctermbg=black ctermfg=green cterm=NONE
    hi Statement ctermbg=black ctermfg=white cterm=NONE
    hi String ctermbg=black ctermfg=darkyellow cterm=NONE
    hi Todo ctermbg=black ctermfg=darkred cterm=reverse
    hi Type ctermbg=black ctermfg=white cterm=NONE
    hi Underlined ctermbg=black ctermfg=white cterm=NONE
    hi StatusLine ctermbg=NONE ctermfg=NONE cterm=reverse
    hi StatusLineNC ctermbg=NONE ctermfg=NONE cterm=reverse
    hi VertSplit ctermbg=black ctermfg=white cterm=NONE
    hi TabLine ctermbg=NONE ctermfg=NONE cterm=reverse
    hi TabLineFill ctermbg=NONE ctermfg=NONE cterm=reverse
    hi TabLineSel ctermbg=NONE ctermfg=NONE cterm=reverse
    hi Title ctermbg=black ctermfg=white cterm=NONE
    hi CursorLine ctermbg=black ctermfg=white cterm=NONE
    hi LineNr ctermbg=NONE ctermfg=NONE cterm=NONE
    hi CursorLineNr ctermbg=NONE ctermfg=NONE cterm=NONE
    hi helpLeadBlank ctermbg=black ctermfg=white cterm=NONE
    hi helpNormal ctermbg=black ctermfg=white cterm=NONE
    hi Visual ctermbg=black ctermfg=white cterm=NONE
    hi VisualNOS ctermbg=black ctermfg=white cterm=NONE
    hi Pmenu ctermbg=black ctermfg=white cterm=NONE
    hi PmenuSbar ctermbg=black ctermfg=white cterm=NONE
    hi PmenuSel ctermbg=black ctermfg=white cterm=NONE
    hi PmenuThumb ctermbg=black ctermfg=white cterm=NONE
    hi FoldColumn ctermbg=black ctermfg=white cterm=NONE
    hi Folded ctermbg=black ctermfg=white cterm=NONE
    hi WildMenu ctermbg=black ctermfg=white cterm=NONE
    hi SpecialKey ctermbg=black ctermfg=white cterm=NONE
    hi DiffAdd ctermbg=black ctermfg=white cterm=NONE
    hi DiffChange ctermbg=black ctermfg=white cterm=NONE
    hi DiffDelete ctermbg=black ctermfg=white cterm=NONE
    hi DiffText ctermbg=black ctermfg=white cterm=NONE
    hi IncSearch ctermbg=black ctermfg=white cterm=NONE
    hi Search ctermbg=black ctermfg=white cterm=NONE
    hi Directory ctermbg=black ctermfg=white cterm=NONE
    hi MatchParen ctermbg=black ctermfg=white cterm=NONE
    hi SpellBad ctermbg=darkred ctermfg=white cterm=NONE
    hi SpellCap ctermbg=darkred ctermfg=white cterm=NONE
    hi SpellLocal ctermbg=darkred ctermfg=white cterm=NONE
    hi SpellRare ctermbg=darkred ctermfg=white cterm=NONE
    hi ColorColumn ctermbg=black ctermfg=white cterm=NONE
    hi SignColumn ctermbg=black ctermfg=white cterm=NONE
    hi ErrorMsg ctermbg=black ctermfg=white cterm=NONE
    hi ModeMsg ctermbg=NONE ctermfg=NONE cterm=NONE
    hi MoreMsg ctermbg=NONE ctermfg=NONE cterm=NONE
    hi Question ctermbg=black ctermfg=white cterm=NONE
    hi Cursor ctermbg=black ctermfg=white cterm=NONE
    hi CursorColumn ctermbg=black ctermfg=white cterm=NONE
    hi QuickFixLine ctermbg=black ctermfg=white cterm=NONE
    hi StatusLineTerm ctermbg=black ctermfg=white cterm=NONE
    hi StatusLineTermNC ctermbg=black ctermfg=white cterm=NONE
endif

hi link Number Constant
hi link WarningMsg Error

let g:terminal_ansi_colors = [
        \ '#273537',
        \ '#943a2c',
        \ '#3e453d',
        \ '#efa72b',
        \ '#2d465f',
        \ '#40566b',
        \ '#81adb8',
        \ '#aac0c2',
        \ '#3f4f51',
        \ '#df4b35',
        \ '#565d55',
        \ '#f7e29b',
        \ '#415c71',
        \ '#cf9684',
        \ '#a4cbda',
        \ '#e9f8fd',
        \ ]

" Generated with RNB (https://gist.github.com/romainl/5cd2f4ec222805f49eca)

