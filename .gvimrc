:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

set guifont=Inconsolata-g_for_Powerline:h14
set guitablabel=%t
set linespace=-3
set clipboard=unnamed
set showtabline=2
set laststatus=0
set mouse=a
set noballooneval

hi MatchParen guibg=lightgrey guifg=NONE

macmenu &Tools.Make key=<nop>
macmenu &File.Close key=<nop>
macmenu &File.New\ Window key=<D-S-n>
macmenu &File.New\ Tab key=<D-n>
macmenu &File.Print key=<nop>
macmenu File.Open\ Tab\.\.\. key=<nop>
macmenu Window.Select\ Next\ Tab key=<nop>
macmenu Window.Select\ Previous\ Tab key=<nop>

map <D-t> :CtrlP<CR>
map <D-r> :CtrlPBufTag<CR>
map <D-w> :tabclose<cr>
imap <D-t> <ESC>:CtrlP<CR>
nmap <D-/> :TComment<cr>
vmap <D-/> gc
map <D-F> :call SearchInFiles()<cr>
map <D-p> :CtrlPTag<cr>

" Mouse bindings
nmap <C-LeftMouse> <LeftMouse>vvt.<leader>d

" Tab navigation
nmap <D-]> gt
imap <D-]> <esc>gt
nmap <D-[> gT
imap <D-[> <esc>gT

