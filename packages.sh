#!/usr/bin/env bash

brew install stow

# Python
brew install python3
curl -sSL https://install.python-poetry.org | python3 -

# Node
brew install node
brew install nvm

brew install watch

brew install awscli

brew install pulumi/tap/pulumi

# Remove outdated versions from the cellar.
brew cleanup

