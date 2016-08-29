#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update
brew upgrade --all

# Install programs
brew install bash
brew install zsh
brew install python
brew install python3
brew install go

brew install git
brew install ssh-copy-id

# Remove outdated versions from the cellar.
brew cleanup
