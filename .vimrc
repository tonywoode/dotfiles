" short term fix for vim-polyglot's graphql_js_tags plugin
let g:graphql_javascript_tags = []

" short term fix for deprecation warnings in ycm
silent! py3 pass

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
set hlsearch "http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches - now you have a regular expression tester!
set hidden "don't unload buffers that just aren't visible atm

set wildmenu "https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmode=longest:full,full

"colour settings
syntax enable
set background=dark
colorscheme solarized

" this is needed for mouse to control panes in tmux - see https://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
set ttymouse=xterm2

" fix paste indenting - see http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste  . 
nnoremap <F2> :set invpaste paste?<CR>  
"First line sets a mapping so that pressing F2 in normal mode will invert.The 'paste' option, and will then show the value of that option.
set pastetoggle=<F2> "allows you to press F2 when in insert mode, to toggle 'paste' on and off. 

" F3 is used by the maximiser plugin

" turn highlighting off for this search (search term stays selected though)
nnoremap <F4> :noh<CR>

" get a buffer menu with f5, http://vim.wikia.com/wiki/Easier_buffer_switching
nnoremap <F5> :buffers<CR>:buffer<Space>

set showmode "enables displaying whether to show insert mode in status line. needed if for instance you want to know if paste is on or off

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

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim' "required
Plugin 'rizzatti/dash.vim' "enables :Dash lookups
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized' "not doing it for me!
Plugin 'christoomey/vim-tmux-navigator' "When combined with a set of tmux key bindings, navigate seamlessly between vim and tmux splits using a consistent set of hotkeys.
"LANGUAGE TOOLS
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot' "bundles other language syntax plugins for many lanuages(pangloss/vim-javascript, [vim-jsx] for js
Plugin 'tpope/vim-surround' "mappings to delete/change/add parentheses, brackets, quotes, XML tags, etc in pairs. View the manual with :help surround
Plugin 'tpope/vim-repeat' "enables '.' to repeat for vim-sourround and others
Plugin 'Valloric/YouCompleteMe', { 'do' : '~/.vim/bundle/YouCompleteMe/./install.py --tern-completer' }
Plugin 'szw/vim-maximizer' "F3 will toggle fullscreen of the current window, useful as otherwise there's only ctrl+w_, ctrl+w| and ctrl+w=, all imperfect 
Plugin 'ruanyl/vim-gh-line' "<leader>gh to open the line of this file in github
"JS SPECIFIC -  see https://davidosomething.com/blog/vim-for-javascript/
Plugin 'ternjs/tern_for_vim', { 'do': 'npm install' } 
Plugin 'elzr/vim-json' "You're advised to look at its options
Plugin 'othree/yajs.vim', { 'for': 'javascript' } "a fork of jelera/vim-javascript-syntax, neither have custom indent settings, updated very often. The {} makes sure the syntax plugin is loaded in a Vim autocommand based on filetype detection (as opposed to relying on Vim's runtimepath based sourcing mechanism. Then the main Vim syntax plugin will have already run, and this syntax will override it.
Plugin 'bigfish/vim-js-context-coloring', { 'do': 'npm install' } "syntax highlighting: picks out function scopes.  may not color your code when incomplete (i.e., syntax not yet valid). can be used in combination with any of the above
Plugin 'othree/javascript-libraries-syntax.vim' "highlighting of functions+keywords for various libs such as jQuery, lodash, React, Handlebars, Chai, etc.
Plugin '1995eaton/vim-better-javascript-completion' "somewhat up-to-date JavaScript (HTML5 methods e.g. localStorage and canvas methods). creates new omni-completion function: js#CompleteJS and replaces your current JS omnifunc with it, so you have to use a completion plugin or write some VimL, to use it in conjunction with another omnifunc like TernJS
Plugin 'othree/jspc.vim' "JavaScript Parameter Complete detects when you're inside a function argument and provides autocomplete suggestions (TernJS only adds existing symbols) So if you're writing an event listener, it'll suggest click and mouseover. You can see all the suggestions it provides in its GitHub source. On load, the jspc.vim plugin automatically detects whatever omnifunc you already have set as your default. It wraps it with the parameter completion, and falls back to your default if you are not in a parameter completion. Because of this you should specify jspc#omni instead of whatever your default completion is (typically javascriptcomplete#CompleteJS)
Plugin 'moll/vim-node' "adds keybindings like for jumping to files in your CommonJS require statements
Plugin 'tpope/vim-obsession' "make Session.vim files, tmux resurrect can try and restore them
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

call vundle#end() " All of your Plugins must be added before the following line

" to disable individual plugins try "set runtimepath?" to show you path then
" paste it as here:
"set runtimepath-=~/.vim/bundle/tern_for_vim

filetype plugin indent on    " required - To ignore plugin indent changes, instead use: filetype plugin on


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


" Vim's own plugins see: help plugin-install

" matchit allows % to jump to matching xml tags etc, not backwards compatible so not enabled by default see: help %
packadd! matchit


" External Plugins

"turn on javascript-libraries-syntax.vim for these modules: https://github.com/othree/javascript-libraries-syntax.vim
let g:used_javascript_libs = 'jQuery, chai, ramda, react, RequireJS, jasmine'

"for Dash, associate the custom Ramda docset
let g:dash_map = { 'javascript' : 'ramda' }

"js omnifunc setting - I actually can't see a point in setting :set omnifunc shows that either ycm or tern seem to take it over, and even when they dont (jspc is a decorator), they are still controlling
"set omnifunc=syntaxcomplete#Complete "this was the default
"filetype plugin on "don't think necessary if youve already said filetype plugin indent * 
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS "standard
autocmd FileType javascript setlocal omnifunc=jspc#omni "see above othree/jspc.vim, its a decorator for javascriptcomplete

" airline options https://github.com/vim-airline/vim-airline
" by default with 'laststatus' the statusline won't appear until a split is created. Make it appear always
set laststatus=2
let g:airline_theme='solarized'
" for DARK solarized, this extra step is needed
let g:airline_solarized_bg='dark'

" YouCompleteMe options
"let g:loaded_youcompleteme = 1 "this will diable ycm
"let g:ycm_auto_trigger = 0 "if off, invoke with ctrl + space
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

" Tern options - see http://usevim.com/2013/05/24/tern/
autocmd CompleteDone * pclose "see https://github.com/ternjs/tern_for_vim/issues/21 - will close the preview window on edit (otherwise :pc does the job)
let g:tern_map_keys=1 "for Keys see .vim/bundle/tern_for_vim/doc/tern.txt
let g:tern_map_prefix = '<leader>' "make sure leader is not localleader
let g:tern_show_argument_hints = 'on_move'  "on_move=update the argument hints at status line on functions whenever the cursor moves, on_hold=whenever the cursor is held still for 'updatetime' setting. on_move can reduce responsiveness, on_hold probably requires you to set 'updatetime' to something smaller than default 4 secs.  If you don't see hints while in insert mode you might have to set noshowmode (but see below - its used already and not wise to change)
let g:tern_show_signature_in_pum = '1' "1=display function signatures in the completion menu. Function signatures include parameter names, their type, and whether the parameter is optional.

" pangloss/vim-javascript options - see https://github.com/pangloss/vim-javascript
let g:javascript_enable_domhtmlcss = 1 "Enables HTML/CSS syntax highlighting in your JavaScript file.
"set foldmethod=syntax "Enables code folding based on our syntax file - dramatic effect on performance and global vim option. we do not set it ourselves

"vim obesssion
set statusline+=%{ObsessionStatus()}

" syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1 "now causes a blank startup
let g:syntastic_auto_loc_list = 2  "0=no auto 1=auto 2=close auto only 3=open auto only
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "level": "warnings" }
let g:syntastic_javascript_checkers = [ 'eslint' ] ", 'jslint', 'jshint' ] 
let g:syntastic_json_checkers = [ 'jsonlint' ]
let g:syntastic_loc_list_height= 3
" end of syntastic options

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

