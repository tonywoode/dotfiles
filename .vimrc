set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" plugins
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'elzr/vim-json'
Plugin 'bling/vim-airline'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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
syntax enable
set background=dark
colorscheme solarized


" syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" end of syntastic options

set number
" see http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
" The first line sets a mapping so that pressing F2 in normal mode will invert
" the 'paste' option, and will then show the value of that option. The second
" line allows you to press F2 when in insert mode, to toggle 'paste' on and
" off. The third line enables displaying whether 'paste' is turned on in
" insert mode. 
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set backspace=2 "to stop terminal vim + plugins disabling backspace. See http://vim.wikia.com/wiki/Backspace_and_delete_problems
" to stop GUI-vim displaying tiny text on a high-res monitor see http://vim.wikia.com/wiki/Change_font
if has('gui_running')
	set guifont=Menlo\ Regular:h15
endif

set tabstop=2
set shiftwidth=2
set softtabstop=2
set hidden
hi link htmlLink NONE
