"----- Delete ----{

  "d        delete char Default: x
  "Shift-d  backspace
  "Ctrl-d   del line    Default: dd
  "Alt-d    join line   Default: Shift-J
  "Ctrl-Shift-d del EOL"
  "  :help map-alt-keys
  "noremap d x
  "noremap D X
  noremap <A-d> <S-j>
  "2.32 Removed: <C-d> dd   -> normal: half-page down
  "noremap <C-d> dd
  "Vim BUG: Ctrl-Shift-d doesn't work in vim !?
  "noremap <C-S-d> <S-j>

  "noremap x d
  "noremap X D

  "DEFAULT Insert: Ctrl-D  Undent
  "DEFAULT Insert: Ctrl-T  Indent
  "Insert: Ctrl-d del
  "inoremap <C-d> <Esc>Xi
  inoremap <C-d> <Del>

  "Normal: Backspace delete line above
  "Normal: Shift-Backspace delete line below
  nnoremap <silent><Backspace> m`-dd``
  nnoremap <silent><S-Backspace> m`+dd``

"}

