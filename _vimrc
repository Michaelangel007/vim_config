"Vim config
"Michael Pohoreski

"To debug .vimrc / _vimrc
"  Inside vim source/script file:
"    echo "Debug Text..."
"  Start vim
"    vim -u NONE -D -S .vimrc
"To re-read this script file into [g]Vim:
"  :source %
"On OSX
"   ln -s ~/.vim/_vimrc ~/.vim/vimrc
"   Also:   System Preferences, General,
"      [ ] Use LCD font smoothing when available
"      Turn off text smoothing for font sizes 8 and smaller
"or
"    ~/.gvimrc
"      source _vimrclet VIM_COLORS=$HOME."/.vim/_colors.vim"

" TODO!! Must check if overwriting work _vimrc --- Shift-S V

"Vim fixes:
"   Replaced Vim's retarded (HJKL) movement keys -> I J K L (like WASD)
"
"        I
"      J K L
"
"   Insert mode: keys to move the cursor
"             Ctrl-I
"      Ctrl-J Ctrl-K Ctrl-L
"   Insert mode: Del char: Ctrl-D
"   Normal  Ctrl-Space Toggle whitespace
"   Insert  Ctrl-Space Toggle tab/shift insert

"Vim has crappy keyboard mappings
"   Ctrl-Shift-I  
"   Ctrl-Shift-,  aka  Ctrl-<
"   Ctrl-Shift-.  aka  Ctlr->
"BUG: gVim is unable to distinguish between Ctrl-<char> Ctrl-Shift-<char>
"  inoremap <C-d>   Ctrl-D
"  inoremap <C-D>   Ctrl-Shift-D
"  inoremap <C-S-d> Ctrl-Shift-D

"Version history
  "2.59 -- Commit to git
  "2.58 -- removed / prefix from config files so 'gf' works on them
  "2.57 -- Auto change to directory when opening file
  "2.56 -- moved half of config/keys to separate files
  "2.55 -- removed F4, Shift-F4 since unified F3 to edit vim config
  "2.54 -- added VIM_CONFIG for Windows, OSX, Linux
  "2.53 -- add Javascript Operator Colors
  "2.52 -- color cleanup sync to WebStorm
  "2.51 --FORK-- a and A; 'a' does insert-after, 'A' does insert-before 
  "2.50b --FORK-- OSX font change!"
  "2.50 reverted 2.49, Changed: noremap <C-i> <C-u> (scroll window up) and noremap <C-k> <C-d (scroll window downwards)
  "     The problem with <C-b> was that if the cursor was on the last line of the first page would not move the cursor up towards line 1
  "2.49 Fixed: noremap <C-i> from <C-u> to <C-b> in order to be consistent with <C-k> and have consistent scrolling
  "2.48 changed default font size 16 to 8 on OSX 10.8
  "2.47 added note about OSX Font Smoothing
  "2.46 added note about _statusline.vim
  "2.45 added ,e ,t ,s for file browsing
  "2.44 Insert: Alt-Space auto-completion
  "2.43 OSX 10.7 broke line breaks, 414, (ProggyFont) 465
  "2.42 Changed: G -> bottom of file / top of file
  "2.41 Removed: 2.40 .. slows down the input too much
  "2.40 Added:  $$ move to top of file (to compliment G move end-of-file)
  "2.39 Changed: Ctrl-S now toggles cursor to end of line / beginning of line
  "2.38 Changed: Edit mode -- Undid 2.33, 2.34, 2.36 -- I and L are used too much, plus J needed for join 
  "2.37 Added:  block comment - +
  "2.36 Changed: Alt-j back word -> join lines 
  "2.35 Removed: noremap <C-i> page up -> default, so TAB works
  "2.34 Changed: noremap <S-i>  ->  <PageUp>   Edit: shift-i j k l   now moves cursor
  "2.33 Removed: inoremap <C-k> ->  ESC
  "2.32 Removed: <C-d> dd   -> normal: half-page down
  "2.31 Removed: <C-o> open/edit filename    need to use goto prev mark
  "2.30 Removed: ; -> eol   need to use repeat find char
  "2.29 Fixed: Set font and size, for Ubuntu and OSX
  "2.28 Added: Alt-j toggle move cursor soft/hard BOL (beginning of line)
  "2.27 Changed: tabstop and shiftwidth 2 -> 4
  "2.26 Fixed: MacVim  :set invmmta to use Option key as Alt key instead of ins special char
  "2.25 Fixed: swapped order of statusline from: {CursorStructureName} #/#
  "2.24 added: \ -> :Explore<CR>
  "2.23 insert mode:  Ctrl-F forward page
  "2.22 insert mode:  Ctrl-B back page
  "2.21 disabled Ctrl-N Window N -> default: line down
  "2.20 fixed linebreak by including only if has gui 
  "2.19 fixed visual highlight for terminals 
  "2.18 added bg colors for lines wider then 80 cols
  "2.17 fixed custom colors to work in cterm
  "2.16 removed ;; -> Esc -- Not needed as Ctrl-C functions as Escape!
  "2.15 colorscheme lists
  "2.14 Removed x X d D swap
  "2.13 Mac - errorbell
  "2.12
  "  Fixed bug: Statusline 'T' was inverted
  "  Ctrl-Space Toggle show whitespace
  "  Alt-Space Toggle Word Wrap
  "  Alt-D Dos
  "  Alt-U Unix
  "2.11
  "  made statusline multi-line for easier (partial) config
  "  made Shift-Space insert <Tab> in insert mode
  "  linbreak char is no longer bold
  "  Normal: ; moves to end of line
  "2.10
  "  statusline split into functions
  "  cursorcolumn at column 80
  "  cursorline
  "  marks
  "2.9b
  "  Line Number Width
  "  Normal: Space: folding
  "2.9
  "  Normal:  ;  -> :
  "  Command: ;; -> <Esc>
  "  Ctrl-Tab Toggle TAB inserts tabs/spaces
  "2.8
  "  Add / on status line if highlighting search results (Alt-/ to toggle)
  "  ShowTabStop returns '-' instead of ' '
  "  Add / on status line if highlighting search results (Alt-/ to toggle)
  "  ShowTabStop returns '-' instead of ' '
  "2.7
  "  Add Tab Ruler, Alt-T
  "  Add Custom Ruler as function, Alt-R
  "  fixed broken imap ;; -> map ;;
  "
  "If you have problems with E138 can't write viminfo file
  "due to home directory with spaces, use
  "   Vim -i {path/to/vimfino}


"---------- Path ---------- {
    " http://superuser.com/questions/119991/how-do-i-get-vim-home-directory
    if has("win32") || has("win64")
        "echo "Found Win32/Cygwin"
        let VIM_CONFIG=$HOME."/vimfiles/"
    else "if has("unix")
        "echo "Linux / OSX"
        let VIM_CONFIG=$HOME."/.vim/"
    endif

    "http://stackoverflow.com/questions/840900/vim-sourcing-based-on-a-string
    " http://stackoverflow.com/questions/14508678/how-to-dynamically-source-a-script
    ":execute 'source '.fnameescape(VIM_CONFIG).'/my_vim_config.vim'


  "2.26 Fixed: MacVim  :set invmmta to use Option key as Alt key instead of ins special char
  if has("gui_macvim")
    :set invmmta
  endif


"TODO: Ver 3 split into multiple file
" source _statusline.vim
" source _display.vim
" source _whitespace.vim
" source _movement.vim
" source _insert.vim
" source _delete.vim
" source _search.vim
" source _colors.vim
" source _fileformat.vim
" source _modes.vim
" source _indent.vim
" source _folding.vim
" source _notes.vim
" source _tabs.vim

    "Old exec
    "execute 'source '.fnameescape(VIM_CONFIG).'_config_general.vim'

    let source_vim_config='source '.fnameescape(VIM_CONFIG).'/'
    "Note: General must come first -- it turns off the splash screen
    execute expand(source_vim_config).'_config_general.vim'

    execute expand(source_vim_config).'_config_colors.vim'
    execute expand(source_vim_config).'_config_display.vim'
    execute expand(source_vim_config).'_config_folding.vim'
    execute expand(source_vim_config).'_config_search.vim'
    execute expand(source_vim_config).'_config_statusline.vim'
    execute expand(source_vim_config).'_config_whitespace.vim'

    execute expand(source_vim_config).'_keys_bookmarks.vim'
    execute expand(source_vim_config).'_keys_config.vim'
    execute expand(source_vim_config).'_keys_movement.vim'
    execute expand(source_vim_config).'_keys_insert.vim'
    execute expand(source_vim_config).'_keys_delete.vim'
    execute expand(source_vim_config).'_keys_indent.vim'
    execute expand(source_vim_config).'_keys_search.vim'
    execute expand(source_vim_config).'_keys_statusline.vim'

    execute expand(source_vim_config).'_syntax_js.vim'

  "Did you know ... Vim has a pseudo built-in ASCII Table!
  "http://www.vim.org/scripts/script.php?script_id=616
  noremap <A-a> :digraph<CR>




"---------- Modes ----------{

  "Map a quick way to enter normal mode as Escape is too far to reach top-left.
  "  :help 'timeout'
  "Other solutions are to use a keyboard remapping and swap CapsLocks <-> Esc.
  "  http://vim.wikia.com/wiki/Map_caps_lock_to_escape_in_Windows
  "   Map CapsLock to Escape, and ScrollLock to CapsLock
  "    REGEDIT4
  "    [HKEY_CURRENT_USER\Keyboard Layout]
  "    Scancode Map"=hex:00,00,00,00,00,00,00,00,03,00,00,00,3a,00,46,00,01,00,3a,00,00,00,00,00
  "  Format: <00000000> <00000000> <NumberFollowingIntegers> <Mapping1> <Mapping2> ... <00000000>
  "2.16 Not needed as Ctrl-C functions as Escape!
  "imap ;; <Esc>
  "vmap ;; <Esc>
  "cmap ;; <Esc>

  "2.30 Removed: ; -> eol   need to use repeat find char
  "Normal:  When editing .c/.cpp files, ';' takes you to end of line
  "noremap ; $
  "Normal: Don't require Shift for ':' -- takes a while to "break" this habbit "though!
  "map ; 

"2.24 added: \ -> :Explore<CR>
  "Usage: Press \ to display file browser. Press Ctrl-O to get back out.
  noremap \ :Explore<CR>

  "Fix since :Explore is hard-coded 'i' to change sort order!
  "The proper solution is to use:   autocmd filetype netrw call 
  "http://unix.stackexchange.com/questions/31575/remapping-keys-in-vims-directory-view
  noremap h <Up>

  "augroup netrw_custom_keys
  "  autocmd!
  "  autocmd filetype netrw call NetrwCustomKeys()
  "augroup END
  "
  "function! NetrwCustomKeys()
  "  noremap i h
  "endfunction


"}


"---------- File Format ----------{
  noremap <A-d> :set ff=dos<CR>:update<CR>:! unix2dos<CR>
  noremap <A-u> :set ff=unix<CR>:update<CR>:! dos2unx<CR>
"}




"---------- Cut, Copy, Paste ----------{"
  "Assign keys: map <KeyName> <NewBehaviour>
  "Unassigned : unmap <KeyName>

  "Map nonrecurs Mode
  "----+------------------------------"
  "map  noremap  normal, visual, op
  "     nnoremap ONLY normal
  "map!          insert, command-line
  "nmap          normal
  "vmap vnoremap visual and select
  "xmap xnoremap ONLY visual
  "omap          op
  "cmap          command line
  "imap inoremap insert
  "lmap          insert, command, lang-arg

  "Visual Mode: S=Select"
  "Note: "
  "Normal: s       character select mode, like Shift-Arrows in Win editors
  "Normal: Shift-S Line select mode
  "Normal: Alt-S   block select mode, like Alt-Shift-Arrows in Win editors
  noremap s v
  noremap S V
  noremap <A-s> <C-v>

  "Cut: In visual mode, 'd'
  "Paste: The default 'p' is paste after, we want 'P' Paste before"
  "   http://www.techrepublic.com/blog/opensource/create-custom-keybindings-in-vim/659
  "  vmap <C-x> x
  "  vmap <C-c> y
  "  vmap <C-y> <esc>P
  "gVim uses the system clipboard via "+
  "Double-Quote " = use following register name for next delete, put or yank
  "  See: mswin.vim

if has("gui_win32")
  noremap <C-x> "+x
  noremap <C-c> "+y
  noremap <C-v> "+gP
endif

  "Insert: Ctrl-v = paste (using clipboard)
  "Insert: Alt-V  = insert literal
  "  http://superuser.com/questions/61226/how-do-i-configure-vim-for-using-ctrl-c-ctrl-v-as-copy-paste-to-and-from-system-b 
  "  p = cursor will be before pasted text
  "  P = cursor will be after pasted text
  inoremap <C-v> <Esc>"+gp<Esc>a
  inoremap <A-v> <Esc><C-v>
"}

"---------- Window ----------"

  "Note: A file is displayed in a buffer, a buffer may be split into windows
  "Ctrl-o Open/edit file"
  "Ctrl-s Save file
  "Ctrl-n New file {Buffer}
  "Ctrl-w Close file {Buffer}
  "Alt-w  Next file {Buffer}
  "2.31 Removed: <C-o> open/edit filename    need to use goto prev mark
  "noremap <C-o> :e\ 
  noremap <C-s> :w<CR>

  "2.39 Changed: Ctrl-S now toggles cursor to end of line / beginning of line
  "noremap  <C-s> $a
  inoremap <C-s> <Esc>$a

  "   :w <filename>   Create new file
"2.21 disabled Ctrl-N Window N -> default: line down
"  noremap <C-n> <C-w>n
  "not using 'Ctrl-w close window' as too many useful window commands 
  "noremap <C-w> <C-w>c
  "gVim Win32 prevents custum/user Alt-W as it is used for 'Menu Window'
  "  http://vim.1045645.n5.nabble.com/Disabling-Alt-keys-menu-keys-in-Windows-gVim-td1162473.html 
  "  :help 'winaltkeys' 

  "  Ctrl-w t   Move cursor to top window
  "  Ctrl-w b   Move cursor to bottom window
  "  :help window-move-cursor
  "Move cursor to next window
  noremap <A-w> <C-w><C-w>

  "Switch to next buffers
  "Note: You can also use the :e command to switch to a specific buffer number
  "  :e #1   "Switch to buffer 1
  noremap <A-f> :bnext<Cr>

  "Display Buffers
  noremap <A-b> :buffers<Cr>


"----- Directory -----{

  "2.45 added ,e ,t ,s for file browsing
  " http://stackoverflow.com/questions/1708623/opening-files-in-the-same-folder-as-the-current-file-in-vim
  map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
  map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
  map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

"}


"hi Comment    ctermfg=Red guifg=#80a0ff
"hi Constant   ctermfg=Gray guifg=#ffa0a0
"hi Special    ctermfg=LightGray guifg=Orange
"hi Function   ctermfg=DarkCyan guifg=Orange
"hi Identifier ctermfg=DarkGreen guifg=#40ffff
"hi Statement  ctermfg=white guifg=#ffff60
"hi PreProc    ctermfg=Gray guifg=#ff80ff
"hi Type       ctermfg=white guifg=#60ff60
"hi Ignore     ctermfg=black guifg=bg


"---------- Help ----------

  "572 page VIM Tutorial !
  " http://www.truth.sk/vim/vimbook-OPL.pdf

   "Help on Cursor
  ":help guicursor"

"Show Keys that can be bound
"  :help map-which-keys
"  :verbose map {lhs}'
"  :help option"
"  :help {key}{ctrl-d}"
"  :help :NL-used-for-Nul"
"  To bind a key to nothing, <Nop>
"  http://www.shallowsky.com/blog/linux/editors/vim-ctrl-space.html

  "Call user function"
  ":inoremap <F5> <C-O>:call MyVimFunc()<CR>"

  "Insert current directory"
  ":inoremap <F2> <C-R>=expand('%:p:h')<CR>

  "Mapping keys in Vim - Tutorial 1"
  "http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_%28Part_1%29"

" <C-Tab>
" <C-S-Tab>

"List of all keybindings...
"  :help index.txt
"key Normal         Shift                Ctrl          Alt
"a  insert@cursor  insert eol            incr #        
"b                                       <PageUp>      Menu: Buffers
"c
"d  del op
"e                                                     Menu: Edit
"f                                       <PageDown>    Menu: File
"g                  goto line num
"h  cursor left                                        Menu: Help
"i  ins aft cur
"j
"k
"l  cursor right
"m                  cursor middle screen
"n                  goto next search
"o
"p
"q
"r  replace char
"s                                                    Menu: Syntax
"t                                                    Menu: Tools
"u  undo
"v
"w                                 Window     Menu: Window
"x
"y  paste

"gVim Bugs:
"  :help bugs
"
"1. Unable to distinguish Shift-<letter> from Ctrl-Shift-<letter>
"   See: http://vim.1045645.n5.nabble.com/Maping-Ctrl-Shift-s-problems-td1182827.html
"
"2. Unable to distinguish Ctrl-i from Tab
"

"TODO: Doesn't work??
if has("gui_win32")
  noremap <silent> <F2>   :!attrib -r "%"<Cr>
  noremap <silent> <S-F2> :!attrib +r "%"<Cr>
endif


"----- Tabs -----{
  "Show tabs for all windows
  ":tab ball

  " http://stackoverflow.com/questions/102384/using-vims-tabs-like-buffers
  "
  "The default tab behavior sucks for ':!make'
  "It will 'overwrite' the current tab with the errors
  "instead of opening a new tab with the errors
  "
  "Open a new tab (view) for each buffer
  "NOTE: This will break custom diff config scripts
  "      So we only do this if diff mode has NOT been started
  "http://vim.1045645.n5.nabble.com/Diff-mode-only-mappings-td1146738.html
  if &diff
    "There is no command to turn sball off
  else
     tab sball
  endif
"}

