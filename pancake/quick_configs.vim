nmap <leader>s :FSHere<cr>
nmap <leader>sv :FSSplitRight<cr>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
