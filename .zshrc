# Path to your oh-my-zsh installation.
export ZSH=/Users/twoode/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew brew-cask docker-compose docker git npm nvm vi-mode)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
export PATH="/usr/local/sbin:$PATH"

# some shortcuts. I like to type cd sometimes.
code=~/CODE
alias code="cd $code"
scripts=$code/Scripts
alias scripts="cd $scripts"
dots=$scripts/Dotfiles/dotfiles
alias dots="cd $dots"
repo=$code/Repo
alias repo="cd $repo"
smoke=$repo/Smoke/smoke_github
alias smoke="cd $smoke"

