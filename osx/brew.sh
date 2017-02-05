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
    ack
    autoenv
    bash
    cookiecutter
    git
    gradle
    htop
    httpie
    jq
    protobuf
    python
    python3
    sbt
    sqlite
    ssh-copy-id
    the_silver_searcher
    tmux
    zsh
)

brew install "${brews[@]}"
# brew cask install "${casks[@]}"

# Remove outdated versions from the cellar
brew cleanup
