"----- Searching -----{

  " /    search for string
  " <CR> Edit cursor at found string
  " n    goto next search result
  " N    goto prev search result
  " *    search for word under cursor

  "  http://www.jonlee.ca/hacking-vim-the-ultimate-vimrc/ 
  "Hightlight partial matches while searching"
  set incsearch
  set ignorecase
  set smartcase
  set hlsearch

  "Shift-5  (%)  Goto matching character
  "See: syntax match <CustomName_Braces> display '...'
  "TODO:  Match # in C/cpp ? 
  :set matchpairs=(:),{:},[:],<:>,?:\:

"}

