#!/usr/bin/env bash

# Set default shell to bash
chsh -s /bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# sqlx-cli
cargo install sqlx-cli --no-default-features --features native-tls,postgres
