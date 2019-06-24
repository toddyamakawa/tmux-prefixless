#!/usr/bin/env bash
declare -r CURRENT_DIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
declare -r SCRIPTS_DIR="${CURRENT_DIR}/scripts"
source $SCRIPTS_DIR/helpers.sh

function main() {
	tmux-source key-bindings.tmux
	exit 0
}

main

