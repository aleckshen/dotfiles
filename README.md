# dotfiles

> My personal development environment for macOS.

A terminal-centric, keyboard-driven setup:

- **AeroSpace** — i3-like tiling window manager for macOS
- **Ghostty** — fast, GPU-accelerated, native terminal emulator
- **Zsh** — shell with a Powerlevel10k prompt
- **tmux** — terminal multiplexer
- **Neovim** — terminal-based code editor

## Installation

### Steps to bootstrap a new Mac

1. Install Apple's command line tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```

2. Clone repo into root directory.

```zsh
git clone https://github.com/aleckshen/dotfiles.git
```

3. Create symlinks in the home directory to the real files in the repo.

```zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/aerospace ~/.config/aerospace
ln -s ~/dotfiles/wezterm ~/.config/wezterm
ln -s ~/dotfiles/ghostty ~/.config/ghostty
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux ~/.config/tmux
```

4. Install Homebrew, followed by the software listed in the Brewfile.

```zsh
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Pass in file Brewfile location
brew bundle --file ~/dotfiles/Brewfile
```

Steps 3 and 4 (plus the Xcode CLT check from step 1) are also available as a single script, `install.sh`, once the repo is cloned:

```zsh
~/dotfiles/install.sh
```
