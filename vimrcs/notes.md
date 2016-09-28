# Vim Common Commands and Bindings
```
:split filename  " split window and load another file
ctrl-w_          " maximize current window (horizontal)
ctrl-w|          " maximize current window (vertical)
ctrl-w=          " make all equal size
10 ctrl-w+       " increase window size by 10 lines
:vsplit file     " vertical split
:sview file      " same as split, but readonly
:hide            " close current window
:only            " keep only this window open
:ls              " show current buffers
:b 2             " open buffer #2 in this window
:resize 60       " resize the window height
:vertical resize 20 " resize the window weight
:gf              " goto file
2gt              " goto tab 2
q:               " show command history
:g/^\s*$/d         " remove all line only has space
:g/^\s*\/\/.*$/d  " remove all line start with //
:g!/^\s*$/d       " remove all line that don't match the re
:set foldmethod=indent  " fold the python file
:marks          " list all the current marks
]c              " next difference
[c              " previous difference
do              " diff obtain
dp              " diff put
zo              " open folded text
zc              " close folded text
:diffupdate     " re-scan the files for differences
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>
" $q is super useful when browsing on the command line
" it deletes everything until the last slash 
cno $q <C-\>eDeleteTillSlash()<cr>


" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
map <silent> <leader>rtw :call DeleteTrailingWS()<CR>

:set ff=unix  " change the line ending to unix
```

# Git Common Commands
change remote tracking branch
Given a branch foo and a remote upstream:

As of Git 1.8.0:

```
git branch -u upstream/foo
```
Or, if local branch foo is not the current branch:

```
git branch -u upstream/foo foo
```
Or, if you like to type longer commands, these are equivalent to the above two:

```
git branch --set-upstream-to=upstream/foo
git branch --set-upstream-to=upstream/foo foo
```


```
#delete a remote branch
git push origin --delete <branchName> 
```

```
#push a branch to remote
git push -u origin feature_branch_name
```

```
# change file encoding to utf8
save as utf-8
set fileencoding=utf8
set bomb
```

# Git window moving
```
# rotates the windows 
Ctrl-W, r 
# swap the current window with the next one
Ctrl-W, x 
# move this window to the far left, bottom, top, right
Ctrl-W, Shift-H
Ctrl-W, Shift-J
Ctrl-W, Shift-K
Ctrl-W, Shift-L
" :help window-moving

* break the undo sequence
* <C-G>u

* smart insert and fixed any unintended
* <C-r><C-p>(register)

* evaluate a expression in insert mode
* <C-r>=n*m<CR>

* Insert unusual characters by character code
* <C-v>{code}
* <C-v>u{1234}
* <C-v>u00bf
* ga command shows character code

* Insert unusual characters by Digraph
* <C-k>{char1}{char2}
* <C-k>?i
* :digraphs show digraph-table 

* repeating input characters
* <C-o>80i-<Esc> (will leave the insert mode)
* <C-o>:norm 80i-<CR> (stay in the insert mode)



*  for more information.
*  delete multiple branches
*  git branch -D `git branch | grep -E 'pattern'`
* 
* 
* vim macro
* qq start marco and put the marco into register q.
* in normal model, press q will stop the macro
* @q execute the marco in the register q.
* @@ execute the marco again
* or can ansign a macro to register :let @q="^dwgU$P"
* execute the marco on the selection :'<,'>normal @q
* gitk show git ui

git format-patch -1 <sha> Generate a git patch for a specific commit

#specify file extension
:set suffixesadd+=.rb

set path?

* vim non-greedy

Instead of .* use .\{-}.

%s/style=".\{-}"//g

Also, see :help non-greedy
