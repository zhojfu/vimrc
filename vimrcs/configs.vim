" let g:airline_mode_map = {
"       \ '__' : '-',
"       \ 'n'  : 'N',
"       \ 'i'  : 'I',
"       \ 'R'  : 'R',
"       \ 'c'  : 'C',
"       \ 'v'  : 'V',
"       \ 'V'  : 'V',
"       \ '' : 'V',
"       \ 's'  : 'S',
"       \ 'S'  : 'S',
"       \ '' : 'S',
"       \ }
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'
set autochdir

" map <F5> :%s/<\([^>]\)*>/\r&\r/g<enter>:g/^$/d<enter>vat=

" use xmllint format xml
map <silent> <C-c><C-x>  :%!xmllint --format -<cr>

let g:syntastic_auto_loc_list=1
map <leader>h :e! ~/.vim/vimrcs/notes.md<cr>
let g:cpp_class_scope_highlight = 1

let g:auto_save = 1
let g:auto_save_no_updatetime = 1
" let g:auto_save_slient = 1
" let g:auto_save_events = [ "CursorHold", "CursorHoldI", "CompleteDone", "InsertLeave", "TextChanged" ]
nmap <silent> <C-c><C-g> :GitGutterToggle<CR>
nmap <silent> <C-c><C-s> :SyntasticToggleMode<CR>

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
