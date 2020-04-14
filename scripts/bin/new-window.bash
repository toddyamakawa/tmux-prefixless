#!/usr/bin/env bash
if [[ -d "$1" ]]; then
	new_path="$1"
elif [[ -f "$1" ]]; then
	new_path="$(dirname "$1")"
else
	new_path="$(tmux display-message -p '#{pane_current_path}')"
fi
tmux new-window -c "$new_path"
tmux split-pane -h -c "$new_path"
