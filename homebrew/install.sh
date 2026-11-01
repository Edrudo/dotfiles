#!/bin/bash
#
# Homebrew
#
# Installs the Mac OS X package manager.
# Updates its indexes and installs the desired dependancies.
#

info "Starting homebrew install..."

# Check for Homebrew and install if necessary.
if test ! $(which brew)
then
  info "Installing homebrew..."

  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew "$HOME/.linuxbrew/bin/brew"
  do
    if test -x "$brew_bin"
    then
      eval "$("$brew_bin" shellenv)"
      break
    fi
  done
fi

# Update Homebrew and installed packages.
brew cleanup
brew update
brew upgrade

# Install Brewfile containing package dependancies ignoring any failures.
brew bundle --file="$DOTFILES_ROOT/homebrew/Brewfile" || true

# Perform a final clean up having installed new packages.
brew cleanup

success "Homebrew installation complete"
