set nocompatible " be iMproved, required
set mouse=a
set number
set clipboard=unnamed " Yank always yanks to osx clipboard https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/
"set shortmess+=l "you can stop having to press enter on messages, but the text will be obfuscated
set ruler
set showcmd
set showmode "enables displaying whether to show insert mode in status line. needed if for instance you want to know if paste is on or off
"set hidden "don't unload buffers that just aren't visible atm

"tabs
set backspace=2 "to stop terminal vim + plugins disabling backspace. See http://vim.wikia.com/wiki/Backspace_and_delete_problems
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab

"highlighting
set incsearch "highlight searchedfor/regexed text
set hlsearch "http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches - now you have a regular expression tester!
let @/ = "" "but don't highlight search every time i source this rc file! https://stackoverflow.com/a/42547647/3536094

set wildmenu "https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmode=longest:full,full

" this is needed for mouse to control panes in tmux - see https://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
set ttymouse=xterm2

"F-key mappings
" fix paste indenting - see http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste  . 
nnoremap <F2> :set invpaste paste?<CR>  
"First line sets a mapping so that pressing F2 in normal mode will invert.The 'paste' option, and will then show the value of that option.
set pastetoggle=<F2> "allows you to press F2 when in insert mode, to toggle 'paste' on and off. 

" F3 was used by the maximiser plugin, which i stopped using

" turn highlighting off for this search (search term stays selected though)
nnoremap <F4> :noh<CR>

" get a buffer menu with f5, http://vim.wikia.com/wiki/Easier_buffer_switching
nnoremap <F5> :buffers<CR>:buffer<Space>


call plug#begin('~/.vim/bundle') "plug wanted '~/vim/plugged' but suggested this dir if i didn't want to reinstall vundle plugins
Plug 'junegunn/vim-plug' "If you need Vim help for vim-plug itself (e.g. :help plug-options), register vim-plug as a plugin.
"Plug 'vim-scripts/Highlight-UnMatched-Brackets', conflicts with delimitMate
" appearance
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'micha/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator' "When combined with a set of tmux key bindings, navigate seamlessly between vim and tmux splits using a consistent set of hotkeys.
" language tools
Plug 'w0rp/ale' "async linting engine
Plug 'sheerun/vim-polyglot' "bundles other language syntax plugins for many lanuages(pangloss/vim-javascript, [vim-jsx] for js
Plug 'tpope/vim-surround' "mappings to delete/change/add parentheses, brackets, quotes, XML tags, etc in pairs. :h surround
Plug 'tpope/vim-repeat' "enables '.' to repeat for vim-surround and others
Plug 'Valloric/YouCompleteMe', { 'do' : '~/.vim/bundle/YouCompleteMe/./install.py --ts-completer' }
Plug 'ruanyl/vim-gh-line' "<leader>gh to open the line of this file in github
Plug 'Raimondi/delimitMate' "auto-fill closing quotes, parens
" js specific -  see https://davidosomething.com/blog/vim-for-javascript/
Plug 'elzr/vim-json' "You're advised to look at its options
Plug 'othree/yajs.vim', { 'for': 'javascript' } "a fork of jelera/vim-javascript-syntax, neither have custom indent settings, updated very often. The {} makes sure the syntax plugin is loaded in a Vim autocommand based on filetype detection (as opposed to relying on Vim's runtimepath based sourcing mechanism. Then the main Vim syntax plugin will have already run, and this syntax will override it.
Plug 'mxw/vim-jsx'
Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install' } "syntax highlighting: picks out function scopes.  may not color your code when incomplete (i.e., syntax not yet valid). can be used in combination with any of the above
Plug 'othree/javascript-libraries-syntax.vim' "highlighting of functions+keywords for various libs such as jQuery, lodash, React, Handlebars, Chai, etc.
Plug '1995eaton/vim-better-javascript-completion' "somewhat up-to-date JavaScript (HTML5 methods e.g. localStorage and canvas methods). creates new omni-completion function: js#CompleteJS and replaces your current JS omnifunc with it, so you have to use a completion plugin or write some VimL, to use it in conjunction with another omnifunc like TernJS
Plug 'othree/jspc.vim' "JavaScript Parameter Complete detects when you're inside a function argument and provides autocomplete suggestions (TernJS only adds existing symbols) So if you're writing an event listener, it'll suggest click and mouseover. You can see all the suggestions it provides in its GitHub source. On load, the jspc.vim plugin automatically detects whatever omnifunc you already have set as your default. It wraps it with the parameter completion, and falls back to your default if you are not in a parameter completion. Because of this you should specify jspc#omni instead of whatever your default completion is (typically javascriptcomplete#CompleteJS)
Plug 'moll/vim-node' "adds keybindings like for jumping to files in your CommonJS require statements
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
" file/window maintainance
Plug 'rizzatti/dash.vim' "enables :Dash lookups
Plug 'tpope/vim-fugitive' "A GIT PLUGIN - very powerful, but only installed because gv.vim needed it
Plug 'junegunn/gv.vim' "https://github.com/junegunn/gv.vim, visual git repo browser
Plug 'tpope/vim-obsession' "make Session.vim files, tmux resurrect can try and restore them
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'troydm/zoomwintab.vim' "Zoom in/out of windows by making new tab https://github.com/neovim/neovim/issues/997, note this changes <c-w>o keymap from 'only', if you care see https://stackoverflow.com/a/15583640/3536094, think they said this has to be the last line plugin specified
call plug#end() " All of your Plugs must be added before the following line
"You can remove filetype off, filetype plugin indent on and syntax on from your .vimrc as they are automatically handled by plug#begin() and plug#end()
" to disable individual plugins, with Plug you can
" Plug 'foo/bar', { 'on': [] }
" (though it will still be installed)
" else :set runtimepath? to show you path then
" paste it as below. https://stackoverflow.com/a/6706997/3536094 - (note minus)
"set runtimepath-=~/.vim/bundle/tern_for_vim

"colour settings - from https://github.com/junegunn/vim-plug/wiki/faq: A common 
" mistake is to put :colorscheme NAME before call plug#end(). Plugins are not 
" activated before plug#end(), so make sure to load your color scheme after it.
set background=dark
colorscheme solarized

"js omnifunc setting - (jspc is a decorator). It used to be that YCM took over
"omnifunc (ctrl+x/ctrl+o - see setting with :set omnifunc), however YCM now 
" takes over completefunc (ctrl+o/ctrl+u - check with :set completefunc). This
" appears to have the effect of allowing omnifunc completers to work again
" with that usual key combo
"set omnifunc=syntaxcomplete#Complete "this was the default
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS "standard
autocmd FileType javascript setlocal omnifunc=jspc#omni "see above othree/jspc.vim, its a decorator for javascriptcomplete

" Vim's own plugins see: help plugin-install
packadd! matchit " % to jump to matching xml tags etc, not backwards compatible so not enabled by default see: help %

" External Plugin config

"turn on javascript-libraries-syntax.vim for these modules: https://github.com/othree/javascript-libraries-syntax.vim
let g:used_javascript_libs = 'jQuery, chai, ramda, react, RequireJS, jasmine'

"for Dash, associate the custom Ramda docset
let g:dash_map = { 'javascript' : 'ramda' }

" airline options https://github.com/vim-airline/vim-airline
" by default with 'laststatus' the statusline won't appear until a split is created. Make it appear always
set laststatus=2
let g:airline_theme='solarized'
" for DARK solarized, this extra step is needed
let g:airline_solarized_bg='dark'

" YouCompleteMe options
"let g:loaded_youcompleteme = 1 "this will disable ycm
"let g:ycm_auto_trigger = 1 "if off, invoke with ctrl + space
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" YcmCompleter GoTo is very handy....map it to leader+gt
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
"no cr because you need to type a replacement
nnoremap <leader>f :YcmCompleter RefactorRename  
" only GoToReferences isn't working with external files, even with ctags of
" any flavour, so lets use the simplest alternative https://vi.stackexchange.com/a/4976
nnoremap <leader>u :grep! "\<<cword>\>" . -r<CR>:copen<CR>

" pangloss/vim-javascript options - see https://github.com/pangloss/vim-javascript
let g:javascript_enable_domhtmlcss = 1 "Enables HTML/CSS syntax highlighting in your JavaScript file.
"set foldmethod=syntax "Enables code folding based on our syntax file - dramatic effect on performance and global vim option. we do not set it ourselves

"vim obesssion
set statusline+=%{ObsessionStatus()}

" ALE options
"let g:ale_enabled = 0 "completely disables with 0
" its either this or fight for an eslint.rc
let g:ale_javascript_standard_options = '--env browser --env node --env commonjs --env shared-node-browser --env es6 --env worker --env amd --env mocha --env jasmine --env jest --env phantomjs --env protractor --env qunit --env jquery --env prototypejs --env shelljs --env meteor --env mongo --env applescript --env nashorn --env serviceworker --env atomtest --env embertest --env webextensions --env greasemonkey'
"i.e.: remove eslint from linters - isn't that the point
let g:ale_linters = { 'javascript' : ['flow', 'flow-language-server', 'jscs', 'standard', 'tsserver', 'xo']}
let g:ale_fixers = {'javascript': ['prettier_standard']}
let g:ale_set_balloons = 1 "For Vim 8.1+ terminals, mouse hovering is disabled by default. Enabling |balloonexpr| commands in terminals can cause scrolling issues in terminals
let g:airline#extensions#ale#enabled = 1
" ycm does have better support for these things
" let g:ale_completion_enabled = 1
"nmap <leader>r <Plug>(ale_find_references)
"nmap <leader>d <Plug>(ale_go_to_definition)
"nmap <leader>h <Plug>(ale_hover)



"JSContextColor options
let g:js_context_colors_enabled = 0
let g:js_context_colors_insertmode = 1
let g:js_context_colors_highlight_function_names = 1
let g:js_context_colors_block_scope = 1
let g:js_context_colors_jsx = 1
let g:js_context_colors_allow_jsx_syntax = 1
let g:js_context_colors_usemaps = 0 "don't use <leader>t please, i want that
nnoremap <leader>c :JSContextColorToggle<CR>
"what it was anyway:
" conflicting with txtfmt, but didn't do anything leader c didn't do anyway nnoremap <leader>h :JSContextColor<CR>
"let g:js_context_colors_block_scope_with_let = 1
"let g:js_context_colors_es5 = 1

"NERDTreeOptions
"see http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
" although i can't see any visible effect
let NERDTreeHijackNetrw=1
"autocmd VimEnter * NERDTree "start when vim starts
autocmd VimEnter * wincmd p " Jump to the main window
"start when vim starts even if you didn't say a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1 "show hidden files by default
nnoremap <leader>t :NERDTreeToggle<CR>
"we want ctrl+j/k to navigate tmux on every window, so remap these to option+j/k
let NERDTreeMapJumpNextSibling='∆'
let NERDTreeMapJumpPrevSibling='˚'

"delimitMate options
let delimitMate_expand_cr = 1

" end of plugin options

" to stop GUI-vim displaying tiny text on a high-res monitor see http://vim.wikia.com/wiki/Change_font
if has('gui_running')
	set guifont=Menlo\ Regular:h15
endif

" Trigger a check for files being changed under us, whenever we can
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * redraw! | if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" autoload vimPlug if it isn't loaded
" if this were neoVim the second line would read `curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs`
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" bram's own
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" see https://vi.stackexchange.com/questions/16037/vim-swap-file-best-practices
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

