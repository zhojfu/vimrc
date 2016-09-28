set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-projectionist'
Plugin 'jlanzarotta/bufexplorer'
Plugin '907th/vim-auto-save'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'Shougo/vimproc.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'kana/vim-textobj-user'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'mbbill/undotree'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move and Position
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Lokaltog/vim-easymotion'
Plugin 'christoomey/vim-sort-motion'
Plugin 'wellle/targets.vim'
Plugin 'wincent/command-t'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'junegunn/goyo.vim'
Plugin 'nathanaelkane/vim-indent-guides'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'reedes/vim-thematic'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/peaksea'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-colors-pencil'
Plugin 'Lokaltog/vim-distinguished'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" js intelligence plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'ternjs/tern_for_vim'
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'helino/vim-json'
Plugin 'mxw/vim-jsx'
Plugin 'digitaltoad/vim-pug'
Plugin 'kchmck/vim-coffee-script'
Plugin 'plasticboy/vim-markdown'
Plugin 'nelstrom/vim-markdown-folding'

Plugin 'majutsushi/tagbar'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SCM plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/vimshell.vim'
Plugin 'xolox/vim-misc'

Plugin 'vimwiki/vimwiki'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/file_types.vim
source ~/.vim/vimrcs/plugins_config.vim
source ~/.vim/vimrcs/abbreviations.vim
source ~/.vim/vimrcs/themes.vim
try
    source ~/.vim/vimrcs/configs.vim
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim/vimrcs/configs.vim<cr>
autocmd! bufwritepost ~/.vim/vimrcs/configs.vim source ~/.vim/vimrcs/configs.vim

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

imap <C-c> <CR><Esc>O
