"----- Indent ----{

  "After selecting lines, pressing '>' to indent removes the selection
  "(You can repeat the indentation on the range via '.')
  "But this keeps the selection 
  "  http://vim.wikia.com/wiki/VimTip224
  :vnoremap > >gv
  :vnoremap < <gv

  " Alternative using Tab/Shift-Tab (for gvim).
  :vnoremap <Tab>   >gv
  :vnoremap <S-Tab> <gv

":map <Tab> <nop>
":map <S-Tab> <nop>

  "2.37 Added:  block comment - +
  "Usage: Use Shift-V to select lines, then press - or +
  noremap + :s/^/\/\//<CR>
  noremap - :s/^\/\///<CR>

"}

