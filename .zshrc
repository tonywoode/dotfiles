# tmux starts by default
# the $- == *i* says 'if current shell isn't interactive
# the last command (starting -n is the actor that sets the current dir to prev dir in 
# most circumstances (eg: a start-iterm-at-this-folder script) 
# inspiration from http://tmux.svn.sourceforge.net/viewvc/tmux/trunk/FAQ 
# which says "A workaround is to let tmux know about the current path through an environment variable.
# Which sets TMUXPWD_i (where i is the number of the current window) to the path of the current directory.
#
#
# i replaced that all with this beacuase it seemed them most thorough:  https://stackoverflow.com/a/42351698/3536094
case $- in
    *i*)
    if command -v tmux>/dev/null; then
        if [[ ! $TERM =~ screen ]] && [[ -z $TMUX ]]; then
          if tmux ls 2> /dev/null | grep -q -v attached; then
            exec tmux attach -t $(tmux ls 2> /dev/null | grep -v attached | head -1 | cut -d : -f 1)
          else
            exec tmux
          fi
        fi
    fi
    ;;
esac

# Path to your oh-my-zsh installation.
export ZSH=/Users/twoode/.oh-my-zsh

# I installed antigen when looking for a way to make the node version manager NVM work well
# https://github.com/zsh-users/antigen
# https://github.com/lukechilds/zsh-nvm
source /usr/local/share/antigen/antigen.zsh
antigen bundle lukechilds/zsh-nvm
antigen apply
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
plugins=(brew brew-cask colored-man-pages common-aliases dircycle dirhistory docker docker-compose git httpie history history-substring-search npm nvm vi-mode )

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/MAMP/Library/bin"
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
unalias run-help &>/dev/null #https://bugs.launchpad.net/ubuntu/+source/zsh/+bug/305346
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# we want homebrew cask to install things to /Applications like everything else does now, not ~/Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# extend git with hub https://hub.github.com/
alias git=hub

#I hate how 'help' is now 'run-help' in zsh, i use it all the time
alias help=run-help

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
atlas=$smoke/atlas
alias atlas="cd $atlas"
atlasui=$atlas/atlas-ui
alias atlasui="cd $atlasui"
atlasdata=$smoke/atlas-data
alias atlasdata="cd $atlasdata"
desktop=~/Desktop
alias desktop="cd $desktop"
quickplay=~/CODE/REPO/Quickplay
alias quickplay="cd $quickplay"
messtool="$scripts/messTool"
alias messtool="cd $messtool"
dbdump="$HOME/Google Drive/MySMStuff/WorkingFiles/Production Atlas databases"
alias dbdump="cd \"$dbdump\""

# can't alias to 'vim', recursive loop!
#can't laucnh givm in terminal mode and expect it to work with omnivim, mvim doesn't do that
#export OMNIVIM_EDITOR="/usr/local/bin/gvim -v"
alias tim="python /Users/twoode/CODE/Scripts/Dotfiles/dotfiles/tmux-omnivim/omnivim.py"

# smoke docker specific vars
. ~/.smoke-mirrors/.profile

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="/Users/twoode/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
