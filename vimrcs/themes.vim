set background=dark
set foldcolumn=1
set cmdheight=2
set ruler
set laststatus=2
set foldcolumn=1

" Set font according to system
if has("mac") || has("macunix")
    set gfn=Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("linux")
    set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("unix")
    set gfn=Monospace\ 11
endif

if has("gui_running")
    colorscheme Solarized
else
    colorscheme desert
endif


let g:thematic#themes = {
\ 'pencil_dark' :{ 'colorscheme': 'pencil',
\                  'background': 'dark',
\                  'airline-theme': 'badwolf',
\                  'ruler': 1,
\                  'laststatus': 0,
\                  'typeface': 'Source Code Pro Light',
\                  'font-size': 10,
\                  'transparency': 10,
\                  'linespace': 4,
\                },
\ 'pencil_lite' :{ 'colorscheme': 'pencil',
\                  'background': 'light',
\                  'airline-theme': 'light',
\                  'laststatus': 0,
\                  'ruler': 1,
\                  'typeface': 'Source Code Pro',
\                  'fullscreen': 1,
\                  'transparency': 0,
\                  'font-size': 10,
\                  'linespace': 2,
\                },
\ 'iawriter'   : { 'colorscheme': 'pencil',
\                  'background': 'light',
\                  'columns': 75,
\                  'font-size': 20,
\                  'fullscreen': 1,
\                  'laststatus': 0,
\                  'linespace': 8,
\                  'typeface': 'Cousine',
\                },
\ 'basic'       :{ 'colorscheme': 'Solarized',
\                  'backgrond': 'dark',
\                  'airline-theme': 'bubblegum',
\                  'laststatus': 2,
\                  'ruler': 1,
\                  'typeface': 'Source Code Pro',
\                  'fullscreen': 0,
\                  'font-size': 12,
\                  'linespace': 2,
\                  'fold-column-color-mute': 1,
\                  'diff-color-fix': 1,
\                },
\ }
let g:thematic#theme_name = 'basic'

if has("gui_running")
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=R  "remove right-hand scroll bar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guioptions-=l  "remove left-hand scroll bar
endif
" Toggling the display of a widget
nmap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nmap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nmap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
