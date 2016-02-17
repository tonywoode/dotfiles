# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
 fi

 # VI key bindings
 set -o vi

# tmux starts by default
# the $- == *i* says 'if current shell isn't interactive
# the last command (starting -n is the actor that sets the current dir to prev dir in 
# most circumstances (eg: a start-iterm-at-this-folder script) 
#inspiration from http://tmux.svn.sourceforge.net/viewvc/tmux/trunk/FAQ 
# which says "A workaround is to let tmux know about the current path through an environment variable.
# Which sets TMUXPWD_i (where i is the number of the current window) to the path of the current directory.
#if [[ $- == *i* ]] && command -v tmux>/dev/null; then
#	[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
#	[[ ! $TERM =~ screen ]] && [ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I") $PWD && exec tmux   
#fi

# alias to nw
alias nw=/Users/twoode/Code/myNodeWebkitApps/nw/node-webkit.app/Contents/MacOS/node-webkit

# include sbin in path
export PATH="/usr/local/sbin:$PATH"

# we want homebrew cask to install things to /Applications like everything else does now, not ~/Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

