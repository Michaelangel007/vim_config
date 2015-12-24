" Michael Pohoreski
" Fast Visual Diff Vim Script

:hi DiffText gui=none

:set lines=100
:set columns=200

" Make both windows the same size
" Ctrl-W =
:wincmd =
" zi
" Disable code folding for this window
:set nofoldenable

" Switch to next window
:wincmd w
" Disable code folding for this window too..
:set nofoldenable

" Move our window to x,y
:winpos 0 0

"Syncing/Updating left<->right
" With the cursor in the right pane ....
noremap < :diffput<CR>
noremap > :diffget<CR>

"Movement
"Prev/Next diff
noremap [ [czz
noremap ] ]czz
 
