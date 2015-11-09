# bash completion
export PATH="/usr/local/bin:$PATH"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
 fi

 # VI key bindings
 set -o vi

# tmux starts by default
# the $- == *i* says 'if current shell isn't interactive
# the last comman (starting -n is the actor that sets the current dir to prev dir in most circumstances (eg: a start-iterm-at-this-folder script) - inspiration from http://tmux.svn.sourceforge.net/viewvc/tmux/trunk/FAQ which says "A workaround is to let tmux know about the current path through an environment variable.Which sets TMUXPWD_i (where i is the number of the current window) to the path of the current directory.
if [[ $- == *i* ]] && command -v tmux>/dev/null; then
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

