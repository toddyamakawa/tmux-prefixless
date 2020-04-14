#!/usr/bin/env bash
declare -r CURRENT_DIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
# TODO: Check support for `display-menu`
# TODO: Figure out how to align bottom left
# TODO: Format borders
exec tmux display-menu -y S \
	-T '#[align=centre bold]New Window' \
	'current directory' 'c' "run-shell '$CURRENT_DIR/new-window.bash'" \
	'temp directory'    't' "run-shell '$CURRENT_DIR/new-window.bash $(mktemp -d)'" \
	'from clipboard'    'p' "run-shell '$CURRENT_DIR/new-window.bash $(xclip -o)'" \
	'quit' 'q' ''

