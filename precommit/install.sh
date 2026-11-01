#!/bin/bash
#
# Pre-commit
#
# Installs pre-commit hooks into existing BioStrand repos. New clones and inits get the hook from
# the ~/.git-template template (see git/gitconfig.symlink and ./.git-template).
# Assumes 'pre-commit' already exists in $PATH - see homebrew topic.
#

info "Starting pre-commit install..."

if test -d "$HOME/Biostrand"
then
  "$DOTFILES_ROOT/bin/precommit-install-repos" "$HOME/Biostrand"
else
  info "No ~/Biostrand directory, skipping existing repos"
fi

success "Pre-commit installation complete"
