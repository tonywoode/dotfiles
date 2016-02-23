# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/twoode/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
#
#Add the following to your zshrc to access the online help:
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help


# we want homebrew cask to install things to /Applications like everything else does now, not ~/Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# tmux starts by default
# the $- == *i* says 'if current shell isn't interactive
# the last command (starting -n is the actor that sets the current dir to prev dir in 
# most circumstances (eg: a start-iterm-at-this-folder script) 
#inspiration from http://tmux.svn.sourceforge.net/viewvc/tmux/trunk/FAQ 
# which says "A workaround is to let tmux know about the current path through an environment variable.
# Which sets TMUXPWD_i (where i is the number of the current window) to the path of the current directory.
if [[ $- == *i* ]] && command -v tmux>/dev/null && [[ ! $TERM =~ screen ]] ; then
	[ -z $TMUX ] && exec tmux
##	[ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I") $PWD   #but the variable doesn't get set. Instead manually set your terminals preferences in UI to reuse previous dir
fi
