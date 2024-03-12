#!/usr/bin/env bash

# Set default shell to bash
chsh -s /bin/bash

# Set default screenshots path.
SCREENSHOTS_PATH="~/Documents/screenshots"
mkdir $SCREENSHOTS_PATH
defaults write com.apple.screencapture location $SCREENSHOTS_PATH

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# sqlx-cli
cargo install sqlx-cli --no-default-features --features native-tls,postgres

# cargo-deb
cargo install cargo-deb
