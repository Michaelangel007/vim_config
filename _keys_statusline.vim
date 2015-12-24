"----- Status Keys -----{

  "Note: The ruler and statusline by default are mutually exclusive!
  "
  "The default ruler has been hard-coded in Vim source 'screen.c', func: win_redr_ruler()
  "  http://choorucode.wordpress.com/2010/11/28/vim-ruler-and-default-ruler-format/
  "  :set rulerformat=%-14.(%l,%c%V%)\ %P
  "The 'showcmd' can display up to 10 chars at once.
  "
  "We are NOT using the ruler since we are using a custom status line instead
  "   set ruler
  "
  "To debug who is setting the ruler:
  "   :verbose set ruler?
  "
  "
  "The types of messages displayed on the bottom status line is determined by:
  "
  "  ruler  showcmd   statusline   laststatus   What is displayed
  "------------------------------------------------------------------
  "  off    off       default      1            n/a, but initial: "File" [Status] # lines, # characters
  "  on     off       default      1            %-14.(%l,%c%V%)\ %P
  "  on     on        default      1            %10<command><default ruler>
  "  on     on        default      2            %F<default ruler>
  "                                             %10<command>
  "  on     on        custom       1
  "  on     on        custom       2
  "
  "If the 'ruler' is on, and 'showcmd' is on
  "The command(s) will be shown on the same line as the ruler, but before it
  "   :set showcmd
  "Example:
  "   123
  "If a custom 'statusline' has been set, then
  "   :set statusline=%5l,%3v

  "Legend:
  " T  Tab inserts tab/spaces    Ctrl-Tab (can't use Ctrl-Alt-Space)
  " W  Word wrap on/off          (Ctrl-Space)
  " s  White space displayed     (Alt-Space)
  " *  Cursor at tabstop?
  " /  Search results hilighted on/off

  "New 'space' keys for toggling whitespace/wordwrap/tabs
  "Insert:  Shift-Space  insert hard/soft <Tab>
  "Insert:  Ctrl-Space   toggle hard/soft tab
  "Insert:  Alt-Space    auto-complete
  "Normal:  Shift-Space  Toggle tab insert tab/space
  "Normal:  Ctrl-Space   Toggle display whitespace
  "Normal:  Alt-Space    Toggle Word Wrap   

  "2.43 Normal: Shift-Space Toggle Hard/Soft tabs -> Insert: Ctrl-Space
  :inoremap <S-Space> <Tab>
  :inoremap <C-Space> <Esc>:set expandtab!<CR>a
  "2.44 Insert:	Alt-Space auto-completion
  :inoremap <A-Space> <C-p>

  "Vim BUG: Can't bind Ctrl-Alt-Space
  ":map <C-A-Space> :set expandtab!<CR>
  ":noremap <C-Tab> :set expandtab!<CR>
  "does nothing..."
  :noremap <S-Space> zz
  :vnoremap <Space> <Tab>

  "  *sigh* Cygwin Ctrl-Space and Alt-Space can not be used as they are the Windows System Accelerator keys"
  "map <A-Space> :set nolist!<CR>
  :noremap <C-Space> :set nolist!<CR>

  "Ctrl-Space = Toggle word wrapping"
  "map <C-Space> :set nowrap!<CR>
  :noremap <A-Space> :set nowrap!<CR>

"}
