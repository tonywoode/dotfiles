DOTFILES
========

Move along please.....nothing of interest here...

Originally took inspiration from https://github.com/michaeljsmalley/dotfiles but I didn't like the way Michael took the dot out of the dotfiles. Self-description is always better than description by location, surely? A dotfile that's lost its dot is a sad thing indeed

Latterly, my inspiration came from https://github.com/mathiasbynens/dotfiles/, however I never quite understood how his boostrapping process could be workable, I've stuck with symlinking

To make these files live and to update a machine with new dots, run ./make_symlinks, which will always ensure all dotfiles in here are symlinked into ~. Note the exlusion list in that file (we don't want to include the .gitignore from this git repo for instance)

Note also there's an installer in the automator scripts dir for macos finder helpers
