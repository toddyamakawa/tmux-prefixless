#!/usr/bin/env bash
declare -r CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
declare -r SCRIPTS_DIR="${CURRENT_DIR}/scripts"
"$SCRIPTS_DIR/key-bindings.bash"

