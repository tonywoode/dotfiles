# any speed issues with plugins etc see this for profiling (enable first line and last line as per https://blog.jonlu.ca/posts/speeding-up-zsh)
# zmodload zsh/zprof
ZSH_DISABLE_COMPFIX="true" # because i'm not going to change perms on /usr/local/share - see github.com/ohmyzsh/issues/8205, see also compinit flag below
DISABLE_AUTO_TITLE="true" # stop zsh renaming my tmux windows https://stackoverflow.com/a/38667859/3536094
# temporary fix for git prompt not showing, remove when fixed - https://github.com/ohmyzsh/ohmyzsh/issues/12328
zstyle ':omz:alpha:lib:git' async-prompt no 
# I put all my temp text files here....
MY_TEMP_DIR="$HOME/temp/"
[[ -d $MY_TEMP_DIR ]] || mkdir $MY_TEMP_DIR

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
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# completions for brew https://docs.brew.sh/Shell-Completion (led to from https://cli.github.com/manual/gh_completion[])
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
# use additional completions from brews zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

if ! [[ -d $ZSH ]]; then
  echo "oh-my-zsh can't be found, installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# I installed antigen when looking for a way to make the node version manager NVM work well
# https://github.com/zsh-users/antigen and https://github.com/lukechilds/zsh-nvm
source /usr/local/share/antigen/antigen.zsh
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
export PATH="/usr/local/sbin:$PATH:/Applications/MAMP/Library/bin"
# export MANPATH="/usr/local/man:$MANPATH"
# add lunarvim to path (that's all for now that's at this path)
export PATH="$HOME/.local/bin:$PATH"

# update oh-my-zsh without prompting (this stopped auto-updating as i had it AFTER the source for ages...)
DISABLE_UPDATE_PROMPT=true

# add zsh-completions to the path - https://github.com/zsh-users/zsh-completions?tab=readme-ov-file#oh-my-zsh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
# and zsh-autosuggestions
# HOMEBREW_PREFIX isn't available unless you eval brew's shellenv in your .zprofile - see brew cmd output on first run: https://stackoverflow.com/a/78734952   
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
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
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename ~/.zshrc
autoload -Uz compinit
compinit -u  # -u flag because i'm not going to change perms on /usr/local/share - see github.com/ohmyzsh/issues/8205

# End of lines added by compinstall
 
#Add the following to your zshrc to access the online help:
unalias run-help &>/dev/null #https://bugs.launchpad.net/ubuntu/+source/zsh/+bug/305346
autoload run-help
HELPDIR=/usr/local/share/zsh/help
# I hate how 'help' is now 'run-help' in zsh, i use it all the time
alias help=run-help

# extend git with hub https://hub.github.com/
alias git=hub

# my personal functions
. ~/.my-shell-functions

# smoke docker specific vars
. ~/.smoke-mirrors/.profile

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

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
# zsh syntax highlighting plugin (emulates fish shell) must be the last line, must be the last plugin sourced too, who knows why...
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
# ==========================================================
# GitHub Copilot CLI Setup - Automated Check and Install
# ==========================================================

# Check if the shell is interactive by checking for the PS1 variable
if [ -n "$PS1" ]; then
    # Check if gh (GitHub CLI) is available
    if ! command -v gh &> /dev/null; then
        echo "GitHub CLI 'gh' is not installed. Please install it to use gh copilot."
        echo "You can install it with Homebrew: 'brew install gh'"
    else
        # Check if a user is authenticated with GitHub CLI
        if ! gh auth status &> /dev/null; then
            echo ""
            echo "GitHub CLI is not authenticated. Please log in to use gh copilot."
            echo "You must log in to set the Copilot aliases"
            echo ""
            # The gh copilot extension specifically requires authentication via the GitHub CLI OAuth app, not just a Personal Access Token (PAT) from the GH_TOKEN environment variable - https://github.com/orgs/community/discussions/167158
            #gh auth login
            gh auth login --web -h github.com
        fi
    
        # Check if the gh-copilot extension is installed
        if ! gh extension list | grep -q "copilot"; then
            echo ""
            echo "The 'gh-copilot' extension is not installed."
            echo "You must install it to use gh copilot."
            echo ""
            gh extension install github/gh-copilot
        fi
        
        # If everything is configured, then set the aliases.
        if gh auth status &> /dev/null && gh extension list | grep -q "copilot"; then
            eval "$(gh copilot alias -- zsh)"
        fi
    fi
fi

# zprof #for profiling as and when needed
