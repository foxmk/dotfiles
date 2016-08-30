#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update
brew upgrade --all

# Install programs
brew install autoenv
brew install bash
brew install git
brew install git-flow
brew install go
brew install httpie
brew install node
brew install nvm
brew install pass
brew install python
brew install python3
brew install ssh-copy-id
brew install sqlite
brew install zsh

brew cask install atom
brew cask install docker
brew cask install dropbox
brew cask install google-chrome
brew cask install gpgtools
brew cask install hyperswitch
# brew cask install intellij-idea
brew cask install iterm2
brew cask install java
brew cask install skype
brew cask install sourcetree
brew cask install telegram
brew cask install vagrant
brew cask install virtualbox

# Remove outdated versions from the cellar.
brew cleanup
