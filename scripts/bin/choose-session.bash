#!/usr/bin/env bash

# TODO: If tmux doesn't have support for `display-menu`, run `choose-session` instead

tmux list-sessions -F "#{session_id} '#{session_name}'" \
	| awk '{ cmd="'"'"'switch-client -t "$1"'"'"'"
		key="'"'"'"counter++"'"'"'"
		$1=""
		print $0, key, cmd
	}' \
	| xargs tmux display-menu -y S

