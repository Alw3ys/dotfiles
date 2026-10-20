#!/usr/bin/env bash

# Load the shell dotfiles (~/.extra is gitignored: secrets + machine-specific stuff)
for file in ~/.{exports,aliases,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.local/bin:$PATH"

# bash-completion v1 (v2 needs bash 4.2+, macOS ships 3.2)
[ -r "$HOMEBREW_PREFIX/etc/bash_completion" ] && . "$HOMEBREW_PREFIX/etc/bash_completion"

# Ghostty shell integration
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi

# Rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Java (Android builds)
[ -d /Library/Java/JavaVirtualMachines/temurin-17.jdk ] && export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"

ulimit -n 10240
