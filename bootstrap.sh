#!/usr/bin/env bash

# Do this maybe: https://github.com/mathiasbynens/dotfiles/blob/main/bootstrap.sh

# Set default shell to bash
chsh -s /bin/bash

echo 'set completion-ignore-case On' >> /etc/inputrc

gem install cocoapods

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install python3

curl -sSL https://install.python-poetry.org | python3 -

brew install nvm

nvm install 18.16.1

npm install --global yarn
