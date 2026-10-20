#!/usr/bin/env bash
# Idempotent macOS setup: safe to run as many times as you like.
# Every step checks the current state and only does what's missing.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

step() { printf '\n\033[1;34m==> %s\033[0m\n' "$*"; }
ok()   { printf '    \033[32m✓\033[0m %s\n' "$*"; }
skip() { printf '    \033[33m-\033[0m %s\n' "$*"; }

[ "$(uname -s)" = "Darwin" ] || { echo "install.sh is macOS-only"; exit 1; }

step "Homebrew"
if [ -x /opt/homebrew/bin/brew ]; then
  ok "installed"
else
  # The installer needs sudo; ask for the password up front so it can run unattended
  sudo -v
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

step "Brewfile packages"
installed_formulae="$(brew list --formula -1)"
installed_casks="$(brew list --cask -1)"
while IFS= read -r line; do
  kind="${line%% *}"
  name="$(printf '%s' "$line" | cut -d'"' -f2)"
  case "$kind" in
    brew)
      if printf '%s\n' "$installed_formulae" | grep -qx "$name"; then ok "$name"
      else brew install "$name" && ok "$name (installed)"; fi ;;
    cask)
      if printf '%s\n' "$installed_casks" | grep -qx "$name"; then ok "$name"; continue; fi
      # App already in /Applications (e.g. installed from a .dmg)? Leave it, it self-updates.
      app="$(brew info --cask --json=v2 "$name" | jq -r '.casks[0].artifacts[] | objects | .app // empty | .[0] | strings' | head -1)"
      if [ -n "$app" ] && [ -d "/Applications/$app" ]; then ok "$name (already in /Applications)"
      else brew install --cask "$name" && ok "$name (installed)"; fi ;;
  esac
done < <(grep -E '^(brew|cask) "' "$DOTFILES/Brewfile")

step "Rust (rustup)"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
if command -v rustup >/dev/null; then
  ok "$(rustc --version)"
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
  . "$HOME/.cargo/env"
fi

step "Cargo tools"
# Not in Homebrew (cargo-watch's formula is disabled), so install with cargo into ~/.cargo/bin
for tool in cargo-watch; do
  if command -v "$tool" >/dev/null; then ok "$tool"
  else cargo install --locked "$tool" && ok "$tool (installed)"; fi
done

step "Claude Code"
if command -v claude >/dev/null || [ -x "$HOME/.local/bin/claude" ]; then
  ok "installed"
else
  curl -fsSL https://claude.ai/install.sh | bash
fi

step "Link dotfiles (home/ -> ~)"
mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh"
cd "$DOTFILES/home"
find . -type f ! -name .DS_Store | sed 's|^\./||' | while IFS= read -r rel; do
  src="$DOTFILES/home/$rel"; dst="$HOME/$rel"
  if [ "$(readlink "$dst" 2>/dev/null)" = "$src" ]; then ok "~/$rel"; continue; fi
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mkdir -p "$(dirname "$BACKUP/$rel")" && mv "$dst" "$BACKUP/$rel"
    skip "backed up existing ~/$rel to $BACKUP"
  fi
  ln -sfn "$src" "$dst" && ok "~/$rel (linked)"
done
# Remove dead links left behind by files that were deleted from the repo
for link in "$HOME"/.[!.]* "$HOME"/* "$HOME"/.config/*/*; do
  if [ -L "$link" ] && [ ! -e "$link" ]; then
    case "$(readlink "$link")" in
      *dotfiles/*) rm "$link" && skip "removed dead link $link" ;;
    esac
  fi
done

step "macOS settings"
if [ "$(dscl . -read "$HOME" UserShell | awk '{print $2}')" != /bin/bash ]; then
  chsh -s /bin/bash
fi
ok "login shell is bash"
mkdir -p "$HOME/Documents/screenshots"
defaults write com.apple.screencapture location "$HOME/Documents/screenshots"
ok "screenshots -> ~/Documents/screenshots"

[ -f "$HOME/.extra" ] || skip "no ~/.extra yet (put secrets + machine-only aliases there)"
printf '\n\033[1;32mDone.\033[0m Open a new terminal to pick up changes.\n'
