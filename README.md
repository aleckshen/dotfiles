# dotfiles

> My personal development environment for macOS.

A terminal-centric, keyboard-driven setup:

- **AeroSpace** — i3-like tiling window manager for macOS
- **Ghostty** — fast, GPU-accelerated, native terminal emulator
- **Zsh** — shell with a Powerlevel10k prompt
- **tmux** — terminal multiplexer
- **Neovim** — terminal-based code editor
- **Claude Code** — agentic coding assistant, configured in [aleckshen/.claude](https://github.com/aleckshen/.claude)

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
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/aerospace ~/.config/aerospace
ln -s ~/dotfiles/wezterm ~/.config/wezterm
ln -s ~/dotfiles/ghostty ~/.config/ghostty
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux ~/.config/tmux
```

4. Install the tmux plugins. They are not tracked in this repo — TPM owns them,
   and the `tmux/plugins/` directory is gitignored.

```zsh
git clone https://github.com/tmux-plugins/tpm ~/dotfiles/tmux/plugins/tpm
tmux start-server
tmux source-file ~/.config/tmux/tmux.conf
~/dotfiles/tmux/plugins/tpm/bin/install_plugins
```

The `start-server` and `source-file` steps matter: `install_plugins` reads its
install path from a running tmux server, and without one it reports success
while installing nothing.

5. Clone the Claude Code config. It lives in its own repo and is cloned in place
   rather than symlinked, because `~/.claude` also holds runtime state (sessions,
   history, caches) that stays untracked.

```zsh
git clone https://github.com/aleckshen/.claude.git ~/.claude
```

If `~/.claude` already exists, `git` will refuse to clone into it — `install.sh`
handles that case by cloning alongside and moving `.git` into place.

6. Install Homebrew, followed by the software listed in the Brewfile.

```zsh
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Pass in file Brewfile location
brew bundle --file ~/dotfiles/Brewfile
```

Steps 3 to 6 (plus the Xcode CLT check from step 1) are also available as a single script, `install.sh`, once the repo is cloned:

```zsh
~/dotfiles/install.sh
```
