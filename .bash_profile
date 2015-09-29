# bash completion
export PATH="/usr/local/bin:$PATH"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
 fi

 # VI key bindings
 set -o vi

# tmux starts by default 
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

# alias to nw
alias nw=/Users/twoode/Code/myNodeWebkitApps/nw/node-webkit.app/Contents/MacOS/node-webkit

# thefuck....
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
alias cunt='fuck'
alias CUNT='fuck'

# include sbin in path
export PATH=/usr/local/sbin:$PATH

# SQL sandboxe
export SANDBOX_HOME=/Volumes/Untitled/Users/Tony/CODE/DBs/SQL/sandboxes

