# dotfiles

Minimal macOS setup: bash, Ghostty, Zed, Docker, Node, Rust.

## New machine

```bash
git clone https://github.com/Alw3ys/dotfiles.git ~/dotfiles && ~/dotfiles/install.sh
```

`install.sh` is idempotent: run it as often as you like, it only does what's missing.

## Layout

- `install.sh`: Homebrew, `Brewfile`, rustup, Claude Code, links, macOS settings
- `Brewfile`: every Homebrew formula and cask
- `home/`: every file here is symlinked to the same path under `~`
  (existing files are moved to `~/.dotfiles-backup/` first)

## Adding things

- `brewadd jq` / `brewadd --cask raycast`: installs it, adds it to the `Brewfile`, commits and pushes
- `brewrm <name>`: the reverse
- A new config file: put it under `home/` at its path relative to `~`, then run `install.sh`

## Not in git (per machine)

- `~/.extra`: secrets (tokens) and machine-only aliases, sourced by `.bash_profile`
- `~/.ssh/config.local`: SSH hosts, included by `~/.ssh/config`
