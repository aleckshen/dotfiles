# --- COMPLETION ---
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# LS_COLORS is unset on macOS, which expands to '' here: zsh's default colours
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# --- FZF-TAB ---
# fzf-tab replaces zsh's built-in menu, so that menu must stay off. Must load after compinit.
FZF_TAB="/opt/homebrew/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"
if [[ -f "$FZF_TAB" ]]; then
  source "$FZF_TAB"
  zstyle ':completion:*' menu no
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
fi

# --- FZF ---
# Ctrl-R history, Ctrl-T files, Alt-C cd. Must come after fzf-tab so it keeps fzf-tab as the Tab fallback.
command -v fzf >/dev/null 2>&1 && eval "$(fzf --zsh)"

# --- ALIASES ---
alias v="nvim ."
alias cc="claude --dangerously-skip-permissions"
alias ..="cd .."
alias gs="git status -sb"
alias gl="git log --decorate --graph --oneline"
alias gla="git log --all --decorate --graph --oneline"

# --- EDITOR ---
export EDITOR="nvim"

# --- YAZI ---
# y opens yazi and cds into its last folder on quit (q); Q quits without changing folder.
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# --- CURSOR ---
# TUIs like yazi leave a steady block cursor on exit, and inside tmux Ghostty's shell
# integration can't reset it, so restore the terminal's default cursor at each prompt.
_reset_cursor() { printf '\e[0 q' }
[[ -n $TMUX ]] && precmd_functions+=(_reset_cursor)

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
command -v mise >/dev/null 2>&1 && eval "$(mise activate zsh)"

# --- ZOXIDE ---
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init --cmd cd zsh)"

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
