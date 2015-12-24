
                


"=== Status Lines ===
  "http://vimdoc.sourceforge.net/htmldoc/windows.html
  "Always show a status line, so that we can see 'showcmd' on the msg line"
  set laststatus=2

  set statusline=

  "see: set break=
  function! ShowWrap()
    return &wrap ? 'W' : '-'
  endfunction

  function! ShowTab()
    return &expandtab ? '-' : 'T'
  endfunction

  function! ShowSpace()
    return &list ? 's' : '-'
  endfunction

  function! ShowSearch()
    return &hlsearch ? '/' : '-'
  endfunction

  "  http://vim.wikia.com/wiki/Showing_syntax_highlight_group_in_statusline
  function! ShowHighlightGroup()
    return synIDattr(synID(line("."),col("."),1),"name")
  endfunction

  function! TotalBuffers()
    return len(filter(range(1,bufnr('$')),'buflisted(v:val)')) 
  endfunction

  "To decode the meta-chars for the statusline
  "  :help statusline
  "Also see:
  "  :help option-backslash
  "   l   Line Number
  "   v   virtual column number
  "
  "   b   Decimal for char under cursor
  "   B   Hex for char under cursor
  "
  "   F   File name: [No Name]
  "   t   short file name

  "   m   modified: [+][[-]
  "
  "   r   readonly flag: [RO]
  "   h   help buffer [help]
  "   w   Preview window flag
  "   p   Percentage
  "
  "   =   Right Align following text
  "
  "vim sucks out-of-the-box! The ruler/status line has no visible
  "indicator if Word Wrap has been turned on, or if White Space is visible
  "
  "Displaying whitespace? :set statusline=%{(&list?\"spc\":\"---\")}
  "Word wrap turned on?   :set statusline=%{(&wrap?\"Wrap\":\"----\")}
  "Example:     1,  1  Char: 77 0x4D  ~/t.x[RO]  unix RPCGEN   12%"
  "set statusline=%5l,%3v\ \ Char:\%3.3b\ 0x\%02.2B\ \ %-40.(%F%m%r%h%w\ \ %{&ff}\ %Y%)\ %{(&list?\"spc\":\"---\")}\ %{(&wrap?\"Wrap\":\"----\")}\ %3p%%
  "set statusline=%5l,%3v\ Chr:\%3.3b\ 0x\%04.4B\ %-.43(%F%m%r%h%w\ %{&ff}\ %Y%)\ %=%{(&wrap?\"Wr\":\"--\")}%{CharCursorTabStop()}%{(&list?\"spc\":\"---\")}\ %3p%%
  function! CustomStatusLine()
  "  set statusline=%5l,%3v\ Chr:\%3.3b\ 0x\%04.4B\ %-.43(%F%m%r%h%w\ %{&ff}\ %Y%)\ %=%{(&expandtab?\"T\":\"-\")}%{(&wrap?\"W\":\"-\")}%{(&list?\"s\":\"-\")}%{CharCursorTabStop()}%{(&hlsearch?\"/\":\"-\")}\ %3p%%
    "set statusline=%5l,%3v\ Chr:\%3.3b\ 0x\%04.4B\ %-.43(%f%m%r%h%w\ %{&ff}\ %Y%)\ %{ShowHighlightGroup()}\ %=%{ShowTab()}%{ShowWrap()}%{ShowSpace()}%{CharCursorTabStop()}%{ShowSearch()}\ %3p%%
    set statusline=%5l,%3v\ 
    set statusline+=Chr:\%3.3b\ 0x\%04.4B\ 
    set statusline+=%-.43(%t%m%r%h%w\ %{&ff}\ %Y%)\ 
"2.25 Fixed: swapped order of statusline from: {CursorStructureName} #/#
    set statusline+=%(%n/%{TotalBuffers()}%)\  
    set statusline+=%{ShowHighlightGroup()}\ 
    set statusline+=%=
    "set statusline+=%#Question#
    set statusline+=%{ShowTab()}
    set statusline+=%{ShowSpace()}
    set statusline+=%{ShowWrap()}
    set statusline+=%{CharCursorTabStop()}
    set statusline+=%{ShowSearch()}\ 
    set statusline+=%3p%%
  endfunction

  noremap <silent> <A-r> :call CustomStatusLine()<Cr>
  :call CustomStatusLine()

  "set statusline=%CustomStatusLine()

  "Defaults:
  "Tab       -> ^I
  "Shift Tab -> S-Tab     :noremap <S-Tab> aShiftTab
  "Ctrl  Tab -> C-Tab     :noremap <C-Tab> aCtrlTab

  "Inspired from: http://vim.wikia.com/wiki/Statusline_tab_level_ruler
  "Return: Char '*' if cursor on tabstop column, else ' '
function! CharCursorTabStop()
  "let TabLevel = (indent('.') / &ts )
  let c = col( '.' ) - 1
  let TabLevel = c % &ts
  let TabCol = c / &ts
  if (TabLevel == 0) && (c > 0)
    let TabLevel='*'
  else
    let TabLevel='-'
  endif
  return TabLevel
endfunction

  "Alt-T Tab Ruler"
  "Bugs: a) if showing Lines Numbers, need to indent Line Width
  "-------|-------|-------|-------|-------|-------|-------|-------|
  "noremap <silent> <A-t> :set statusline=\-\-\-\-\-\-\-\+\-\-\-\-\-\-\-\+\-\-\-\-\-\-\-\+\-\-\-\-\-\-\-\+\-\-\-\-\-\-\-\+\-\-\-\-\-\-\-\+\-\-\-\-\-\-\-\+\-\-\-\-\-\-\-\+\-\-\-\-\-\-\-\+\-\-\-\-\-\-\-\+<Cr>
  noremap <silent> <A-t> :set statusline=\"------+-------+-------+-------+-------+-------+-------+-------+-------+-------+"<CR>

"  http://vim.wikia.com/wiki/Statusline_tab_level_ruler

  "Change the default background color of the statusline when starting Vim
  "See Syntax/Colors/Highlight

"Name of file  TextMode:Dos,Unix  Filetype, Char: Ascii,Hex   Position: Row,Col" Total Lines"
  "  http://www.linux.com/archive/feature/120126"
  "  Example: < [FORMAT=unix]  [TYPE=RPCGEN] [ASCII=077] [HEX=4D] [POS=0001,0001][12%] [LEN=8]"
  "  set statusline=%F%m%r%h%w\ \ [FORMAT=%{&ff}]\ \ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 

  "http://vim.1045645.n5.nabble.com/Show-ruler-at-bottom-line-instead-of-statusline-td3378371.html
  "set statusline=%<%f\ %h%m%r%=%k[%{(&fenc\ ==\\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}][U+%04B]\ %-12.(%l,%c%V%)\ %P  

  "How many lines to use for messages at the bottom"
  "cmdheight=3"

 "Do not clutter up directories with backup ~ files
  set nobackup

  "To get help on a key
  "  :help keycodes
  "Enter diagraph: Ctrl-K {char1} {char2}
  "  :help c_CTRL-K
  "http://newbiedoc.sourceforge.net/text_editing/vim.html.en#MODES-VIM

  "Insert: Allow backspacing over everything in insert mode
  set backspace=indent,eol,start
"}


