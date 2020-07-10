#!/usr/bin/env bash
declare -r CURRENT_DIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
# TODO: Check support for `display-menu`
# TODO: Figure out how to align bottom left
# TODO: Format borders

# Options
options=()
options+=('current directory' 'c' "run-shell '$CURRENT_DIR/new-window.bash'")
if (which zsh-nnn &>/dev/null); then
	options+=('nnn' 'n' "new-window 'zsh-nnn'")
fi
if (which xclip &>/dev/null); then
	options+=('from clipboard' 'p' "run-shell '$CURRENT_DIR/new-window.bash $(xclip -o)'")
fi
options+=('temp directory'    't' "run-shell '$CURRENT_DIR/new-window.bash $(mktemp -d)'")

exec tmux display-menu -y S \
	-T '#[align=centre bold]New Window' \
	"${options[@]}"

