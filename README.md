DOTFILES
========

Move along please.....nothing of interest here...

Originally took inspiration from https://github.com/michaeljsmalley/dotfiles but I didn't like the way Michael took the dot out of the dotfiles. Self-description is always better than description by location, surely? A dotfile that's lost its dot is a sad thing indeed

Latterly, my inspiration came from https://github.com/mathiasbynens/dotfiles/, however I never quite understood how his boostrapping process could be workable, I've stuck with symlinking

The bash scripts are numbered by suggested order of running on a new machine, some reasons why:
1) brew_cask_installer_script - needs running first for eg: tmux's helper 'reattach-to-user-namespace', and the mac-app-store, to name just two
2) mac_app_store_installer - just because it used to be part of the brew install script but it was a slightly separate concern, and has no other dependencies apart from those stated
3) make_symlinks - To make these files live and to update a machine with new dots, run ./make_symlinks, which will always ensure all dotfiles in here are symlinked into ~. Note the exlusion list in that file (we don't want to include the .gitignore from this git repo for instance). Should setup eg: tmux and vim quite well with self-installing plugins, some things will need npm modules to work correctly but we don't want to install npm modules before we've installed nvm (hopefully from .oh-my-zsh ?)
4) sync_npm_modules - because (so long as you have nvm) now its time to configure higher-level things and we have the tools we need for that
5) automator_scripts - can be installed anytime really (there's a bash installer in the automator scripts dir for macos finder helpers)

