#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

# 1. Xcode command line tools (prerequisite for git and Homebrew)
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode command line tools..."
  xcode-select --install
  echo "Re-run this script after the Xcode CLT installer finishes."
  exit 0
fi

# 2. This script assumes the repo is already cloned to ~/dotfiles:
#      git clone https://github.com/aleckshen/dotfiles.git ~/dotfiles

# 3. Symlink dotfiles into place
link() {
  local target="$1" link_path="$2"
  if [ -L "$link_path" ] && [ "$(readlink "$link_path")" = "$target" ]; then
    echo "already linked: $link_path"
    return
  fi
  if [ -e "$link_path" ] || [ -L "$link_path" ]; then
    echo "skipping $link_path (already exists, not our symlink)"
    return
  fi
  ln -s "$target" "$link_path"
  echo "linked $link_path -> $target"
}

mkdir -p "$HOME/.config"

link "$DOTFILES/.zshrc" "$HOME/.zshrc"
link "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
link "$DOTFILES/aerospace" "$HOME/.config/aerospace"
link "$DOTFILES/wezterm" "$HOME/.config/wezterm"
link "$DOTFILES/ghostty" "$HOME/.config/ghostty"
link "$DOTFILES/nvim" "$HOME/.config/nvim"
link "$DOTFILES/tmux" "$HOME/.config/tmux"

# 4. Install Homebrew, then the software listed in the Brewfile
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --file "$DOTFILES/Brewfile"

echo "Done."
