"----- Whitespace -----{

  "Whitespace (Vim Examples)
  "See: /usr/share/vim/vim72/syntax/whitespace.vim

  "Old Vim defaults:
  "set backspace=2
  "set noautoindent

  "  http://www.jonlee.ca/hacking-vim-the-ultimate-vimrc/ 
  set tabstop=4     "set tab character to X characters
  set expandtab     "turn tabs into whitespace
  "2.27 Changed: tabstop and shiftwidth 2 -> 4
  set shiftwidth=4  "indent width for autoindent
  "set backspace=1   "


  "Show/Hide white space"
  "set list
  set nolist

  "Enable/Disable display of word wrapping"
  "set wrap
  set nowrap

  "Disable automatic wrapping of long lines when entering text
  set wrapmargin=0


  "When word wrap is on, show first char if wrapped lines"
  " 0xB6 = Paragraph marker
  "If the break character shows up bold, you need to set
  "  :highlight NonText
  if has("gui_running")
    "2.20 fixed linebreak by including only if has gui 
    " set showbreak=¶
    " All config fileles should be in $HOME/.vim/
    execute 'source'.fnameescape(VIM_CONFIG).'/_linebreak_gui.vim'

"     set listchars=tab:>-,trail:.,nbsp:_,eol:$
     set showbreak=$
  else
    set showbreak=$
  endif

  "When showing tabs, make them more visible"
  "set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
  "Vim BUG: It is NOT possible to display whitespace
  "Vim BUG: It is NOT possible to display a right-aligned tab, tab:->
  "  should show:  ----->

  if has("gui_running")
    " already set with linebreaks
  else
    set listchars=tab:>-,trail:.,nbsp:%,eol:$
  endif

  "http://www.unix.com/unix-dummies-questions-answers/156283-problem-map-vim-cursor-moving-insertmode.html
  "http://vimdoc.sourceforge.net/htmldoc/gui.html
  if has("gui_running")
    "http://stackoverflow.com/questions/2149456/reasons-for-using-command-line-vim-versus-gui-vim
    "If you want to run gvim over ssh+gui:  ssh -X user@host gvim

    " http://stackoverflow.com/questions/1539861/what-is-the-good-gvim-guifont-for-c-c-programming
    "To bring up the GUI font chooser dialog
    "   :setguifont=*
    "To display the current guifont setting:
    "   :echo &guifont
    if has("gui_win32")
      "echo "Found Win32/Cygwin"
       set guifont=Lucida_Console:h8:cDEFAULT
    else
      if has("gui_gtk2")
        "echo " Ubuntu/Gnome clean at 12 pt, blurry at 11 pt "
        "Note: Must backspace <space> !
        set guifont=ProggyTinyTT\ 12
      else
        "OSX gVim
        " Program5x7b is similar to ProggyTiny except the line spacing is tighter
        "OSX 10.7 -- can't use .dfont, use True Type instead
        " set guifont=ProggyTiny\:h11
        " set guifont=Lucida_Console\:h11
        " set guifont=ProggyTinyTT\:h16
        " set guifont=Program5x7b\:h16

        "OSX 10.8 use font size 8
        set guifont=Program5x7b\:h8

        "OSX 10.8 use font size 16
        set guifont=Program5x7b\:h16
      endif
       "set guifont=Lucida_Console:h8:cDEFAULT
    endif

    "For gui... lines=50 is nice size of window"
    set lines=50
    "Resize the window width
    set columns=100

    "Set a visible right margin indicator
    if exists('+colorcolumn')
      set colorcolumn=80
    else
      "2.18 http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
      highlight OverLength ctermbg=red ctermfg=white guibg=#402020
      match OverLength /\%>80v.\+/
    endif

    "We want to use all Alt-keys, not Alt-F for Menu:File
    set winaltkeys=no

    "Desktop is 1900x1200, position at 1200 800
    "winpos 1188 480

  endif
"}

