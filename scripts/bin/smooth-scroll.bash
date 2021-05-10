#!/usr/bin/env bash

direction=${1?direction missing}
n=${2-1}
step=5
if [[ "$n" == 'half' ]]; then
	n="$(tmux display-message -p '#{pane_height}')"
	n=$((n/2))

elif [[ "$n" == 'full' ]]; then
	n="$(tmux display-message -p '#{pane_height}')"
fi

while (( n > 0 )); do
	if ((step > n)); then
		tmux send-keys -X -N $n cursor-$direction
		n=0
	else
		tmux send-keys -X -N $step cursor-$direction
		n=$((n-step))
	fi
done

