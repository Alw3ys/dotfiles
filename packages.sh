#!/usr/bin/env bash

# Apps
brew install --cask ghostty
brew install --cask zed
brew install --cask docker
brew install --cask font-jetbrains-mono

# CLI
brew install stow
brew install bash-completion@2
brew install gh
brew install jq

# Node (via nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | PROFILE=/dev/null bash
. "$HOME/.nvm/nvm.sh" && nvm install --lts

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path

# Claude Code CLI (installs to ~/.local/bin)
curl -fsSL https://claude.ai/install.sh | bash

# Java (Android builds)
brew install --cask temurin@17

brew cleanup
