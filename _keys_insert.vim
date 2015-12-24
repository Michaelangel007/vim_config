"----- Insert -----{

  "Note: 'i' is taken for cursor movement"
  "2.51
  "Insert: under cursor"
  "Insert: before cursor"
  "noremap a i
  noremap A i
  "2.50
  "Insert: before cursor"
  "Insert: after cursor"
  "noremap a i
  "noremap A a

  "Normal: Insert at end of line
  "(The defalt is Add <n> to the number at the cursor
  "noremap <C-a> A

"BUG: Doesn't work ... yet
  cnoremap <A-v> <C-v>

  "  http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
  "  Bad: Doesn't keep the cursor in the same position
  "  Bad: noremap <S-Enter> O<Esc>j
  "  Bad: noremap <CR> o<Esc>k
  "  Fix: Set temp mark, insert line, goto mark
  "Normal: Enter = Insert blank line above cursor line stay on same line
  "Normal: Shift-Enter = Insert blank line below cursor line stay on same line
  noremap <Enter> mtO<Esc>`t
  noremap <S-Enter> mto<Esc>`t

  "Insert: insert blank line below cursor line, keep cusor position"
  "  Bad: <Esc>o
  inoremap <S-Enter> <Esc>mto<Esc>`ta
  "BUG: Vim complains if trying to unmap a key that hasn't been mapped...
  "iunmap <S-Enter>
  "

  "http://vim.wikia.com/wiki/Insert_in_normal_mode
  "Normal Mode: space = insert space without moving cursor, return to normal
  "nnoremap <Space> i<Space><Esc>
  "Normal Mode: space = insert space before, move cursor right
  nnoremap <Space> i<Space><Esc>l

  "Command: Ctrl-V to paste -- $VIMRUNTIME/mswin.vim
  "  cnoremap <C-v> "+gy
  cnoremap <C-v> <C-R>+ 

"TODO:  behave mswin
"TODO: Command: allow Alt-V to insert literal -- no need, since Ctrl-Q does same thing

  "2.23 insert mode:  Ctrl-F forward page
  "2.22 insert mode:  Ctrl-B back page
  inoremap <C-f> <PageDown>
  inoremap <C-b> <PageUp>

"}

