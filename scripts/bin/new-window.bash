#!/usr/bin/env bash
pane_current_path="$(tmux display-message -p '#{pane_current_path}')"
tmux new-window -c "$pane_current_path"
tmux split-pane -h -c "$pane_current_path"
