#!/usr/bin/env bash

brew update

# Upgrade any already-installed formulae.
brew upgrade


# Install here some useful binaries.
brew install --cask aws-vault
brew install warrensbox/tap/tfswitch

brew tap hashicorp/tap
brew install hashicorp/tap/terraform

brew install ngrok/ngrok/ngrok

brew install watch

# Remove outdated versions from the cellar.
brew cleanup
