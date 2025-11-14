# --- MONGODB ---
export PATH="/opt/homebrew/opt/mongodb-community@5.0/bin:$PATH"

# --- NODE VERSION MANAGER ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# --- BREWFILE AUTOUPDATE ---
brew() {
  command brew "$@"
  if [[ "$1" == "install" || "$1" == "uninstall" || "$1" == "remove" ]]; then
    brew bundle dump --force --file="$HOME/dotfiles/Brewfile" >/dev/null
    echo "Brewfile automatically updated!"
  fi
}