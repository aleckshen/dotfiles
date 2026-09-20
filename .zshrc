# --- ALIASES ---
alias v="nvim ."
alias cc="claude --dangerously-skip-permissions"
alias ..="cd .."

# --- POWERLEVEL10 ---
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- MONGODB ---
export PATH="/opt/homebrew/opt/mongodb-community@5.0/bin:$PATH"

# --- MISE ---
eval "$(mise activate zsh)"

# --- NODE VERSION MANAGER ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# --- BREWFILE AUTOUPDATE ---
brew() {
  command brew "$@"
  local cmd="$1" type="brew" brewfile="$HOME/dotfiles/Brewfile" names=()
  [[ "$cmd" == "install" || "$cmd" == "uninstall" || "$cmd" == "remove" ]] || return
  shift
  for arg in "$@"; do
    case "$arg" in
      --cask) type="cask" ;;
      -*) ;;
      *) names+=("$arg") ;;
    esac
  done
  for name in "${names[@]}"; do
    if [[ "$cmd" == "install" ]]; then
      grep -qF "\"$name\"" "$brewfile" || { echo "$type \"$name\"" >>"$brewfile"; echo "Added $type \"$name\" to Brewfile"; }
    else
      sed -i '' -E "/^(brew|cask) \"$name\"/d" "$brewfile"
      echo "Removed $name from Brewfile"
    fi
  done
}

# --- LOCAL USER BIN ---
export PATH="$HOME/.local/bin:$PATH"
