#!/usr/bin/env bash

brew install stow

# Probuf
brew install protobuf

# Python
brew install python3
curl -sSL https://install.python-poetry.org | python3 -

# Node
brew install node
brew install nvm

npm install -g hueadm

brew install watch

brew install awscli
brew install --cask aws-vault

brew install pulumi/tap/pulumi

# Remove outdated versions from the cellar.
brew cleanup

