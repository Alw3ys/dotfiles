#!/usr/bin/env bash

# Set default shell to bash
chsh -s /bin/bash

echo 'set completion-ignore-case On' >> /etc/inputrc

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

