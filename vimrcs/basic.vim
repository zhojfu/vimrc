"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
set history=1000
set number
set relativenumber

filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax enable

set encoding=utf8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

set ffs=unix,dos,mac

" Set to autoread when the file is changed outside vim
set autoread

let mapleader = ","
let g:mapleader = ","

" use auto save, save the changes
" map <leader>w :w!<cr>
" imap <leader>w <esc>:w!<cr>
" command W w !sudo tee % > /dev/null

" remove the default C-c map
map <C-c> <Nop>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM View
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7
set wildmenu

set wildignore=*.o,*.pdb,*~,*.pyc,*.obj
if has("win16") || has("win32")
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.dll,*\\.git\\*,*\\.hg\\,*\\.svn\\
else
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/.hg/*,*/.svn/*
endif
" A buffer become hidden when it is abandoned
set hidden

set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

" turn on magic for regular expressions
set magic

set lazyredraw

" show matching brackets when indicator is over them
set showmatch
" how many tenth of a seconds to blink when matching brackets
set mat=2

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" No sound on errors
set noerrorbells
set novisualbell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set writebackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use spaces instead of tab
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set linebreak
set textwidth=500

set autoindent
set smartindent
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vmap <silent> * :call VisualSelection('f', '')<CR>
vmap <silent> # :call VisualSelection('b', '')<CR>

map <expr>j (v:count == 0 ? 'gj' : 'j')
map <expr>k (v:count == 0 ? 'gk' : 'k')

" <space> to search, ctrl-<space> to backwars search
map <space> /
map <c-space> ?

map <silent> <leader><cr> :noh<cr>

map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Close all buffers
map <leader>ba :1, 1000 bd!<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<space>
map <leader>tt :tabnext<space>

" opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,split,vsplit,newtab
  set showtabline=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^


" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

map <silent> <leader>rtw :call DeleteTrailingWS()<CR>
map <silent> <C-c><C-m> :call DeleteTrailingWS()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer.md<cr>

" Quickly open a markdown buffer for daily record
map <leader>x :e ~/Daily/<c-r>=strftime("%Y_%m_%d").".md"<cr><cr>


" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

nmap Y y$


" insert newline without entering insert mode
nmap <S-Enter> O<Esc>j
nmap <A-p> O<esc>p
map! <A-p> <esc>O<esc>p
" jump to buffer's dir when enter the buffer
autocmd BufEnter * silent! lcd %:p:h

" show command history
nmap <leader>h q:

" repeat the last command
nmap <leader>l :@:<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Copy & paste functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <Leader>c "+y
vmap <Leader>x "+d
nmap <Leader>v "+p
vmap <Leader>v "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Select All
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>a ggVG

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ag<space>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>
nmap <silent> ccl :cclose<cr>

" Map F12 to show current file in explorer
if has("win16") || has("win32")
    nmap <silent><F12> :silent !start explorer /select,%:p<CR>
    imap <silent><F12> <Esc><F12>
endif

" F11 to maximum or restore window
map <silent><F11> :call MaxRestoreWindow()<CR>

" map <silent> <Tab> <C-W>W:cd %:p:h<CR>:<CR>

" map <silent> <C-Tab> :tabNext<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>eDeleteTillSlash()<cr>
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

let g:WindowMaximized = 0
function! MaxRestoreWindow()
if g:WindowMaximized == 1
    let g:WindowMaximized = 0
    " restore the window
    :simalt ~r
else
    let g:WindowMaximized = 1
    " maximize the window
    :simalt ~x
endif
endfunction

func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc
