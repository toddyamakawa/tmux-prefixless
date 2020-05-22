#!/usr/bin/env bash

direction=${1?direction missing}
n=${2-1}
while (( n > 0 )); do
	sleep 0.001
	tmux send-keys -X cursor-$direction
	n=$((n-1))
done

