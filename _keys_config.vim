"----- Config -----{

  "Toggle Line Numbers"
  :noremap <A-3> :set number!<CR>

  "NOTE: This custom Vim config filename is the cross-platform OS friendly name: _vimrc

  "map <F3> :source $VIMRUNTIME\_vimrc<CR>
  ":source '$HOME/vimfiles/.vimrc<CR>
  ":e      '$HOME/vimfiles/.vimrc<CR>
  ":execute 'source '.fnameescape(FOO_PATH).'/foo.vim'
  map <F3>   :execute 'source '.fnameescape(VIM_CONFIG).'/_vimrc'<CR>
  map <S-F3> :execute 'e      '.fnameescape(VIM_CONFIG).'/_vimrc'<CR>

"}

