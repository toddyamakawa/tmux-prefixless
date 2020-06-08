#!/usr/bin/env bash

direction=${1?direction missing}
n=${2-1}
if [[ "$n" == 'half' ]]; then
	n="$(tmux display-message -p '#{pane_height}')"
	n=$((n/2))

elif [[ "$n" == 'full' ]]; then
	n="$(tmux display-message -p '#{pane_height}')"
fi

while (( n > 0 )); do
	tmux send-keys -X cursor-$direction
	n=$((n-1))
done

