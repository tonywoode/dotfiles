set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog = '/Users/twoode/.pyenv/versions/nvim-py3/bin/python'

if exists('g:vscode')
    " VSCode extension - do nothing
else
    " Ordinary Neovim
    set termguicolors
    source ~/.vimrc
endif
