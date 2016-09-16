#!/usr/bin/env bash

# Ask for the administrator password
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update
brew upgrade --all

# Install programs
brews=(
    autoenv
    bash
    git
    git-flow
    git-extras
    go
    httpie
    node
    nvm
    pass
    python
    python3
    ssh-copy-id
    sqlite
    zsh
)

casks=(
    atom
    docker
    # dropbox
    google-chrome
    gpgtools
    hyperswitch
    # intellij-idea
    iterm2
    java
    skype
    sourcetree
    telegram
    vagrant
    virtualbox
    flux
)

brew install "${brews[@]}"
brew cask install "${casks[@]}"

# Remove outdated versions from the cellar
brew cleanup
