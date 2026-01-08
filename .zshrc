# any speed issues with plugins etc see this for profiling (enable first line and last line as per https://blog.jonlu.ca/posts/speeding-up-zsh)
# zmodload zsh/zprof
ZSH_DISABLE_COMPFIX="true" # because i'm not going to change perms on /usr/local/share - see github.com/ohmyzsh/issues/8205, see also compinit flag below
# Fix Problem: Stop the background query 'execute: 3333/3333/3333' on tmux restore (see last line of file also)
if [[ -n $TMUX ]]; then
  export COLORFGBG=""
  unsetopt MONITOR
fi
DISABLE_AUTO_TITLE="true" # stop zsh renaming my tmux windows https://stackoverflow.com/a/38667859/3536094
# temporary fix for git prompt not showing, remove when fixed - https://github.com/ohmyzsh/ohmyzsh/issues/12328
zstyle ':omz:alpha:lib:git' async-prompt no 
# I put all my temp text files here....
MY_TEMP_DIR="$HOME/temp/"
[[ -d $MY_TEMP_DIR ]] || mkdir $MY_TEMP_DIR

# Function to add a directory to the PATH if it exists and isn't already there (ie: used later on in here)
path_add() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="${1}:${PATH}"
  fi
}

# tmux starts by default, $- == *i* says 'if current shell isn't interactive
# I replaced my own implementation of this with the following as it seemed them most thorough:  https://stackoverflow.com/a/42351698/3536094
# if this ever becomes unacceptable you might also want to check out the zsh plugin for tmux - https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#tmux
# since it has an env var to set that does this and subtelties on it eg: ZSH_TMUX_AUTOSTART
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

# brew's groovy installer says to set this, but strangely didn't set it for you
export GROOVY_HOME="$HOMEBREW_PREFIX/opt/groovy/libexec"

# completions for brew https://docs.brew.sh/Shell-Completion (led to from https://cli.github.com/manual/gh_completion[])
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
# use additional completions from brews zsh-completions
FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

if ! [[ -d $ZSH ]]; then
  echo "oh-my-zsh can't be found, installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# I installed antigen when looking for a way to make the node version manager NVM work well
# https://github.com/zsh-users/antigen and https://github.com/lukechilds/zsh-nvm
# Load Antigen based on system architecture
source "$HOMEBREW_PREFIX/share/antigen/antigen.zsh"
antigen bundle lukechilds/zsh-nvm
antigen apply

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
# I don't know why, but this has to be specified before oh-my-zsh is loaded
ZSH_THEME="bullet-train"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
plugins=(
  brew # its just aliases since homebrew ships with completions now
  colored-man-pages 
  colorize
  common-aliases 
  dash # open dash with dash or do dash python or dash python:tuple
  dircycle  # ctrl+shift+left or right will cycle between directory stack like browser back/forward
  dirhistory # similar to dircycle but with alt+left/right/up/down (inc got to parent dir and first child)
  docker 
  docker-compose 
  git 
  gitignore # shortcuts for working with gitignore.io which gives you templates for environments/languages etc - gi list or gi java
  httpie 
  history # shortcuts like hsi = do a case insensitve grep search of history
  history-substring-search # type in any part of any command from history, UP/DOWN will cycle through matches
  jsontools # pp_json pretty prints, is_json tells you if valid, urlencode_json and urldecode_json
  npm # completion and aliases
  nvm # adds autocompletions for nvm. Also automatically sources nvm, so you don't need to do it manually in your .zshrc
  redis-cli # completions
  tmux # alias but also very useful looking config variables i've not yet used, see top of this file
  vagrant # completions and aliases vup is vagrant up, vh vagrant halt, vssh vagrant ssh
  vi-mode # This plugin increase vi-like zsh functionality - see list here: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode - in particular vv opens vim to edit console command
  yarn # completions and aliases
)

# brew doctor will complain it wants /usr/local/sbin in your path, and suggests putting it before anything else (not that it put very much in there...)
# User configuration - TODO: i'm overwriting $PATH here, but if I don't I get duplication. What's the safe way? see https://superuser.com/questions/39751/add-directory-to-path-if-its-not-already-there
# Add Homebrew's sbin directory
path_add "$(brew --prefix)/sbin"
# Now, add the MAMP bin directory -  This checks for the two most common Cask installation locations
path_add "/Applications/MAMP/Library/bin"
path_add "$HOME/Applications/MAMP/Library/bin"

# export PATH="/usr/local/sbin:$PATH:/Applications/MAMP/Library/bin"
# export MANPATH="/usr/local/man:$MANPATH"
#
# add lunarvim to path (that's all for now that's at this path)
export PATH="$HOME/.local/bin:$PATH"

# update oh-my-zsh without prompting (this stopped auto-updating as i had it AFTER the source for ages...)
DISABLE_UPDATE_PROMPT=true

# add zsh-completions to the path - https://github.com/zsh-users/zsh-completions?tab=readme-ov-file#oh-my-zsh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
# and zsh-autosuggestions
# HOMEBREW_PREFIX isn't available unless you eval brew's shellenv in your .zprofile - see brew cmd output on first run: https://stackoverflow.com/a/78734952   
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source $ZSH/oh-my-zsh.sh

# bullet-train theme is not an oh-my-zsh default, so we have to install it, and powerline too (which many themes need), note ZSH_CUSTOM only available after the oh-my-zsh source
if ! [[ -f $ZSH_CUSTOM/themes/bullet-train.zsh-theme ]]; then
  echo "Bullet Train zsh theme not installed....installing it and the powerline fonts it needs"
  curl -fsSL http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme > $ZSH_CUSTOM/themes/bullet-train.zsh-theme 
  # assume we don't have powerline either - this just copied from powerlines readme
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts && ./install.sh
  cd .. && rm -rf fonts
fi


# You may need to manually set your language environment
# and one day i did, else git_prompt_info:5: character not in range - https://superuser.com/questions/509950/why-are-unicode-characters-not-rendering-correctly
export LANG=en_GB.UTF-8
# export LANG=en_US.UTF-8

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

# NOTE MY PERSONAL (non-interactive shell) ALIASES MOVED TO .zshenv SO E.G.: VIM CAN SEE THEM SEE COMMENT IN https://stackoverflow.com/a/4642855


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000 #COMMAND history - don't leave these at default 1000!
SAVEHIST=100000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename ~/.zshrc
autoload -Uz compinit
# tmux guard to stop compinit being saturated on tmux restore - eg: bat issue
# -u flag because i'm not going to change perms on /usr/local/share - see github.com/ohmyzsh/issues/8205
if [[ -n $TMUX ]]; then
  # Inside TMUX: Use the cache (-C) and don't check for new files to avoid corruption
  compinit -u -C
else
  # Outside TMUX: Normal initialization
  compinit -u
fi

# End of lines added by compinstall
 
#Add the following to your zshrc to access the online help:
unalias run-help &>/dev/null #https://bugs.launchpad.net/ubuntu/+source/zsh/+bug/305346
autoload run-help
HELPDIR="$HOMEBREW_PREFIX/share/zsh/help"
# I hate how 'help' is now 'run-help' in zsh, i use it all the time
alias help=run-help

# extend git with hub https://hub.github.com/
alias git=hub

# my personal functions
. ~/.my-shell-functions

# smoke docker specific vars
. ~/.smoke-mirrors/.profile

# don't try using iterm's shell integration with regular tmux, only works with iterm's tmux control mode
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zsh default text
#
# Uncomment the following line to use case-sensitive completion.
# # CASE_SENSITIVE="true"
# # Uncomment the following line to use hyphen-insensitive completion. Case
# # sensitive completion must be off. _ and - will be interchangeable.
# # HYPHEN_INSENSITIVE="true"
# # Uncomment the following line to disable bi-weekly auto-update checks.
# # DISABLE_AUTO_UPDATE="true"
# # Uncomment the following line to change how often to auto-update (in days).
# # export UPDATE_ZSH_DAYS=13
# # Uncomment the following line to disable colors in ls.
# # DISABLE_LS_COLORS="true"
# # Uncomment the following line to disable auto-setting terminal title.
# # DISABLE_AUTO_TITLE="true"
# # Uncomment the following line to enable command auto-correction.
# # ENABLE_CORRECTION="true"
# # Uncomment the following line to display red dots whilst waiting for completion.
# # COMPLETION_WAITING_DOTS="true"
# # Uncomment the following line if you want to disable marking untracked files
# # under VCS as dirty. This makes repository status check for large repositories
# # much, much faster.
# # DISABLE_UNTRACKED_FILES_DIRTY="true"
# # Uncomment the following line if you want to change the command execution time
# # stamp shown in the history command output.
# # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# # HIST_STAMPS="mm/dd/yyyy"
# # Would you like to use another custom folder than $ZSH/custom?
# # ZSH_CUSTOM=/path/to/new-custom-folder
#
# zsh syntax highlighting plugin (emulates fish shell) must be the last line, must be the last plugin sourced too, see https://github.com/zsh-users/zsh-syntax-highlighting?tab=readme-ov-file#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# nvm auto-switching - see also https://stackoverflow.com/questions/23556330/run-nvm-use-automatically-every-time-theres-a-nvmrc-file-on-the-directory
# https://github.com/nvm-sh/nvm#calling-nvm-use-automatically-in-a-directory-with-a-nvmrc-file but mostly now see:
# https://github.com/nvm-sh/nvm?tab=readme-ov-file#zsh
# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
# if that doesn't speed up vscode non-terminal launch then resort to https://stackoverflow.com/a/66513254/3536094, but may all be a waste of time https://code.visualstudio.com/docs/supporting/FAQ

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for npm-sync package
# uninstall by removing these lines or running `tabtab uninstall npm-sync`
[[ -f /Users/twoode/.nvm/versions/node/v12.18.3/lib/node_modules/npm-modules-sync/node_modules/tabtab/.completions/npm-sync.zsh ]] && . /Users/twoode/.nvm/versions/node/v12.18.3/lib/node_modules/npm-modules-sync/node_modules/tabtab/.completions/npm-sync.zsh

# for pyenv, see also .zprofile, it could be that the .zprofile change means we don't need to do this anymore: https://stackoverflow.com/a/69614573/3536094
eval "$(pyenv init -)"
# just following https://akrabat.com/creating-virtual-environments-with-pyenv/ because it helps to also use virtualenv to use specific python versions per-project
eval "$(pyenv virtualenv-init -)"
#copilot aliases - https://docs.github.com/en/copilot/github-copilot-in-the-cli/using-github-copilot-in-the-cli - automated the install via ai

# GitHub Copilot CLI Health Check
# ==========================================================
if [[ $- == *i* ]]; then
    # Check for the binary
    if ! command -v copilot &> /dev/null; then
        echo "🚨 GitHub Copilot CLI not found. Run 'gh-setup'."
    # Check for the config file (where auth lives)
    elif [[ ! -f "$HOME/.copilot/config.json" ]]; then
        echo "🔑 GitHub Copilot CLI not authenticated. Run 'gh-setup'."
    fi
fi

# chatgpt codex completions for zsh - see https://developers.openai.com/codex/cli/features#shell-completions
if command -v codex >/dev/null 2>&1; then
    eval "$(codex completion zsh)"
fi

# Restore MONITOR option if in tmux to fix 'execute: 3333/3333/3333' issue
[[ -n $TMUX ]] && setopt MONITOR
# zprof #for profiling as and when needed
