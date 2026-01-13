"{{ Custom variables
let g:is_win = (has('win32') || has('win64')) ? v:true : v:false
let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false
let g:is_mac = has('macunix') ? v:true : v:false
let g:is_bram_vim = !has('nvim') ? v:true : v:false
let g:is_neo_vim = has('nvim') ? v:true : v:false
" let g:logging_level = 'info'
"}} thanks https://github.com/jdhao/nvim-config/blob/master/core/globals.vim

" to stop GUI-vim displaying tiny text on a high-res monitor see http://vim.wikia.com/wiki/Change_font, but then a non powerline menlo font was sticking - see https://github.com/vim-airline/vim-airline/issues/719
if has('gui_running')
  if has("gui_macvim")
	set guifont=InconsolataNerdFontComplete-Medium:h16
  endif
endif

if g:is_linux
  set clipboard=unnamedplus " Yank always yanks to osx clipboard https://evertpot.com/osx-tmux-vim-copy-paste-clipboard/ but updated with https://neovim.io/doc/user/options.html#'clipboard' (which isn't neovim specific)
else
  set clipboard=unnamed " see https://github.com/vim/vim/issues/1670
endif

if g:is_bram_vim
  set nocompatible " be iMproved, required
  set autoindent
  set background=dark
  set backspace=2 "to stop terminal vim + plugins disabling backspace. See http://vim.wikia.com/wiki/Backspace_and_delete_problems
  set hlsearch "http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches - now you have a regular expression tester!
  set incsearch "highlight searchedfor/regexed text
  set nojoinspaces "only put one space after a full stop before the new sentence, not two see https://stackoverflow.com/questions/1578951/why-does-vim-add-spaces-when-joining-lines
  let $undoFolder = $HOME.'/.vim/undo' " Note use of $ var not a vim set or let var, its just easiest https://vi.stackexchange.com/a/17451 
  silent !  [[ -d $undoFolder ]] || mkdir $undoFolder
  set undodir=$undoFolder
  set ruler
  set showcmd
  set ttyfast  "not enabled by default, may prove problems with remote terminals
  set wildmenu "https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
  packadd! matchit " % to jump to matching xml tags etc, not backwards compatible so not enabled by default see: help %
  " for mouse to control panes in tmux - see https://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
  " was ttymouse=xterm2 see :h https://github.com/vim/vim/issues/2309
  if has("mouse_sgr")
      set ttymouse=sgr
  else
      set ttymouse=xterm2
  endif
endif

if g:is_neo_vim
  " I'm waiting to populate you!
endif

" --------------COMMON OPTIONS-----------------
set number relativenumber "relative number used with vim-numbertoggle plugin
set showmode "enables displaying whether to show insert mode in status line. needed if for instance you want to know if paste is on or off, but, you have to look down....
:autocmd InsertEnter,InsertLeave * set cul!
" splits https://stackoverflow.com/a/7912621/3536094 these interfere with vim-fugitive, which i'd like to get to know first
"set splitright "To make vsplit put the new buffer on the right of the current buffer 
"set splitbelow "to make split put the new buffer below the current buffer

set mouse=a "nvi is neovim default, if you ever can't copy in your terminal, try setting that (https://github.com/tpope/vim-sensible/issues/152)
"tabs
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent

set wildmode=longest:list,full "trial menu (was set wildmode=longest:full,full )
" Persistent undo  https://stackoverflow.com/a/26702442/3536094 YOU must mkdir ~/.vim/undo, so ensure folder exists NIX ONLY shell. 
" neovim undoes to this: - 'undodir' defaults to ~/.local/state/nvim/undo// (|xdg|), auto-created if you believe the doc or ~/.local/share/nvim/undo if you believe nvim
" and remember neovim's undoes are incompatable with vim's anyway
set undofile
set undolevels=1000
set undoreload=10000

"highlighting
let @/ = "" "but don't highlight search every time i source this rc file! https://stackoverflow.com/a/42547647/3536094


"F-KEY MAPPINGS
" fix paste indenting - see http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste  . 
"First line sets a mapping so that pressing F2 in normal mode will invert.The 'paste' option, and will then show the value of that option
nnoremap <F2> :set invpaste paste?<CR>  
" Check if the editor is NOT Neovim using the variable
if !g:is_neo_vim
  " This setting is only for MacVim and older versions of Vim
  set pastetoggle=<F2>
endif
" F3 switches line numbering mode
nnoremap <silent><F3> :call g:ToggleNuMode()<cr>
" F4 to turn highlighting off for this search (search term stays selected though)
nnoremap <F4> :noh<CR>
" F5 to get a buffer menu, http://vim.wikia.com/wiki/Easier_buffer_switching
nnoremap <F5> :buffers<CR>:buffer<Space>

"PLUGINS
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged' - so  ~/.local/share/nvim/plugged/
" You can specify a custom plugin directory by passing it as the argument
Plug 'junegunn/vim-plug' "If you need Vim help for vim-plug itself (e.g. :help plug-options), register vim-plug as a plugin.

" appearance
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator' "When combined with a set of tmux key bindings, navigate seamlessly between vim and tmux splits using a consistent set of hotkeys.
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeffkreeftmeijer/vim-numbertoggle' "absolute line numbers where neccessary https://jeffkreeftmeijer.com/vim-number/
" language tools
Plug 'ludovicchabant/vim-gutentags' "handles ctags for you, its configured below to work with ycm by providing langugage tags per line
Plug 'Raimondi/delimitMate' "auto-fill closing quotes, parens
Plug 'ruanyl/vim-gh-line' "<leader>gh to open the line of this file in github
Plug 'sheerun/vim-polyglot' "bundles other language syntax plugins for many lanuages(pangloss/vim-javascript, [vim-jsx] for js
Plug 'tpope/vim-repeat' "enables '.' to repeat for vim-surround and others
Plug 'tpope/vim-unimpaired'  "you need to use things like :cnext or :bprevious all the time, so have shortcut keys for these pairs
Plug 'tpope/vim-surround' "mappings to delete/change/add parentheses, brackets, quotes, XML tags, etc in pairs. :h surround
Plug 'Valloric/YouCompleteMe', { 'do': 'python ./install.py --ts-completer' }
Plug 'w0rp/ale' "async linting engine
Plug 'zhou13/vim-easyescape' "better than having to remap escape to jk
" js specific - many from  https://davidosomething.com/blog/vim-for-javascript/
Plug '1995eaton/vim-better-javascript-completion' "somewhat up-to-date JavaScript (HTML5 methods e.g. localStorage and canvas methods). creates new omni-completion function: js#CompleteJS and replaces your current JS omnifunc with it, so you have to use a completion plugin or write some VimL, to use it in conjunction with another omnifunc like TernJS
Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install' } "syntax highlighting: picks out function scopes.  may not color your code when incomplete (i.e., syntax not yet valid). can be used in combination with any of the above
Plug 'elzr/vim-json' "You're advised to look at its options
Plug 'moll/vim-node' "adds keybindings like for jumping to files in your CommonJS require statements
Plug 'othree/javascript-libraries-syntax.vim' "highlighting of functions+keywords for various libs such as jQuery, lodash, React, Handlebars, Chai, etc.
Plug 'othree/jspc.vim' "JavaScript Parameter Complete detects when you're inside a function argument and provides autocomplete suggestions. On load, detects existing omnifunc and wraps it so falls back to your default if you are not in a parameter completion. Because of this you should specify jspc#omni instead of whatever your default completion is (typically javascriptcomplete#CompleteJS)
Plug 'othree/yajs.vim', { 'for': 'javascript' } "a fork of jelera/vim-javascript-syntax, neither have custom indent settings, updated very often. The {} makes sure the syntax plugin is loaded in a Vim autocommand based on filetype detection (as opposed to relying on Vim's runtimepath based sourcing mechanism. Then the main Vim syntax plugin will have already run, and this syntax will override it.

" file/window maintainance
Plug 'justinmk/vim-gtfo' "Opens file manager or terminal at the directory of the current file in Vim - cross platform no less
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "also installs fzf for your shell
Plug 'junegunn/fzf.vim' "by default fzf only installs a minimum vim wrapper
Plug 'junegunn/gv.vim' "https://github.com/junegunn/gv.vim, visual git repo browser
Plug 'tpope/vim-fugitive' "A GIT PLUGIN - very powerful, but only installed because gv.vim needed it
Plug 'tpope/vim-rhubarb' "the github plugin for vim fugitive (to make GBrowse work)
Plug 'rizzatti/dash.vim' "enables :Dash lookups
Plug 'scrooloose/nerdtree'
Plug 'wfxr/minimap.vim', { 'do': 'brew install code-minimap'} "minimap that uses an external rust element (on windows: scoop bucket add extras && scoop install code-minimap. see toggle mapping below
Plug 'tpope/vim-obsession' "make Session.vim files, tmux resurrect can try and restore them
Plug 'dhruvasagar/vim-prosession' "vim obsession is great, but you have to remember to turn it on and load the session file in each project, see https://github.com/tpope/vim-obsession/issues/11
Plug 'benmills/vimux' "run terminal commands in tmux from vim. good for tests
Plug 'troydm/zoomwintab.vim' "Zoom in/out of windows by making new tab https://github.com/neovim/neovim/issues/997, note this changes <c-w>o keymap from 'only', if you care see https://stackoverflow.com/a/15583640/3536094, think they said this has to be the last line plugin specified
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'qpkorr/vim-bufkill' "let me destroy the buffer without destroying the split window that its in
Plug 'ryanoasis/vim-devicons' "icons for nerd-tree - requires a nerd-font compatible font (which i think are all powerline compatible - i chose https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Inconsolata/complete/Inconsolata%20Nerd%20Font%20Complete.otf)

"machines
Plug 'github/copilot.vim' " happy to install on bram vim, no ghost text tho
call plug#end() " All of your Plugs must be added before the following line
"You can remove filetype off, filetype plugin indent on and syntax on from your .vimrc as they are automatically handled by plug#begin() and plug#end()
" to disable individual plugins, with Plug you can
" Plug 'foo/bar', { 'on': [] }
" (though it will still be installed)
" else :set runtimepath? to show your path then
" paste it as below. https://stackoverflow.com/a/6706997/3536094 - (note minus, and don't leave off trailing slash)
"set runtimepath-=~/.vim/bundle/tern_for_vim/

" autoload vimPlug if it isn't loaded - this should be in the functions section at the bottom, but if solarized isnt
" loaded the whole .vimrc will fail at the colorscheme declaration below this one
" from https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" if this were neoVim the second line resolves to `curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs`
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"PLUGIN AND PLUGIN-AFFECTED SETTINGS
"colour settings - from https://github.com/junegunn/vim-plug/wiki/faq: A common 
" mistake is to put :colorscheme NAME before call plug#end(). Plugins are not 
" activated before plug#end(), so make sure to load your color scheme after it.
" Check if we are in Neovim before setting transparency
if has('nvim')
  set background=dark
  colorscheme solarized8_flat
else
  " For regular Vim/MacVim
  let g:solarized_termtrans = 1
  set background=dark
  " We use the new plugin's name here too
  colorscheme solarized8
endif

" vim-polyglot settings
" I temporarily disabled polyglot using jsx plugins due to a matchit issue, issue seems resolved now tho and i need jsx highlighting
" polyglot should now be using this to do jsx highlighting: https://github.com/MaxMEllon/vim-jsx-pretty
"  https://github.com/chrisbra/matchit/issues/11
"  https://github.com/mxw/vim-jsx/pull/177
" atm vim-jsx breaks matchit, and the pr to fix it isn't actioned
"let g:polyglot_disabled = ['jsx']


"js omnifunc setting - (jspc is a decorator). It used to be that YCM took over
"omnifunc (ctrl+x/ctrl+o - see setting with :set omnifunc), however YCM now 
" takes over completefunc (ctrl+o/ctrl+u - check with :set completefunc). This
" allows omnifunc completers to work again
"set omnifunc=syntaxcomplete#Complete "this was the default
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS "standard
autocmd FileType javascript setlocal omnifunc=jspc#omni "see above othree/jspc.vim, its a decorator for javascriptcomplete

" Vim's own plugins see: help plugin-install

" External Plugin config

"javascript-libraries-syntax.vim https://github.com/othree/javascript-libraries-syntax.vim
let g:used_javascript_libs = 'jQuery, chai, ramda, react, RequireJS, jasmine'

"for Dash, associate the custom Ramda docset
let g:dash_map = { 'javascript' : 'ramda' }

" airline options https://github.com/vim-airline/vim-airline
" by default with 'laststatus' the statusline won't appear until a split is created. Make it appear always
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename TODO: work out what the other constituents mean
let g:airline#extensions#tabline#fnamemod = ':t'

" YouCompleteMe options
"let g:loaded_youcompleteme = 1 "this will disable ycm
let g:ycm_auto_trigger = 1 "if off, invoke with ctrl + space
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filepath_blacklist = {} "https://github.com/Valloric/YouCompleteMe/issues/3102 - ft comes out as javascript.jsx now for js files, but there's a bug...
let g:ycm_collect_identifiers_from_tags_files = 1 "gutentags configured below with fields+1 as ycm requires. ycm warns if working servers this can be slow
" disable linting display (which pulls up tsserver issues). let ALE show linting
let g:ycm_show_diagnostics_ui = 0
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>f :YcmCompleter Format<CR>
 "GoToDeclaration/ GoToDefinition exactly the same
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>o :YcmCompleter OrganizeImports<CR>
"no cr because you need to type a replacement, and space at end is intended
nnoremap <leader>r :YcmCompleter RefactorRename 
nnoremap <leader>rs :YcmCompleter RestartServer<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gtt :YcmCompleter GoToType<CR>

" pangloss/vim-javascript options - see https://github.com/pangloss/vim-javascript
let g:javascript_enable_domhtmlcss = 1 "Enables HTML/CSS syntax highlighting in your JavaScript file.
"set foldmethod=syntax "Enables code folding based on our syntax file - dramatic effect on performance and global vim option. we do not set it ourselves

"vim obesssion
set statusline+=%{ObsessionStatus()}

" ALE options
"let g:ale_enabled = 0 "completely disables with 0
" its either this or fight for an eslint.rc
" since we're using standard under eslint, the below should be irrelevant now
"let g:ale_javascript_standard_options = '--env browser --env node --env commonjs --env shared-node-browser --env es6 --env worker --env amd --env mocha --env jasmine --env jest --env phantomjs --env protractor --env qunit --env jquery --env prototypejs --env shelljs --env meteor --env mongo --env applescript --env nashorn --env serviceworker --env atomtest --env embertest --env webextensions --env greasemonkey'
"i.e.: in particular, don't lint with eslint or tsserver (YCM lints with tsserver, since we interact with YCM for everything else tsserver, lets deal with those issues in that plugin) 
" i want to maintain a global eslintrc, not per-project atm, some projects have a local install but no rc
let g:ale_javascript_eslint_use_global = 0
let g:ale_linters = { 'javascript' : ['eslint']}
let g:ale_fixers = {'javascript': ['eslint', 'prettier_standard'], 'html': ['prettier'], 'css': ['prettier'], '*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_set_balloons = 1 "For Vim 8.1+ terminals, mouse hovering is disabled by default. Enabling |balloonexpr| commands in terminals can cause scrolling issues in terminals
let g:airline#extensions#ale#enabled = 1
" ycm does have better support for these things
" let g:ale_completion_enabled = 1
"nmap <leader>r <Plug>(ale_find_references)
"nmap <leader>d <Plug>(ale_go_to_definition)
nmap <leader>h <Plug>(ale_hover)
nmap <leader>f <Plug>(ale_fix)
" ale and vim use arrow keys for autcomplete, which is crazy: this is vim: arrow keys are distracting
" lets tab through them instead!  https://stackoverflow.com/a/52615863/3536094
" (in order to get S-Tab working, iterm2 has to have its ctrl+shift+tab global mapping for its tabs removed)
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"

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
" NERDTree iteslf really doesn't fit in well with the VIM philosophy - see http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
" but it is convenient, and placates vim-naysayers
let NERDTreeHijackNetrw=1 " although i can't see the visible effect
" many of these tips from https://medium.com/@victormours/a-better-nerdtree-setup-3d3921abc0b9
"start when vim starts even if you didn't say a file, note also jump to main window in pipeline here - https://stackoverflow.com/a/1448637/3536094
" however, due to vim Prosession, invoking vim without args will make a session file at starting dir, and will pass args, causing this to flash a nerdTree 
" window which vanishes, so that's why the below is commented
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif
"close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1 "show hidden files by default
nnoremap <leader>t :NERDTreeToggle<CR>
"open NerdTree at the CURRENT file
nnoremap <silent> <Leader>v :NERDTreeFind<CR> 
"let NERDTreeQuitOnOpen = 1 "use 'preview' to keep nerdtree open, otherwise it'll close on opening a file
let NERDTreeAutoDeleteBuffer = 1 "Automatically delete the buffer of the file you just deleted with NerdTree
"we want ctrl+j/k to navigate tmux on every window, so remap these to option+j/k
let NERDTreeMapJumpNextSibling='∆'
let NERDTreeMapJumpPrevSibling='˚'
" these from NerdTree wiki https://github.com/preservim/nerdtree/wiki
" don't write over NERDTree's buffer
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
" When a file buffer is already open in a different window, often in a different tab, and you tell NERDTree to 'open in previous window' with 'o' 
"  or double click, it will behave like other editors and not honour your request, it will switch to the previously-open buffer's window. This is not vim-like
"  and is disorienting. Instead, do as asked: open in previous window (do same for left-click since also 'o') https://github.com/preservim/nerdtree/pull/417
" (exclamation explained here: https://stackoverflow.com/questions/39706615/how-to-fix-this-error-e122-function-mydiff-already-exists-add-to-replace-it)
function! NERDTreeMyOpenFile(node)
    call a:node.activate({'reuse': 'currenttab', 'where': 'p'})
endfunction
autocmd VimEnter * :call NERDTreeAddKeyMap({ 'key': 'o', 'callback': 'NERDTreeMyOpenFile', 'scope': 'FileNode', 'override': 1 })
autocmd VimEnter * :call NERDTreeAddKeyMap({'key': '<2-LeftMouse>', 'callback': 'NERDTreeMyOpenFile', 'scope': 'FileNode', 'override': 1 })
" for Vim-Plug, avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window:
let g:plug_window = 'noautocmd vertical topleft new'

"mwinimap.vim options
"these dont work, dont know why
:let g:minimmap_auto_start=1
:let g:minimap_auto_start_win_enter=1

:let g:minimap_highlight_range=1
:let g:minimap_git_colors=1
:let g:minimap_highlight_search=1
nnoremap <Leader>m :MinimapToggle<CR>
"but don't allow that when in nerdtree's split or something awful happens
:autocmd FileType nerdtree noremap <buffer> <Leader>m  <nop>

"vimux options - see https://blog.bugsnag.com/tmux-and-vim/
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
" jump into the vimux terminal, already in vim copy mode
nnoremap <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
nnoremap <Leader>vz :VimuxZoomRunner<CR>

" FZF.vim mappings - see https://github.com/junegunn/fzf.vim#commands
nnoremap <Leader>q :Files<Cr>

"delimitMate options
let delimitMate_expand_cr = 1

"gutentag options
"for ycm support
let g:gutentags_ctags_extra_args = ['--fields=+l']

"easy escape options
let g:easyescape_chars = { "j": 1, "k": 1 }
"requires python3 if you want to type jk, kj, ie timeout <2000  
let g:easyescape_timeout = 2000
cnoremap jk <ESC>
cnoremap kj <ESC>

"prosession options
" enable tmux window name updates as per current session
let g:prosession_tmux_title = 1
" session data can preserve forever, even if our machine dies, if we keep session data with data, not vim code (default is ~/.vim/session)
let g:prosession_dir = '~/CODE/AppData/vim/session/'

" end of plugin options

" tmux navigate - we want vim 8.1's terminal to respect hjkl mapping, yes we
" know about https://github.com/christoomey/vim-tmux-navigator/pull/172
" and that if we use https://github.com/junegunn/fzf its going to conflict
" cobbled from https://github.com/christoomey/vim-tmux-navigator/commit/e13914d89e9413cfa449f0c3daff18691356f2d1
" and https://github.com/christoomey/vim-tmux-navigator/issues/207#issue-332222696
" if it comes to it there's something else to try here
" https://blog.bugsnag.com/tmux-and-vim/

  if has('terminal')
     tnoremap <silent> <c-h> <c-\><c-n>:TmuxNavigateLeft<cr>
     tnoremap <silent> <c-j> <c-\><c-n>:TmuxNavigateDown<cr>
     tnoremap <silent> <c-k> <c-\><c-n>:TmuxNavigateUp<cr>
     tnoremap <silent> <c-l> <c-\><c-n>:TmuxNavigateRight<cr>
     " Cannot use <c-\> here.
     " tnoremap <silent> <c-\> <c-\><c-n>:TmuxNavigatePrevious<cr>
   endif

"FUNCTIONS
" Trigger a check for files being changed under us, whenever we can
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" use the mouse in terminal mode  - - see
" https://github.com/vim/vim/issues/2490a - ctrl+b to enter normal mode in
" the terminal (i or a to go back to insert mode at cursor), doesn't affect
" normal ctrl+b to scroll back (why not?)
tnoremap <c-b> <c-\><c-n>

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

" assigned to F3 above, flip relative to absolute numbers
function! g:ToggleNuMode()
  if &relativenumber == 1
     set number norelativenumber
   else
     set number relativenumber
  endif
endfunction


