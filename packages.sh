#!/usr/bin/env bash

brew install stow

# Probuf
brew install protobuf

# GPG
brew install gpg

# Neovim
brew install neovim

# Python
brew install python3
curl -sSL https://install.python-poetry.org | python3 -

# Ruby
brew install ruby

# Node
brew install node
brew install nvm

npm install -g hueadm

brew install watch

brew install awscli
brew install --cask aws-vault
brew install --cask session-manager-plugin

brew install pulumi/tap/pulumi

brew install jq
# Remove outdated versions from the cellar.
brew cleanup

# Ruby Installs
gem install deb-s3
