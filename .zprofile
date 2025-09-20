eval "$(pyenv init --path)"
# Check for Homebrew and set the correct path for both Intel and Apple Silicon Macs
if test -d "/opt/homebrew/bin"; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif test -d "/usr/local/Homebrew/bin"; then
  eval "$(/usr/local/Homebrew/bin/brew shellenv)"
fi
