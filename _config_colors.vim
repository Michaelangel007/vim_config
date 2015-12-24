"----- Colors -----{ 

  "To apply the colors in this file inside Vim:
  "
  "  :so %
  "
  "Color keywords
  " 
  "  Black    DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta Brown  Grey
  "  DarkGrey Blue     Green     Cyan     Red     Magenta     Yellow White
  ":runtime syntax/colortest.vim
  "Put cursor on filename, and press: gf
  "  $VIMRUNTIME/rgb.txt
 
 "Display current highlight groups
  "  :hi
  "http://newbiedoc.sourceforge.net/text_editing/vim.html.en#MODES-VIM
  "  :help group-name
  "  :help cterm-colors
  "See: /usr/share/vim/vim72/syntax/cpp.vim
  "See: /usr/share/vim/vim72/colors
  "  :colorscheme darkblue"
  "  :colorscheme torte
  "To custom colors after selecting a colorscheme
  "  http://www.vim.org/scripts/script.php?script_id=1641

  "http://vim.wikia.com/wiki/Using_GUI_color_settings_in_a_terminal
  "colorsupport.vim : Use colorschemes written for gvim in color terminals.
  "http://www.vim.org/scripts/script.php?script_id=2682
  "
  "http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim


  "2.15 list of colors
  " rkblue.vim
  " default.vim
  " delek.vim
  " desert.vim
  " elflord.vim
  " evening.vim
  " koehler.vim
  " morning.vim
  " murphy.vim
  " pablo.vim
  " peachpuff.vim
  " README.txt
  " ron.vim
  " shine.vim
  " slate.vim
  " torte.vim
  " zellner.vim

  "Disable color syntax printing for printing
  "  :set printoptions+=syntax:n

  syntax on
  syntax reset
  set background=dark
  set cursorline "Cursor line is highlighted
  highlight clear

"hi Normal      guifg=#C0C0C0 guibg=Black    gui=NONE
"hi StatusLine  guifg=white   guibg=DarkCyan gui=NONE "White on DarkCyan
"hi CursorLine                 guibg=#000040 gui=NONE                  ctermbg=DarkGrey cterm=underline
"hi Statement   guifg=Pink    guibg=Pink     gui=NONE
" hi statusline guibg=blue

" http://vim.wikia.com/wiki/View_all_colors_available_to_gvim
" #001020   Deep Dark Blue
" #000080   Deep Blue
" #0080FF   Sky Blue
"
" #0F2F2F   Darker DarkSlateGray
" #2F4F4F   Dark Cyan (VIM: DarkSlateGray 47 79 79)

"  Remap the useless magenta to something more visually pleasing
"Cyan        = #004040 " DarkSlateGray
"Brown       = #FF8000 " -> Orange
"DarkMagenta = #0040C0 " -> _?_Blue
"Magenta     = #0080FF " -> _?_Blue

hi Normal       guifg=#C0C0C0 guibg=#000010 gui=NONE ctermfg=Grey     ctermbg=Black    cterm=None       " Grey192 on Black
hi LineNr       guifg=Yellow  guibg=#000038 gui=NONE ctermfg=Yellow   ctermbg=4        cterm=None       "Yellow
hi CursorLineNr guifg=Orange  guibg=#000068 gui=NONE ctermfg=Yellow   ctermbg=Blue     cterm=Bold       "Orange
hi CursorLine                 guibg=#000050 gui=NONE                  ctermbg=Blue     cterm=Underline  "Deep Blue
hi ColorColumn                guibg=#000020          ctermfg=Blue                      cterm=None       "Faint Blue

hi search       guifg=#ffffff guibg=#0080ff gui=none ctermfg=white    ctermbg=blue     cterm=bold       "white on babyblue
hi Visual                     guibg=#404040 gui=REVERSE ctermfg=Black ctermbg=Grey     cterm=NONE       "Muted Gray
hi Cursor       guifg=Black   guibg=Green   gui=NONE ctermfg=Black    ctermbg=Green    cterm=None       "Black on Green
hi StatusLine   guifg=white   guibg=#000060 gui=NONE ctermfg=White    ctermbg=Blue     cterm=Bold       "White on Deep Blue
" Something in _vimrc bolds the line number???
hi Special      guifg=Orange                gui=NONE ctermfg=Yellow                    cterm=None

"Vim Comment: Blue
"C/C++ Comment: Green
"Vim Purple ?= A000FF ?? // AF00FF is slightly too bright
hi Character    guifg=#004080               gui=NONE ctermfg=Cyan                      cterm=None       "Muted cyan
hi Comment      guifg=#60FF60               gui=NONE ctermfg=Green                     cterm=None       "Muted Green
hi Delimiter    guifg=#FFFFFF               gui=NONE ctermfg=White                     cterm=Bold       "White
hi Keyword      guifg=#FFFFFF               gui=NONE ctermfg=Grey                      cterm=None       "White
hi Identifier   guifg=Purple                gui=NONE ctermfg=Magenta                   cterm=None       "Magenta
hi Number       guifg=#FF8000               gui=NONE ctermfg=Brown                     cterm=None       "Orange
hi Float        guifg=#FF4020               gui=NONE ctermfg=Red                       cterm=None       "Red
" #FFFFFF or #EEEEEE
hi Operator     guifg=#EEEEEE               gui=NONE ctermfg=White                     cterm=Bold       "White
hi Statement    guifg=Yellow                gui=NONE ctermfg=Yellow                    cterm=Bold       "Yellow
hi String       guifg=Cyan                  gui=NONE ctermfg=Cyan                      cterm=None       "Cyan
hi Todo         guifg=#202020 guibg=Yellow  gui=NONE ctermfg=Black   ctermbg=Yellow    cterm=Bold       "Yellow Hilight
"TODO:
"VimCommand Type              "syntax on
"VimCommand VimOption=Normal  "set background=dark
hi VimOption    guifg=#FFA0FF               gui=NONE "Pink
hi VimHiKeyList guifg=#FFFFFF

"VimCommand VimGroup Type  Number                   =PreProc
hi VimCommand   guifg=#80A0FF               gui=NONE ctermfg=Yellow                    cterm=None       "Yellow "
hi VimGroup     guifg=Yellow                gui=NONE ctermfg=Yellow                    cterm=Bold
"highlight Type guifg=#00FFFF               gui=NONE "Cyan
hi Type         guifg=Purple                gui=NONE ctermfg=Magenta                   cterm=None       "Purple"
hi PreProc      guifg=#0080FF               gui=NONE ctermfg=Blue                      cterm=Bold       "BabyBlue"

"VIM Messages
hi ModeMsg      guifg=Yellow                gui=NONE ctermfg=Yellow                "--INSERT--
hi MoreMsg      guifg=SeaGreen              gui=NONE ctermfg=Green                 "Press ENTER or type command

 "Color coded by precedence :)
"  :syn match cOpMath        display "[+-/%]"
"  :syn match cOpConditional display "?:"
"  :syn match cOpBAnd         display "&\|&&"
"  :syn match cOpOr          display "(||)" 
"  :syn match cOpXor         display ""
"  :syn match cOpEqual       display "==\|!="
"  :syn match cOpNot         display "\~\|!"
"  :syn match cOpPointer     display "\*\|\.\|->"
"  :syn match cOpAssign1  display "="
"  :syn match cOpAssign2  display "+=\|-="
"  :syn match cOpAssign3  display "\*=\|/="
"  :syn match cOpAssign4  display "%=\|&="
"  :syn match cOpAssign5  display "^=\|"
"  :syn cluster cOperators add=cOpMath,cOpConditional,cOpAnd,cOpOr,cOpXor,cOpEqual,cOpNot,cOpPoint
"  :syn cluster cOperators add=cOpMath,cOpConditional,cOpAnd,cOpOr,cOpXor,cOpEqual,cOpNot,cOpPoint

"  :hi          cOpPrec2a guifg=#FF0000 guibg=#000010
"  :syn match cOpPrec2c display "\(\)"
"  :syn cluster cOpPrecc add=cOpPrec1a
"  :hi  cOpPrec1   giufg=#FF0000
"  :hi  cOperators guifg=White

  "For more complete syntax of .c, see: Standard C VIM Syntax Files
  "  http://www.eandem.co.uk/mrw/vim/syntax/index.html#ansic

  "For complete list...
  "  http://vimcolorschemetest.googlecode.com/svn/colors/contrasty.vim

  "What color to use for word-wrap line breaks character
  "See: showbreak
  hi NonText gui=NONE guifg=#777777 guibg=bg cterm=None ctermfg=DarkGrey ctermbg=bg "Medium Grey



  "Custom colors
  "  #4040FF Muted Blue
  "  #0080FF BabyBlue
  "  #80A0FF Muted light blue
  "
  "  #40FF40 Nature Green
  "  #60FF60 Muted Green
  "  #80FF80 Lime Green
  "
  "  #A020F0 Purple (Default VIM)
  "  #8000FF DeepPurple  (my MSVC: Keyword Vim: cType)
  "  #C000FF MyPurpleBlueish
  "  #FF00FF Pink

  "Disable all Bold on the status line
  "  http://groups.google.com/group/vim_use/browse_thread/thread/708eeb8ad2d11fc4
  "Default: t_md=^[|2h   
  "  set t_Co=8
  "  set t_md=

"}
