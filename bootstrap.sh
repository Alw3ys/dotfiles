#!/usr/bin/env bash

# Do this maybe: https://github.com/mathiasbynens/dotfiles/blob/main/bootstrap.sh

# Set default shell to bash
chsh -s /bin/bash

gem install cocoapods

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'set completion-ignore-case On' >> /etc/inputrc
