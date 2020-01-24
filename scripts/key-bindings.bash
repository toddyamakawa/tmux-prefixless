#!/usr/bin/env bash
declare -r CURRENT_DIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

# ==============================================================================
# CLIENT
# ==============================================================================
tmux bind-key -n M-Q detach-client


# ==============================================================================
# NAVIGATION
# ==============================================================================

# Choose a session
tmux \
	bind-key -n M-a choose-session \; \
	bind-key -n M-A run-shell "$CURRENT_DIR/bin/choose-session.bash"

# Switch to next/previous session with <M-S-j/k>
tmux \
	bind-key -n M-J switch-client -n \; \
	bind-key -n M-K switch-client -p

# Switch to last session
tmux bind-key -n M-_ switch-client -l


