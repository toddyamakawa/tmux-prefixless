#!/usr/bin/env bash

IFS=$'\n\t'

# Switch to session and exit
function switch_and_exit() {
	local first
	first=$(echo $@ | awk '{print $1}')
	if [[ $first == -n || $first == -p ]]; then
		exec tmux switch-client $first
	else
		exec tmux switch-client -t $first
	fi
	exit 0
}

# List tmux sessions
function list_sessions() {
	tmux list-sessions -F '#{session_id} #{session_name}'
}

# Print failure and exit
function fail_message() {
	tmux display-message "$@"
	exit 0
}

# Switches to first/last session (alphabetically sorted)
direction=${1-first}
if [[ $direction == 'first' ]]; then
	switch_and_exit $(list_sessions | head -1)
elif [[ $direction == 'last' ]]; then
	switch_and_exit $(list_sessions | tail -1)
fi

# Find matches
target=$2
matches=($(list_sessions | awk '$2~/'$target'/'))

if [[ $direction == 'next' ]]; then
	[[ -z $target ]] && switch_and_exit -n
	[[ -z $matches ]] && fail_message "No matches found for '$target'"
	# TODO: Implement search and switch
	switch_and_exit ${matches[0]}

elif [[ $direction == 'prev' ]]; then
	[[ -z $target ]] && switch_and_exit -p
	[[ -z $matches ]] && fail_message "No matches found for '$target'"
	# TODO: Implement search and switch
	switch_and_exit ${matches[0]}

else
	fail_message "Invalid direction '$direction' (valid: first/last/next/prev)"
fi

