"----- General -----{
  "We don't care about vi"
  :set nocompatible

  :set runtimepath+=~/.vim/after

  "MacVim - Disable annoying Ctrl-C errorbells, use visualbell instead
  "  set eb? vb? t_vb?
  "  set eb noerrorbells
  "  set vb novisualbell 
  "  set t_vb=^[|f
  :set eb vb

  "@see _keys_dir.vim
  "Change directory to the current buffer when opening files.
  set autochdir
  "Alternatively, to use ",cd" to change the working directorty to the file being edited:
  "    nnoremap ,cd :cd %:p:h<CR>
  "http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file

"}

