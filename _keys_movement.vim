"----- Movement ----{

  "  k       i  "
  " h l -> j k l"
  "  j          "
  "Half Page Up/Down
  noremap i <Up>
  noremap k <Down>
  noremap j <Left>
  noremap l <Right>

  " Shift-I Top of Window
  " Shift-L Mid of Window
  " Shift-K Bot of Window (man page)
  noremap I H
  noremap K L
  noremap L M

  " BUG: Arrow keys leave Visual mode!
  vnoremap i gk
  vnoremap k gj
  vnoremap j h
  vnoremap l l

  "      i=gk
  "j=gh  k=gj  l=gh
  "       
  "2.38 Changed: Edit mode -- Undid 2.33, 2.34, 2.36 -- I and L are used too much, plus J needed for join 
  "2.33 Removed: inoremap <C-k> ->  ESC
  "Insert: Ctrl-movement keys move cursor"
  "over-ride default: Ctrl-J insert <CR>
  "over-ride default: Ctrl-K insert literal
  "  In insert mode Ctrl-Q can be used instead
  "Vim BUG: <Esc>ha
  "  When the cursor is at the bol (Begin of Line), Ctrl-J leaves insert
  "BUG: Shitty VIM keyboard handling can't distuingish betwen TAB and Ctrl-I
  "inoremap <Ctrl-i> <Up>    "
  "inoremap <Tab>            "since gVim can't tell the difference...
  "inoremap <C-i> <Tab>
  "Work-around: Use the default tab key in insert mode: <c-I> <Tab>
  "OR: Use Shift-Space to insert Tab
  inoremap <C-i> <Up>
  inoremap <C-j> <Left>
  inoremap <C-k> <Down>
  inoremap <C-l> <Right>

  "2.38 Changed: Edit mode -- Undid 2.33 & 2.34 -- I and L are used too much, plus J needed for join 
  "inoremap <C-k> <Esc>
  "vnoremap <C-k> <Esc>

  "Shift-Arrows = Scroll window"

  "2.34 Changed: noremap <S-i>  ->  <PageUp>   Edit: shift-i j k l   now moves cursor
  "  http://vimdoc.sourceforge.net/htmldoc/scroll.html"
  "Note: Shift-J (Join Lines) has been remapped to Alt-D -- use :join if ALT is broken"
  "      now Alt-J
  "Scroll window up 1 Line"
  "Scroll window down 1 Line"
  "Scroll window left 1 char"
  "Scroll window right 1 char"
  "noremap <S-i> <C-y>
  "noremap <S-k> <C-e>


  "noremap <S-j> zh
  "noremap <S-l> zl
  "noremap <C-i> <PageUp>
  "noremap <C-j> :call ToggleCursorHome()<CR> "noremap <C-k> <PageDown>
  "noremap <C-l> $
  "2.50 C-u and C-d
  "2.49
  noremap <C-i> <C-u>
  noremap <C-k> <C-d>
  noremap <C-j> :call ToggleCursorHome()<CR>
  noremap <C-l> :call ToggleCursorEnd()<CR>
  noremap <C-g> :call ToggleCursorBeginOfFile()<CR>

  "2.35 Removed: noremap <C-i> page up -> default, so TAB works
  "Ctrl-Arrows = Move cursor around window"
  "Page Up "
  "Page Down"
  "noremap <C-i> <C-b>
  "noremap <C-k> <C-f>

  "Old: Start/End Line C-j ^ C-l $  A-i H  A-k L
  "New: Prev/Next Word
  "noremap <C-j> b
  "noremap <C-l> w

  "Alt+Up/Down = Move cursor to top,middle,bottom of window
  "Move the cursor to the top of the window
  "Move the cusor to the bottom of the window
  "(Default) Shift-M Move the cursor to the middle of the window
  noremap <A-i> H
  noremap <A-k> L
  "Shift-M is default to move to middle of screen

  "Command: Ctrl-Up/Down Arrows = recall prev/next history/command
  "Command: Ctrl-Left/Right = move cursor
  cnoremap <C-i> <C-p>
  cnoremap <C-k> <C-n>
  cnoremap <C-j> <Left>
  cnoremap <C-l> <Right>

  "2.28 Added: Alt-j toggle move cursor soft/hard BOL (beginning of line)
  "If cursor at hard BOL, move to soft BOL
  "else move cursor to hard BOL
function! ToggleCursorHome()
    if ((col('.') - 1) == 0)
        :call feedkeys('^')
    else
        :call feedkeys('0')
    endif
  endfunction

function! ToggleCursorEnd()
    if (col('.') == (col('$') - 1))
        :call feedkeys('^')
    else
        :call feedkeys('$')
    endif
  endfunction

  "2.42 Changed: G -> top of file / bottom of file
  " line('$')
function! ToggleCursorBeginOfFile()
    if (line('.') != 1)
        :call feedkeys('1G','n') " 'n' no remap keys -- to prevent recursion if assigned to G
    else
        :call feedkeys('G','n') " 'n' no remap keys -- to prevent recursion if assigned to G
    endif
endfunction
"noremap G :call ToggleCursorEndOfFile()<CR>
"noremap G :if (line('.') == 1) :call feedkeys('1G','n') :else :call feedkeys('G','n') :endif<CR>

  "Alt+Left/Right = Word movement"
  "Back word"
  "Forward word"
  "Back WORD"
  "Forward WORD"
  "Start of Line"
  "End of Line"
  "Old: prev/next Word
  "New: Start/End line
  "  noremap <A-j> ^
  noremap <A-j> :call ToggleCursorHome()<CR>
  noremap <A-l> :call ToggleCursorEnd()<CR>

  "2.38 Changed: Edit mode -- Undid 2.33, 2.34, 2.36 -- I and L are used too much, plus J needed for join 
  "2.36 Changed: Alt-j back word -> join lines 
  "noremap <A-J> B
  "noremap <A-L> W
  "noremap <A-j> J 

  "Alt-Arrows scroll window"
  "map <A-Down> gj"
  "map <A-Up> gk"
  "imap <A-Up> <ESC>gki"
  "imap <A-Down> <ESC>gji"

  "Move to start/end of file"
  "noremap <A-I> 1G"
  "noremap <A-K> 0G"

  "2.41 Removed: 2.40 .. slows down the input too much
  "2.40 Added:  $$ move to top of file (to compliment G move end-of-file)
  "noremap $$ 1G


"}

