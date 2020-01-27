#!/usr/bin/env bash
tmux display-message -p "#{pane_current_path}" | xclip
