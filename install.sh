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

# 2. Assumes the repo is already cloned: git clone https://github.com/aleckshen/dotfiles.git ~/dotfiles

# 3. Install Homebrew and the Brewfile first, since tmux (needed by the TPM step below) comes from it
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# put brew on PATH for this script; the installer only updates future shells via .zprofile
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

brew bundle --file "$DOTFILES/Brewfile"

# 4. Symlink dotfiles into place
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
link "$DOTFILES/.p10k.zsh" "$HOME/.p10k.zsh"
link "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
link "$DOTFILES/aerospace" "$HOME/.config/aerospace"
link "$DOTFILES/wezterm" "$HOME/.config/wezterm"
link "$DOTFILES/ghostty" "$HOME/.config/ghostty"
link "$DOTFILES/nvim" "$HOME/.config/nvim"
link "$DOTFILES/tmux" "$HOME/.config/tmux"
link "$DOTFILES/karabiner" "$HOME/.config/karabiner"

# 5. Bootstrap TPM, then let it install the gitignored plugins listed in tmux.conf
TPM_DIR="$DOTFILES/tmux/plugins/tpm"
if [ -d "$TPM_DIR/.git" ]; then
  echo "already cloned: $TPM_DIR"
else
  echo "Cloning TPM..."
  rm -rf "$TPM_DIR"
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# install_plugins reads TMUX_PLUGIN_MANAGER_PATH from a tmux server, so start one and source the config first
echo "Installing tmux plugins..."
tmux start-server
tmux source-file "$HOME/.config/tmux/tmux.conf"
"$TPM_DIR/bin/install_plugins"

# 6. Claude Code config lives in its own repo, cloned in place since ~/.claude is mostly untracked runtime state
CLAUDE_REPO="https://github.com/aleckshen/.claude.git"
if [ -d "$HOME/.claude/.git" ]; then
  echo "already cloned: $HOME/.claude"
else
  # ~/.claude already exists (Claude Code creates it on first run) and git won't clone into a non-empty dir,
  # so clone alongside, move the .git dir into place, then checkout overwrites tracked files with the committed version
  echo "Cloning Claude Code config..."
  rm -rf "$HOME/.claude.tmp"
  git clone "$CLAUDE_REPO" "$HOME/.claude.tmp"
  mkdir -p "$HOME/.claude"
  mv "$HOME/.claude.tmp/.git" "$HOME/.claude/"
  rm -rf "$HOME/.claude.tmp"
  git -C "$HOME/.claude" checkout -- .
  echo "cloned $HOME/.claude"
fi

echo "Done."
