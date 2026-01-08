# some shortcuts. I like to type cd sometimes.
CODE=~/CODE
alias CODE="cd $CODE"
scripts=$CODE/Scripts
alias scripts="cd $scripts"
scratch=$CODE/Scratch
alias scratch="cd $scratch"
dots=$scripts/Dotfiles/dotfiles
alias dots="cd $dots"
repo=$CODE/Repo
alias repo="cd $repo"
smoke=$repo/Smoke/smoke_github
alias smoke="cd $smoke"
atlas=$smoke/atlas
alias atlas="cd $atlas"
atlasui=$atlas/atlas-ui
alias atlasui="cd $atlasui"
atlasdata=$smoke/atlas-data
alias atlasdata="cd $atlasdata"
flex=$smoke/flex-services
alias flex="cd $flex"
desktop=~/Desktop
alias desktop="cd $desktop"
quickplay=~/CODE/REPO/Quickplay
alias quickplay="cd $quickplay"
qpnode="$scripts/quickPlayNode"
alias qpnode="cd $qpnode"
session="$CODE/AppData/vim/session"
alias session="cd $session"
# Initialize Homebrew for ALL shells (not just login) - fixes eval issue eg bat
if [[ -d "/opt/homebrew/bin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -d "/usr/local/Homebrew/bin" ]]; then
  eval "$(/usr/local/Homebrew/bin/brew shellenv)"
fi

. "$HOME/.cargo/env"
