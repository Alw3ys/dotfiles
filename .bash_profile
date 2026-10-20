#!/usr/bin/env bash

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.

for file in ~/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/Users/alvaromolina/.local/bin:$PATH"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

export DENO_INSTALL="/Users/alvaromolina/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"


# Ghostty shell integration for Bash. This must be at the top of your bashrc!
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alvaromolina/google-cloud-sdk/path.bash.inc' ]; then . '/Users/alvaromolina/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alvaromolina/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/alvaromolina/google-cloud-sdk/completion.bash.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

# Added by `rbenv init` on Thu Mar  6 11:06:14 CET 2025
eval "$(rbenv init - --no-rehash bash)"

. "/Users/alvaromolina/.deno/env"

export SMITH_CLI_INSTALL="/Users/alvaromolina/.smith"
export PATH="$SMITH_CLI_INSTALL/bin:$PATH"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"
ulimit -n 10240
