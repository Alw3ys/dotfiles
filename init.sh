#!/usr/bin/env bash

# Keep bash as the default shell
chsh -s /bin/bash

# Screenshots go to ~/Documents/screenshots
mkdir -p "$HOME/Documents/screenshots"
defaults write com.apple.screencapture location "$HOME/Documents/screenshots"

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Packages, then link dotfiles into ~
"$(dirname "$0")/packages.sh"
cd "$(dirname "$0")" && stow .
