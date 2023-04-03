set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
if exists('g:vscode')
    " VSCode extension - ie: don't load any vim config in vscode (to see if it
    " helps with jumplist corruptions i'm experiencing)
else
    " ordinary Neovim
  source ~/.vimrc
endif
