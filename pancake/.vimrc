set runtimepath=$HOME/pancake/vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after

source ~/pancake/vim/.vimrc

try
source ~/pancake/quick_configs.vim
catch
endtry

" quick editing and reloading configs
map <leader>e :e! ~/pancake/quick_configs.vim<cr>
autocmd! bufwritepost ~/pancake/quick_configs.vim source ~/pancake/quick_configs.vim
