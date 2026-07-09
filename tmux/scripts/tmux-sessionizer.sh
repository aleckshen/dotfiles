#!/usr/bin/env bash

# tmux-sessionizer: fuzzy-find a project directory and open/switch to a
# tmux session for it. Edit the `find` line below to change search paths.

if [[ $# -eq 1 ]]; then
    # a path was passed directly on the command line (skip the picker)
    selected=$1
else
    # pick a project: ~/dotfiles itself + its subfolders, plus ~/Documents subfolders
    selected=$( {
        echo "$HOME/dotfiles"
        find ~/dotfiles ~/Documents -mindepth 1 -maxdepth 1 -type d -not -name '.*'
    } | fzf --reverse)
fi

# nothing selected (fzf cancelled) -> quit
[[ -z $selected ]] && exit 0

# tmux session names can't contain '.' or ':' -> replace them with '_'
selected_name=$(basename "$selected" | tr '.:' '__')
tmux_running=$(pgrep tmux)

# case 1: not inside tmux AND no server running -> start a fresh session
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi

# case 2: the session doesn't exist yet -> create it detached
if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

# switch the current client to the (new or existing) session
tmux switch-client -t "$selected_name"
