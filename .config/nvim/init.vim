set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog = '/Users/twoode/.pyenv/versions/nvim-py3/bin/python' "using pyenv virtualenv I installed python 3.13.7 here, this needs to be done manually see macos word
if exists('g:vscode')
    " VSCode extension - ie: don't load any vim config in vscode (to see if it
    " helps with jumplist corruptions i'm experiencing)
else
    " ordinary Neovim
  source ~/.vimrc
endif
