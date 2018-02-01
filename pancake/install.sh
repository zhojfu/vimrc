#!/bin/sh

set -e

APP_PATH="$HOME/pancake/vim"

setup_plug() {
    local system_shell="$SHELL"
    export SHELL='/bin/sh'

    vim \
        -u "$1" \
        "+set nomore" \
        "+PlugInstall!" \
        "+PlugClean" \
        "+qall"

    export SHELL="$system_shell"

    echo "Now updating/installing plugins using vim plug"
}

echo backup original vimrc
cp ~/.vimrc ~/.vimrc.orig

echo 'set runtimepath=$HOME/pancake/vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after
source ~/pancake/vim/.vimrc

try
source ~/pancake/quick_configs.vim
catch

" quick editing and reloading configs
map <leader>e :e! ~/pancake/quick_configs.vim<cr>
autocmd! bufwritepost ~/pancake/quick_configs.vim source ~/pancake/quick_configs.vim
endtry' > ~/.vimrc

setup_vundle    "$APP_PATH/.vimrc.plug"

echo "installed"

