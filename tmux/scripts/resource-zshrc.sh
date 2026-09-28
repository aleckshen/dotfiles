#!/usr/bin/env bash

# Re-source .zshrc in every pane across every session that's sitting at a
# plain zsh prompt, skipping panes running something else (nvim, claude,
# btop, etc.) so we don't type into the wrong program.

tmux list-panes -a -F "#{pane_id} #{pane_current_command}" | awk '$2 == "zsh" { print $1 }' | while read -r pane; do
  tmux send-keys -t "$pane" "source ~/.zshrc" Enter
done
