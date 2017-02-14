set nocompatible              " be iMproved, required
filetype off                  " required
set mouse=a
set number
set clipboard=unnamed         " Yank always yanks to osx clipboard https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/
set shortmess+=l
set ruler
set showcmd
set showmode
set incsearch                 "highlight searchedfor/regexed text
"tabs
set backspace=2 "to stop terminal vim + plugins disabling backspace. See http://vim.wikia.com/wiki/Backspace_and_delete_problems
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab

set hidden "don't unload buffers that just aren't visible atm

"colour settings
syntax enable
set background=dark
colorscheme solarized

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
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


" plugins
Plugin 'rizzatti/dash.vim' "enables :Dash lookups
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
"Plugin 'altercation/vim-colors-solarized' "not doing it for me!

"LANGUAGE TOOLS
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot' "bundles other language syntax plugins for many lanuages(pangloss/vim-javascript, [vim-jsx] for js
Plugin 'tpope/vim-surround' "mappings to delete/change/add parentheses, brackets, quotes, XML tags, etc in pairs. View the manual with :help surround
Plugin 'Valloric/YouCompleteMe' "{ 'do' : '~/.vim/bundle/YouCompleteMe/./install.py --tern-completer' }

"JS SPECIFIC -  see https://davidosomething.com/blog/vim-for-javascript/
Plugin 'ternjs/tern_for_vim', { 'do': 'npm install' } 
Plugin 'elzr/vim-json' "You're advised to look at its options
Plugin 'othree/yajs.vim', { 'for': 'javascript' } "a fork of jelera/vim-javascript-syntax, neither have custom indent settings, updated very often. The {} makes sure the syntax plugin is loaded in a Vim autocommand based on filetype detection (as opposed to relying on Vim's runtimepath based sourcing mechanism. Then the main Vim syntax plugin will have already run, and this syntax will override it.
Plugin 'bigfish/vim-js-context-coloring' "syntax highlighting: picks out function scopes. Requires in-depth parsing of your code: may not color your code when incomplete (i.e., syntax not yet valid). can be used in combination with any of the above, and you can toggle it on and off, but it may not deal with es6 or jsdoc
Plugin 'mxw/vim-jsx' "for React's (optional) JSX syntax, syntax highlighting for those inline XML-nodes: requires a JavaScript syntax plugin (mentions pangloss but supports any)
Plugin 'heavenshell/vim-jsdoc' "inserts JSDoc comments for you if cursor is on a function definition. It'll check for the function name, arguments, and add the doc-block comment
Plugin 'othree/javascript-libraries-syntax.vim' "highlighting of functions+keywords for various libs such as jQuery, lodash, React, Handlebars, Chai, etc. see README at homepage
Plugin '1995eaton/vim-better-javascript-completion' "somewhat up-to-date JavaScript (HTML5 methods e.g. localStorage and canvas methods). creates new omni-completion function: js#CompleteJS and replaces your current JS omnifunc with it, so you have to use a completion plugin or write some VimL, to use it in conjunction with another omnifunc like TernJS
Plugin 'othree/jspc.vim' "JavaScript Parameter Complete detects when you're inside a function argument and provides autocomplete suggestions (TernJS only adds existing symbols) So if you're writing an event listener, it'll suggest click and mouseover. You can see all the suggestions it provides in its GitHub source. On load, the jspc.vim plugin automatically detects whatever omnifunc you already have set as your default. It wraps it with the parameter completion, and falls back to your default if you are not in a parameter completion. Because of this you should specify jspc#omni instead of whatever your default completion is (typically javascriptcomplete#CompleteJS)
Plugin 'moll/vim-node' "adds keybindings like for jumping to files in your CommonJS require statements
Plugin 'tpope/vim-obsession' "make Session.vim files, tmux resurrect can try and restore them

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required - To ignore plugin indent changes, instead use: filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" END OF VUNDLE

" Vim's own plugins see: help plugin-install

" matchit allows % to jumpt to matching xml tags etc, not backwards
" compaatible so not enabled by default see: help %
packadd! matchit

"js omnifunc setting - I actually can't see a point in setting :set omnifunc shows that either ycm or tern seem to take it over, and even when they dont (jspc is a decorator), they are still controlling
"set omnifunc=syntaxcomplete#Complete "this was the default
"filetype plugin on "don't think necessary if youve already said filetype plugin indent * 
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS "standard
autocmd FileType javascript setlocal omnifunc=jspc#omni "see above othree/jspc.vim, its a decorator for javascriptcomplete

" ctrl-p settings
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'a'
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Tern options - see http://usevim.com/2013/05/24/tern/
let g:tern_map_keys=1 "for Keys see .vim/bundle/tern_for_vim/doc/tern.txt
let g:tern_map_prefix = '<leader>' "make sure leader is not localleader
let g:tern_show_argument_hints = 'on_move'  "on_move=update the argument hints at status line on functions whenever the cursor moves, on_hold=whenever the cursor is held still for 'updatetime' setting. on_move can reduce responsiveness, on_hold probably requires you to set 'updatetime' to something smaller than default 4 secs.  If you don't see hints while in insert mode you might have to set noshowmode (but see below its set for something else)
let g:tern_show_signature_in_pum = '1' "1=display function signatures in the completion menu. Function signatures include parameter names, their type, and whether the parameter is optional.


" pangloss/vim-javascript options - see https://github.com/pangloss/vim-javascript
let g:javascript_enable_domhtmlcss = 1 "Enables HTML/CSS syntax highlighting in your JavaScript file.
"set foldmethod=syntax "Enables code folding based on our syntax file - dramatic effect on performance and global vim option. we do not set it ourselves


" syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = [ 'eslint' ] ", 'jslint', 'jshint' ] 
" end of syntastic options


" fix paste indenting - see http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste  . 
nnoremap <F2> :set invpaste paste?<CR>  
"First line sets a mapping so that pressing F2 in normal mode will invert.The 'paste' option, and will then show the value of that option.
set pastetoggle=<F2> "allows you to press F2 when in insert mode, to toggle 'paste' on and off. 
set showmode "enables displaying whether 'paste' is turned on in " insert mode. 


" to stop GUI-vim displaying tiny text on a high-res monitor see http://vim.wikia.com/wiki/Change_font
if has('gui_running')
	set guifont=Menlo\ Regular:h15
endif
